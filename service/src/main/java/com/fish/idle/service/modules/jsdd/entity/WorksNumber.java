package com.fish.idle.service.modules.jsdd.entity;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fish.idle.service.modules.sys.entity.BaseEntity;

import java.io.Serializable;

/**
 * Created by wanggc on 2017/2/5.
 */
@TableName("dd_works_number")
public class WorksNumber implements Serializable{
    /**
     * 编号id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 最后编号
     */
    private String number;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}
