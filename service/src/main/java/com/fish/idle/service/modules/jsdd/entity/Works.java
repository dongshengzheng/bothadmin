package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 物品/作品
 */
@TableName("dd_works")
public class Works implements Serializable {

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 创建者
     */
    @TableField(value = "create_by")
    private Integer createBy;

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
     * 备注信息
     */
    private String remarks;

    /**
     * 逻辑删除标记（0：显示；1：隐藏）
     */
    @TableField(value = "del_flag")
    private String delFlag;

    /**
     * 编号
     */
    private String no;

    /**
     * 是否公开（0：隐藏；1：公开）
     */
    @TableField(value = "public_flag")
    private String publicFlag;

    /**
     * 收藏者
     */
    @TableField(value = "collect_by")
    private String collectBy;

    /**
     * 提供者
     */
    @TableField(value = "provide_by")
    private String provideBy;

    /**
     * 作品名称
     */
    private String name;

    /**
     * 品种
     */
    private String breed;

    /**
     * 作品类型
     */
    private String type;

    /**
     * 长度
     */
    private BigDecimal length;

    /**
     * 宽度
     */
    private BigDecimal width;

    /**
     * 高度
     */
    private BigDecimal height;

    /**
     * 重量
     */
    private BigDecimal weight;

    /**
     * 工艺制作
     */
    @TableField(value = "gy_type")
    private String gyType;

    /**
     * 篆刻级别
     */
    @TableField(value = "level_zk")
    private String levelZk;

    /**
     * 作品诠释
     */
    @TableField(value = "works_meaning")
    private String worksMeaning;

    /**
     * 审核状态
     */
    private String status;

    /**
     * 图片
     */
    private String images;

    /**  */
    private String recommend;

    /**  */
    private String reason;

    /**  */
    private String kqdy;

    /**  */
    private String maker;

    /**  */
    @TableField(value = "make_time")
    private Date makeTime;

    /**
     * 是否轮播 字典表：是，否，随机 （作品轮播：）
     */
    private Integer slide;

    /**
     * 截止日期（和slide联合判断）
     */
    @TableField(value = "slide_till")
    private Date slideTill;

    /**
     * 浏览次数：（ip）
     */
    @TableField(value = "browser_count")
    private Integer browserCount;

    /**
     * 关注数量，冗余字段
     */
    @TableField(exist = false)
    private Integer followCount;

    /**
     * 作品数量，冗余字段
     */
    @TableField(exist = false)
    private Integer worksCount;

    /**
     * 价值
     */
    private BigDecimal value;

    /**
     * 价值有效时间
     */
    @TableField(value = "value_till")
    private Date valueTill;

    /**
     * 是否认证(如果认证了，则页面有大红章，才能在页面显示value)
     */
    private Integer certified;

    /**
     * 作品状态字典表 完成、加工中
     */
    @TableField(value = "working_status")
    private Integer workingStatus;


    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCreateBy() {
        return this.createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return this.createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return this.updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return this.updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getRemarks() {
        return this.remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDelFlag() {
        return this.delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public String getNo() {
        return this.no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getPublicFlag() {
        return this.publicFlag;
    }

    public void setPublicFlag(String publicFlag) {
        this.publicFlag = publicFlag;
    }

    public String getCollectBy() {
        return this.collectBy;
    }

    public void setCollectBy(String collectBy) {
        this.collectBy = collectBy;
    }

    public String getProvideBy() {
        return this.provideBy;
    }

    public void setProvideBy(String provideBy) {
        this.provideBy = provideBy;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBreed() {
        return this.breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public String getGyType() {
        return this.gyType;
    }

    public void setGyType(String gyType) {
        this.gyType = gyType;
    }

    public String getLevelZk() {
        return this.levelZk;
    }

    public void setLevelZk(String levelZk) {
        this.levelZk = levelZk;
    }

    public String getWorksMeaning() {
        return this.worksMeaning;
    }

    public void setWorksMeaning(String worksMeaning) {
        this.worksMeaning = worksMeaning;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImages() {
        return this.images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public String getRecommend() {
        return this.recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getReason() {
        return this.reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getKqdy() {
        return this.kqdy;
    }

    public void setKqdy(String kqdy) {
        this.kqdy = kqdy;
    }

    public String getMaker() {
        return this.maker;
    }

    public void setMaker(String maker) {
        this.maker = maker;
    }

    public Date getMakeTime() {
        return this.makeTime;
    }

    public void setMakeTime(Date makeTime) {
        this.makeTime = makeTime;
    }

    public Integer getSlide() {
        return this.slide;
    }

    public void setSlide(Integer slide) {
        this.slide = slide;
    }

    public Date getSlideTill() {
        return this.slideTill;
    }

    public void setSlideTill(Date slideTill) {
        this.slideTill = slideTill;
    }

    public Integer getBrowserCount() {
        return this.browserCount;
    }

    public void setBrowserCount(Integer browserCount) {
        this.browserCount = browserCount;
    }

    public Integer getFollowCount() {
        return this.followCount;
    }

    public void setFollowCount(Integer followCount) {
        this.followCount = followCount;
    }

    public BigDecimal getValue() {
        return this.value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }

    public Date getValueTill() {
        return this.valueTill;
    }

    public void setValueTill(Date valueTill) {
        this.valueTill = valueTill;
    }

    public Integer getCertified() {
        return this.certified;
    }

    public void setCertified(Integer certified) {
        this.certified = certified;
    }

    public Integer getWorkingStatus() {
        return this.workingStatus;
    }

    public void setWorkingStatus(Integer workingStatus) {
        this.workingStatus = workingStatus;
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

    public Integer getWorksCount() {
        return worksCount;
    }

    public void setWorksCount(Integer worksCount) {
        this.worksCount = worksCount;
    }
}
