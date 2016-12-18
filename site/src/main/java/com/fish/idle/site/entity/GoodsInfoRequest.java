package com.fish.idle.site.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by szy on 18/12/2016.
 */
public class GoodsInfoRequest implements Serializable {

    private static final long serialVersionUID = 1L;

    /** 作品名称 */
    private String name;

    /** 提供者 */
    private String provideBy;

    /** 提供者 */
    private String cardNo;

    /** 联系地址 */
    private String address;

    /** 联系方式 */
    private String contact;

    /** 登记时间 */
    private Date registerTime;

    /** 登记描述*/
    private String description;

    /** 图片链接 */
    private String imgs;

    /** 是否是草稿 */
    private int isDraft = 0; //1 是  0 否

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvideBy() {
        return provideBy;
    }

    public void setProvideBy(String provideBy) {
        this.provideBy = provideBy;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs;
    }

    public int getIsDraft() {
        return isDraft;
    }

    public void setIsDraft(int isDraft) {
        this.isDraft = isDraft;
    }
}
