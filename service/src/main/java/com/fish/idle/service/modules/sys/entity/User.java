package com.fish.idle.service.modules.sys.entity;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


/**
 * @author Sun.Han
 * @version 1.0
 * @FileName User.java
 * @Description:
 * @Date 2015年4月30日
 */
@TableName("sys_user")
public class User implements Serializable {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id; // 用户id
    @TableField(value = "login_name")
    private String loginName; // 用户名
    private String password; // 密码
    private String name; // 姓名
    @TableField(value = "last_login")
    private Date lastLogin; // 最后登录时间
    private String ip; // 用户登录ip地址
    private Integer delFlag; // 状态
    private String description; // 描述
    private String email; // 邮箱
    private String phone; // 电话号码
    private Integer score;//积分

    @TableField(value = "open_id")
    private String openId; // 微信openId
    @TableField(exist = false)
    private List<Role> roles;

    @TableField(exist = false)
    private String roleIds;


    // 业务字段

    @TableField(exist = false)
    private int followCount;


    @TableField(exist = false)
    private int worksCount;

    public int getWorksCount() {
        return worksCount;
    }

    public void setWorksCount(int worksCount) {
        this.worksCount = worksCount;
    }

    public int getFollowCount() {
        return followCount;
    }

    public void setFollowCount(int followCount) {
        this.followCount = followCount;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}
