package com.fish.idle.service.modules.jsdd.entity;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by szy on 06/12/2016.
 */
@TableName("dd_works_info")
public class WorksInfo implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /** 主键 */
    @TableId(type = IdType.AUTO)
    private String id;

    /** 创建者 */
    @TableField(value = "create_by")
    private String createBy;

    /** 创建时间 */
    @TableField(value = "create_date")
    private Date createDate;

    /** 更新者 */
    @TableField(value = "update_by")
    private String updateBy;

    /** 更新时间 */
    @TableField(value = "update_date")
    private Date updateDate;

    /** 是否删除 */
    @TableField(value = "del_flag")
    private int delFlag = 0;

    /** 物品id */
    @TableField(value = "goods_id")
    private Integer goodsId;

    /** 作品类型 */
    private String type;

    /** 长度 */
    private String length;

    /** 宽度 */
    private String width;

    /** 高度 */
    private String height;

    /** 重量 */
    private String weight;

    /** 工艺制作 */
    @TableField(value = "production_process")
    private String productionProcess;

    /** 篆刻级别 */
    @TableField(value = "seal_cutting_level")
    private String sealCuttingLevel;


    /** 矿区地域 */
    @TableField(value = "mine_area")
    private String mineArea;

    private String producer;


    /** 登记时间 */
    @TableField(value = "produce_time")
    private String produceTime;

    /** 作品诠释*/
    @TableField(value = "works_explanation")
    private String worksExplanation;

    /** 是否是草稿 */
    private int isDraft = 0; //1 是  0 否

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public int getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(int delFlag) {
        this.delFlag = delFlag;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeght() {
        return height;
    }

    public void setHeght(String heght) {
        this.height = heght;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getProductionProcess() {
        return productionProcess;
    }

    public void setProductionProcess(String productionProcess) {
        this.productionProcess = productionProcess;
    }

    public String getSealCuttingLevel() {
        return sealCuttingLevel;
    }

    public void setSealCuttingLevel(String sealCuttingLevel) {
        this.sealCuttingLevel = sealCuttingLevel;
    }

    public String getMineArea() {
        return mineArea;
    }

    public void setMineArea(String mineArea) {
        this.mineArea = mineArea;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getProduceTime() {
        return produceTime;
    }

    public void setProduceTime(String produceTime) {
        this.produceTime = produceTime;
    }

    public String getWorksExplanation() {
        return worksExplanation;
    }

    public void setWorksExplanation(String worksExplanation) {
        this.worksExplanation = worksExplanation;
    }

    public int getIsDraft() {
        return isDraft;
    }

    public void setIsDraft(int isDraft) {
        this.isDraft = isDraft;
    }
}
