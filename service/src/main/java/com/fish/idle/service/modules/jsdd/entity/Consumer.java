package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 提供/收藏者
 *
 */
@TableName("dd_consumer")
public class Consumer implements Serializable {

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

	/** 备注信息 */
	private String remarks;

	/** 逻辑删除标记（0：显示；1：隐藏） */
	@TableField(value = "del_flag")
	private String delFlag;

	/** 用户类型 */
	private String type;

	/** 备选名字 */
	private String customer;

	/** 姓名 */
	private String name;

	/** 地址 */
	private String address;

	/** 联系方式 */
	private String phone;

	/** 身份证 */
	private String no;

	/** 备注 */
	private String remark;

	/** 登记/收藏时间 */
	private Date datetime;

	/** 是否公开 */
	private String pub;


	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
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

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCustomer() {
		return this.customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNo() {
		return this.no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getDatetime() {
		return this.datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}

	public String getPub() {
		return this.pub;
	}

	public void setPub(String pub) {
		this.pub = pub;
	}

}