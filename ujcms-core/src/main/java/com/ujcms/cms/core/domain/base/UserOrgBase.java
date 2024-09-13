package com.ujcms.cms.core.domain.base;

import io.swagger.v3.oas.annotations.media.Schema;
import java.io.Serializable;
import javax.validation.constraints.NotNull;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class UserOrgBase implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "user_org";

    /**
     * 用户ID
     */
    @NotNull
    @Schema(description="用户ID")
    private Long userId = 0L;

    /**
     * 组织ID
     */
    @NotNull
    @Schema(description="组织ID")
    private Long orgId = 0L;

    /**
     * 组织排序
     */
    @NotNull
    @Schema(description="组织排序")
    private Integer order = 999999;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getOrgId() {
        return orgId;
    }

    public void setOrgId(Long orgId) {
        this.orgId = orgId;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }
}