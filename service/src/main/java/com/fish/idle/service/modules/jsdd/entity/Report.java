package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 评估报告
 *
 */
@TableName("dd_report")
public class Report implements Serializable {

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

	/** 作品Id */
	@TableField(value = "works_id")
	private Integer worksId;

	/** 作品编号 */
	@TableField(value = "works_no")
	private String worksNo;

	/** 描述 */
	private String des;


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

	public Integer getWorksId() {
		return this.worksId;
	}

	public void setWorksId(Integer worksId) {
		this.worksId = worksId;
	}

	public String getWorksNo() {
		return this.worksNo;
	}

	public void setWorksNo(String worksNo) {
		this.worksNo = worksNo;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Report() {
	}

	public Report(Integer worksId) {
		this.worksId = worksId;
	}
}
