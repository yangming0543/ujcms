package com.ujcms.cms.core.web.backendapi;

import com.fasterxml.jackson.annotation.JsonView;
import com.ujcms.cms.core.aop.annotations.OperationLog;
import com.ujcms.cms.core.aop.enums.OperationType;
import com.ujcms.cms.core.component.TemplateService;
import com.ujcms.cms.core.domain.Article;
import com.ujcms.cms.core.domain.Channel;
import com.ujcms.cms.core.domain.Site;
import com.ujcms.cms.core.domain.User;
import com.ujcms.cms.core.domain.base.GroupBase;
import com.ujcms.cms.core.domain.base.RoleBase;
import com.ujcms.cms.core.generator.HtmlGenerator;
import com.ujcms.cms.core.mapper.GroupAccessMapper;
import com.ujcms.cms.core.mapper.RoleArticleMapper;
import com.ujcms.cms.core.mapper.RoleChannelMapper;
import com.ujcms.cms.core.service.ChannelService;
import com.ujcms.cms.core.service.GroupService;
import com.ujcms.cms.core.service.RoleService;
import com.ujcms.cms.core.service.args.ChannelArgs;
import com.ujcms.cms.core.support.Contexts;
import com.ujcms.cms.core.support.UrlConstants;
import com.ujcms.cms.core.web.support.MoveParams;
import com.ujcms.cms.core.web.support.ValidUtils;
import com.ujcms.commons.db.tree.TreeSortEntity;
import com.ujcms.commons.web.Entities;
import com.ujcms.commons.web.Responses;
import com.ujcms.commons.web.Responses.Body;
import com.ujcms.commons.web.Servlets;
import com.ujcms.commons.web.Views;
import com.ujcms.commons.web.exception.Http400Exception;
import com.ujcms.commons.web.exception.Http404Exception;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import static com.ujcms.cms.core.support.Contexts.getCurrentSiteId;
import static com.ujcms.commons.query.QueryUtils.getQueryMap;

/**
 * 栏目 Controller
 *
 * @author PONY
 */
@RestController("backendChannelController")
@RequestMapping(UrlConstants.BACKEND_API + "/core/channel")
public class ChannelController {
    private final HtmlGenerator generator;
    private final GroupService groupService;
    private final RoleService roleService;
    private final ChannelService service;
    private final GroupAccessMapper groupAccessMapper;
    private final RoleArticleMapper roleArticleMapper;
    private final RoleChannelMapper roleChannelMapper;
    private final TemplateService templateService;

    @Autowired
    public ChannelController(HtmlGenerator generator, GroupService groupService, RoleService roleService,
                             ChannelService service,
                             GroupAccessMapper groupAccessMapper, RoleArticleMapper roleArticleMapper,
                             RoleChannelMapper roleChannelMapper, TemplateService templateService) {
        this.generator = generator;
        this.groupService = groupService;
        this.roleService = roleService;
        this.service = service;
        this.groupAccessMapper = groupAccessMapper;
        this.roleArticleMapper = roleArticleMapper;
        this.roleChannelMapper = roleChannelMapper;
        this.templateService = templateService;
    }

    @GetMapping
    @JsonView(Views.List.class)
    @PreAuthorize("hasAnyAuthority('channel:list','*')")
    public List<Channel> list(@RequestParam(defaultValue = "false") boolean isArticlePermission,
                              @RequestParam(defaultValue = "true") boolean isIncludeChildren,
                              @RequestParam(defaultValue = "false") boolean isIncludeSelf,
                              Long parentId, Long siteId,
                              HttpServletRequest request) {
        User user = Contexts.getCurrentUser();
        ChannelArgs args = ChannelArgs.of(getQueryMap(request.getQueryString()));
        if (isArticlePermission && !user.hasAllArticlePermission()) {
            args.articlePermission(user.fetchRoleIds(), user.fetchAllOrgIds());
        }
        if (siteId == null) {
            siteId = Contexts.getCurrentSiteId();
        }
        if (isIncludeChildren) {
            if (parentId != null) {
                args.ancestorId(parentId);
            } else {
                args.siteId(siteId);
            }
        } else if (parentId == null) {
            args.siteId(siteId);
            args.parentIdIsNull();
        } else if (isIncludeSelf) {
            args.parentIdAndSelf(parentId);
        } else {
            args.parentId(parentId);
        }
        return service.selectList(args);
    }

    @GetMapping("{id}")
    @PreAuthorize("hasAnyAuthority('channel:show','*')")
    public Channel show(@PathVariable Long id) {
        Channel bean = service.select(id);
        if (bean == null) {
            throw new Http404Exception(Channel.NOT_FOUND + id);
        }
        ValidUtils.dataInSite(bean.getSiteId(), Contexts.getCurrentSiteId());
        return bean;
    }

    @PostMapping
    @PreAuthorize("hasAnyAuthority('channel:create','*')")
    @OperationLog(module = "channel", operation = "create", type = OperationType.CREATE)
    public ResponseEntity<Body> create(@RequestBody @Valid Channel bean, HttpServletRequest request) {
        Site site = Contexts.getCurrentSite();
        User user = Contexts.getCurrentUser();
        bean.setSiteId(site.getId());
        Channel channel = new Channel();
        Entities.copy(bean, channel);
        channel.setCustoms(bean.getCustoms());
        // 默认给所有用户组、角色权限
        List<Long> groupIds = groupService.listNotAllAccessPermission().stream()
                .map(GroupBase::getId).collect(Collectors.toList());
        List<Long> articleRoleIds = roleService.listNotAllArticlePermission(site.getId()).stream()
                .map(RoleBase::getId).collect(Collectors.toList());
        List<Long> channelRoleIds = roleService.listNotAllChannelPermission(site.getId()).stream()
                .map(RoleBase::getId).collect(Collectors.toList());
        Long parentId = bean.getParentId();
        if (parentId != null) {
            // 按上级栏目给权限
            Channel parent = service.select(parentId);
            if (parent != null) {
                groupIds = groupAccessMapper.listGroupByChannelId(parent.getId(), null);
                articleRoleIds = roleArticleMapper.listRoleByChannelId(parent.getId(), null);
                channelRoleIds = roleChannelMapper.listRoleByChannelId(parent.getId(), null);
            }
        }
        service.insert(channel, groupIds, articleRoleIds, channelRoleIds);

        if (site.getHtml().isEnabledAndAuto()) {
            String taskName = Servlets.getMessage(request, "task.html.channelRelated");
            generator.updateChannelRelatedHtml(channel.getSiteId(), user.getId(), taskName, channel.getId());
        }
        return Responses.ok();
    }

    @PutMapping
    @PreAuthorize("hasAnyAuthority('channel:update','*')")
    @OperationLog(module = "channel", operation = "update", type = OperationType.UPDATE)
    public ResponseEntity<Body> update(@RequestBody @Valid Channel bean, HttpServletRequest request) {
        Site site = Contexts.getCurrentSite();
        Channel channel = service.select(bean.getId());
        if (channel == null) {
            return Responses.notFound(Channel.NOT_FOUND + bean.getId());
        }
        ValidUtils.dataInSite(bean.getSiteId(), site.getId());
        User user = Contexts.getCurrentUser();
        Entities.copy(bean, channel, "siteId", "parentId", "order");
        channel.setCustoms(bean.getCustoms());
        service.update(channel, null, null, null);
        if (site.getHtml().isEnabledAndAuto()) {
            String taskName = Servlets.getMessage(request, "task.html.channelRelated");
            generator.updateChannelRelatedHtml(channel.getSiteId(), user.getId(), taskName, channel.getId());
        }
        return Responses.ok();
    }

    @PutMapping("move")
    @PreAuthorize("hasAnyAuthority('channel:update','*')")
    @OperationLog(module = "channel", operation = "move", type = OperationType.UPDATE)
    public ResponseEntity<Body> move(@RequestBody MoveParams params) {
        Long siteId = Contexts.getCurrentSiteId();
        // 检查栏目是否属于当前站点
        Channel from = Optional.ofNullable(service.select(params.getFromId()))
                .orElseThrow(() -> new Http404Exception(Channel.NOT_FOUND + params.getFromId()));
        ValidUtils.dataInSite(from.getSiteId(), siteId);
        Channel to = Optional.ofNullable(service.select(params.getToId()))
                .orElseThrow(() -> new Http404Exception(Channel.NOT_FOUND + params.getToId()));
        ValidUtils.dataInSite(to.getSiteId(), siteId);
        // 不能移动到自己的子节点下
        for (Channel parent : to.getPaths()) {
            if (parent.getId().equals(from.getId())) {
                throw new Http400Exception(String.format("Cannot move Channel(id=%s) to child(id=%s)",
                        params.getFromId(), params.getToId()));
            }
        }
        service.move(from, to, params.getType(), siteId);
        return Responses.ok();
    }

    /**
     * 整理树形结构
     */
    @PutMapping("tidy-tree")
    @PreAuthorize("hasAnyAuthority('channel:tidyTree','*')")
    @OperationLog(module = "channel", operation = "tidyTree", type = OperationType.UPDATE)
    public ResponseEntity<Body> tidyTree() {
        Long siteId = Contexts.getCurrentSiteId();
        List<Channel> list = service.listBySiteIdForTidy(siteId);
        List<TreeSortEntity> tree = service.toTree(list);
        int size = list.size();
        service.tidyTreeOrderAndDepth(tree, size);
        service.deleteRelationBySiteId(siteId);
        service.tidyTreeRelation(tree, size);
        return Responses.ok();
    }

    @DeleteMapping
    @PreAuthorize("hasAnyAuthority('channel:delete','*')")
    @OperationLog(module = "channel", operation = "delete", type = OperationType.DELETE)
    public ResponseEntity<Body> delete(@RequestBody List<Long> ids, HttpServletRequest request) {
        Site site = Contexts.getCurrentSite();
        User user = Contexts.getCurrentUser();
        for (Long id : ids) {
            Channel bean = service.select(id);
            if (bean == null) {
                continue;
            }
            ValidUtils.dataInSite(bean.getSiteId(), site.getId());
            delete(bean);
        }
        if (site.getHtml().isEnabledAndAuto()) {
            String taskName = Servlets.getMessage(request, "task.html.all");
            generator.updateAllHtml(site.getId(), user.getId(), taskName, site);
        }
        return Responses.ok();
    }

    /**
     * 递归删除栏目。不能放到Service里面递归，这样会因事务太大，导致性能低下。
     *
     * @param bean 栏目
     * @return 删除条数
     */
    private int delete(Channel bean) {
        int deleted = 0;
        for (Channel c : service.listChildren(bean.getId())) {
            deleted += delete(c);
        }
        deleted = service.delete(bean);
        return deleted;
    }

    @GetMapping("channel-templates")
    @PreAuthorize("hasAnyAuthority('channel:list','*')")
    public List<String> channelTemplate() throws IOException {
        Site site = Contexts.getCurrentSite();
        String storagePath = site.getConfig().getTemplateStorage().getPath();
        return templateService.getTemplates(storagePath + site.getTheme(), Channel.TEMPLATE_PREFIX);
    }

    @GetMapping("article-templates")
    @PreAuthorize("hasAnyAuthority('channel:list','*')")
    public List<String> articleTemplate() throws IOException {
        Site site = Contexts.getCurrentSite();
        String storagePath = site.getConfig().getTemplateStorage().getPath();
        return templateService.getTemplates(storagePath + site.getTheme(), Article.TEMPLATE_PREFIX);
    }

    @GetMapping("channel-permissions")
    @PreAuthorize("hasAnyAuthority('channel:list','*')")
    public List<Long> channelPermissions(@Nullable Long siteId) {
        User user = Contexts.getCurrentUser();
        Collection<Long> roleIds = user.fetchRoleIds();
        Set<Long> orgIds = user.fetchAllOrgIds();
        return service.listChannelPermissions(roleIds, orgIds, siteId != null ? siteId : getCurrentSiteId());
    }

    @GetMapping("alias-exist")
    public boolean aliasExist(@NotBlank String alias, Long siteId) {
        if (siteId == null) {
            siteId = Contexts.getCurrentSiteId();
        }
        return service.existsByAlias(alias, siteId);
    }
}