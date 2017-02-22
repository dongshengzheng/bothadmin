package com.fish.idle.service.modules.sys.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;


/**
 * <p>
 * sys_theme对应的实体类，用于保存页面中的主题
 * </p>
 *
 * @author xhj224
 * @since 2017-02-22
 */
@TableName("sys_theme")
public class Theme extends Model<Theme> {

    private static final long serialVersionUID = 1L;

    private Long id; // id
    @TableField("theme_name")
    private String themeName; // 主题名字

    public Theme() {
    }

    public Theme(String themeName) {
        this.themeName = themeName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getThemeName() {
        return themeName;
    }

    public void setThemeName(String themeName) {
        this.themeName = themeName;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
