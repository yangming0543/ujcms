package com.ujcms.cms.ext.domain.base;

import io.swagger.v3.oas.annotations.media.Schema;
import java.io.Serializable;
import java.time.OffsetDateTime;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import org.springframework.lang.Nullable;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class ExampleBase implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "example";

    /**
     * ID
     */
    @NotNull
    @Schema(description="ID")
    private Long id = 0L;

    /**
     * 名称
     */
    @Length(max = 30)
    @Nullable
    @Schema(description="名称")
    private String name;

    /**
     * 描述
     */
    @Length(max = 150)
    @Nullable
    @Schema(description="描述")
    private String description;

    /**
     * 身高
     */
    @Nullable
    @Schema(description="身高")
    private Integer height;

    /**
     * 出生日期
     */
    @Nullable
    @Schema(description="出生日期")
    private OffsetDateTime birthday;

    /**
     * 是否启用
     */
    @NotNull
    @Schema(description="是否启用")
    private Boolean enabled = true;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Nullable
    public String getName() {
        return name;
    }

    public void setName(@Nullable String name) {
        this.name = name;
    }

    @Nullable
    public String getDescription() {
        return description;
    }

    public void setDescription(@Nullable String description) {
        this.description = description;
    }

    @Nullable
    public Integer getHeight() {
        return height;
    }

    public void setHeight(@Nullable Integer height) {
        this.height = height;
    }

    @Nullable
    public OffsetDateTime getBirthday() {
        return birthday;
    }

    public void setBirthday(@Nullable OffsetDateTime birthday) {
        this.birthday = birthday;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}