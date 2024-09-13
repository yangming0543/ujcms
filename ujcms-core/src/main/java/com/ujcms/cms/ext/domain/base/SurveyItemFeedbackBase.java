package com.ujcms.cms.ext.domain.base;

import io.swagger.v3.oas.annotations.media.Schema;
import java.io.Serializable;
import javax.validation.constraints.NotNull;
import org.springframework.lang.Nullable;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class SurveyItemFeedbackBase implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "survey_item_feedback";

    /**
     * 主键ID
     */
    @NotNull
    @Schema(description="主键ID")
    private Long id = 0L;

    /**
     * 问卷选项ID
     */
    @NotNull
    @Schema(description="问卷选项ID")
    private Long surveyItemId = 0L;

    /**
     * 问卷反馈ID
     */
    @NotNull
    @Schema(description="问卷反馈ID")
    private Long surveyFeedbackId = 0L;

    /**
     * 问卷ID
     */
    @NotNull
    @Schema(description="问卷ID")
    private Long surveyId = 0L;

    /**
     * 回答
     */
    @Nullable
    @Schema(description="回答")
    private String answer;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSurveyItemId() {
        return surveyItemId;
    }

    public void setSurveyItemId(Long surveyItemId) {
        this.surveyItemId = surveyItemId;
    }

    public Long getSurveyFeedbackId() {
        return surveyFeedbackId;
    }

    public void setSurveyFeedbackId(Long surveyFeedbackId) {
        this.surveyFeedbackId = surveyFeedbackId;
    }

    public Long getSurveyId() {
        return surveyId;
    }

    public void setSurveyId(Long surveyId) {
        this.surveyId = surveyId;
    }

    @Nullable
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(@Nullable String answer) {
        this.answer = answer;
    }
}