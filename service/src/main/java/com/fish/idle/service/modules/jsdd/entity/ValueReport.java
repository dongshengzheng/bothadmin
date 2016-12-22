package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 评估报告
 */
@TableName("dd_value_report")
public class ValueReport implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 价值报告id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;
    /**  */
    @TableField(value = "works_id")
    private Integer worksId;

    /**
     * 作品详细评估报告图片
     */
    @TableField(value = "zpxx_imge")
    private String zpxxImge;

    /**
     * 作品价值认证图片
     */
    @TableField(value = "jzrz_imge")
    private String jzrzImge;

    /**
     * 作品有效时间
     */
    private Date jzyxsj;

    //详细作品评估报告描述
    private String description;
    /**
     * 创建者
     */
    @TableField(value = "create_by")
    private String createBy;

    /**
     * 创建时间
     */
    @TableField(value = "create_date")
    private Date createDate;

    /**
     * 更新者
     */
    @TableField(value = "update_by")
    private String updateBy;

    /**
     * 更新时间
     */
    @TableField(value = "update_date")
    private Date updateDate;

    /**
     * 逻辑删除标记（0：显示；1：隐藏）
     */
    @TableField(value = "del_flag")
    private Integer delFlag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getWorksId() {
        return worksId;
    }

    public void setWorksId(Integer worksId) {
        this.worksId = worksId;
    }

    public String getZpxxImge() {
        return zpxxImge;
    }

    public void setZpxxImge(String zpxxImge) {
        this.zpxxImge = zpxxImge;
    }

    public String getJzrzImge() {
        return jzrzImge;
    }

    public void setJzrzImge(String jzrzImge) {
        this.jzrzImge = jzrzImge;
    }

    public Date getJzyxsj() {
        return jzyxsj;
    }

    public void setJzyxsj(Date jzyxsj) {
        this.jzyxsj = jzyxsj;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
