package com.fish.idle.service.modules.jsdd.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 作品等级
 *
 */
@TableName("dd_works_level")
public class WorksLevel implements Serializable {

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
	private String worksId;

	/** 质地 */
	private String zhidi;

	/** 质地二 */
	private String zhidi2;

	/** 感官 */
	private String ganguan;

	/** 磨氏度 */
	private String moshidu;

	/** 血量 */
	private String xueliang;

	/** 血色 */
	private String xuese;

	/** 血形 */
	private String xuexing;

	/** 浓艳度 */
	private String nongyandu;

	/** 精度 */
	private String jingdu;

	/** 地色 */
	private String dise;

	/** 绺 */
	private String liu;

	/** 裂 */
	private String lie;

	/** 原石含血量 */
	private String inithanxueliang;

	/** 印章含血面 */
	private String hanxuemian;

	/** 雕件含血量 */
	private String hanxueliang;

	/**  */
	private String hanxuefangshi;


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

	public String getWorksId() {
		return this.worksId;
	}

	public void setWorksId(String worksId) {
		this.worksId = worksId;
	}

	public String getZhidi() {
		return this.zhidi;
	}

	public void setZhidi(String zhidi) {
		this.zhidi = zhidi;
	}

	public String getZhidi2() {
		return this.zhidi2;
	}

	public void setZhidi2(String zhidi2) {
		this.zhidi2 = zhidi2;
	}

	public String getGanguan() {
		return this.ganguan;
	}

	public void setGanguan(String ganguan) {
		this.ganguan = ganguan;
	}

	public String getMoshidu() {
		return this.moshidu;
	}

	public void setMoshidu(String moshidu) {
		this.moshidu = moshidu;
	}

	public String getXueliang() {
		return this.xueliang;
	}

	public void setXueliang(String xueliang) {
		this.xueliang = xueliang;
	}

	public String getXuese() {
		return this.xuese;
	}

	public void setXuese(String xuese) {
		this.xuese = xuese;
	}

	public String getXuexing() {
		return this.xuexing;
	}

	public void setXuexing(String xuexing) {
		this.xuexing = xuexing;
	}

	public String getNongyandu() {
		return this.nongyandu;
	}

	public void setNongyandu(String nongyandu) {
		this.nongyandu = nongyandu;
	}

	public String getJingdu() {
		return this.jingdu;
	}

	public void setJingdu(String jingdu) {
		this.jingdu = jingdu;
	}

	public String getDise() {
		return this.dise;
	}

	public void setDise(String dise) {
		this.dise = dise;
	}

	public String getLiu() {
		return this.liu;
	}

	public void setLiu(String liu) {
		this.liu = liu;
	}

	public String getLie() {
		return this.lie;
	}

	public void setLie(String lie) {
		this.lie = lie;
	}

	public String getInithanxueliang() {
		return this.inithanxueliang;
	}

	public void setInithanxueliang(String inithanxueliang) {
		this.inithanxueliang = inithanxueliang;
	}

	public String getHanxuemian() {
		return this.hanxuemian;
	}

	public void setHanxuemian(String hanxuemian) {
		this.hanxuemian = hanxuemian;
	}

	public String getHanxueliang() {
		return this.hanxueliang;
	}

	public void setHanxueliang(String hanxueliang) {
		this.hanxueliang = hanxueliang;
	}

	public String getHanxuefangshi() {
		return this.hanxuefangshi;
	}

	public void setHanxuefangshi(String hanxuefangshi) {
		this.hanxuefangshi = hanxuefangshi;
	}

}