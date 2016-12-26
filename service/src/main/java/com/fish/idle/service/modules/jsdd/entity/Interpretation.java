package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 *
 *
 */
@TableName("dd_interpretation")
public class Interpretation implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**  */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**  */
    @TableField(value = "works_id")
    private Integer worksId;

    /**
     * 创建表
     */
    @TableField(value = "user_id")
    private Integer userId;

    /**  */
    private String type;

    /**
     * 诠释有递归
     */
    @TableField(value = "parent_id")
    private Integer parentId;

    /**
     * 想要的分数 选项20 50 100
     */
    @TableField(value = "score_demanded")
    private Integer scoreDemanded;

    /**
     * 是否提交成功
     */
    private Integer status;

    /**  */
    @TableField(value = "deal_date")
    private Date dealDate;

    /**  */
    private String picture;

    /**  */
    @TableField(value = "follow_count")
    private Integer followCount;

    /**
     * 创建时间
     */
    @TableField(value = "create_date")
    private Date createDate;

    /**
     * 更新时间
     */
    @TableField(value = "update_date")
    private Date updateDate;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    private Integer createBy;

    /**
     * 更新者
     */
    @TableField(value = "update_by")
    private Integer updateBy;

    /**
     * 逻辑删除标记（0：显示；1：隐藏）
     */
    @TableField(value = "del_flag")
    private Integer delFlag = 0;

    /**
     * 诠释的图片
     */
    @TableField(exist = false)
    private List<String> imagesUrlList;




    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getWorksId() {
        return this.worksId;
    }

    public void setWorksId(Integer worksId) {
        this.worksId = worksId;
    }

    public Integer getUserId() {
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getParentId() {
        return this.parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getScoreDemanded() {
        return this.scoreDemanded;
    }

    public void setScoreDemanded(Integer scoreDemanded) {
        this.scoreDemanded = scoreDemanded;
    }

    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDealDate() {
        return this.dealDate;
    }

    public void setDealDate(Date dealDate) {
        this.dealDate = dealDate;
    }

    public String getPicture() {
        return this.picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getFollowCount() {
        return this.followCount;
    }

    public void setFollowCount(Integer followCount) {
        this.followCount = followCount;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getCreateBy() {
        return this.createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Integer getUpdateBy() {
        return this.updateBy;
    }

    public void setUpdateBy(Integer updateBy) {
        this.updateBy = updateBy;
    }

    public Integer getDelFlag() {
        return this.delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public List<String> getImagesUrlList() {
        return imagesUrlList;
    }

    public void setImagesUrlList(List<String> imagesUrlList) {
        this.imagesUrlList = imagesUrlList;
    }
}
