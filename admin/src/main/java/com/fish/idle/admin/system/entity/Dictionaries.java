package com.fish.idle.admin.system.entity;

/**
 * Created by szy on 21/11/2016.
 *
 * 字典实体
 */

import java.util.List;

public class Dictionaries extends BaseEntity{

    private Integer id;			//主键
    private String value;			//数据值
    private String label;			//标签名
    private String type;		//类型
    private String parent_id;		//上级ID
    private String description;				//描述
    private String sort;			//排序
    private String remarks;         //备注信息

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

}