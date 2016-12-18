package com.fish.idle.site.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by szy on 18/12/2016.
 */
public class WorkInfoRequest implements Serializable {

    private static final long serialVersionUID = 1L;
    /** 物品id */
    private Integer goodsId;

    /** 作品品种 */
    private String breed;

    /** 作品类型 */
    private String type;

    /** 长度 */
    private BigDecimal length;

    /** 宽度 */
    private BigDecimal width;

    /** 高度 */
    private BigDecimal height;

    /** 重量 */
    private BigDecimal weight;

    /** 工艺制作 */
    private String productionProcess;

    /** 篆刻级别 */
    private String sealCuttingLevel;

    /** 矿区地域 */
    private String mineArea;

    private String producer;

    /** 登记时间 */
    private Date produceTime;

    /** 作品诠释*/
    private String worksExplanation;

    /** 是否是草稿 */
    private int isDraft = 0; //1 是  0 否

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    public BigDecimal getLength() {
        return length;
    }

    public void setLength(BigDecimal length) {
        this.length = length;
    }

    public BigDecimal getWidth() {
        return width;
    }

    public void setWidth(BigDecimal width) {
        this.width = width;
    }

    public BigDecimal getHeight() {
        return height;
    }

    public void setHeight(BigDecimal height) {
        this.height = height;
    }

    public BigDecimal getWeight() {
        return weight;
    }

    public void setWeight(BigDecimal weight) {
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

    public Date getProduceTime() {
        return produceTime;
    }

    public void setProduceTime(Date produceTime) {
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
