package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.util.PageData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends AutoMapper<User> {

    PageData getUserInfo(@Param("pd") PageData pageData);

    void updateLastLogin(User user);

    int count(PageData pageData);

    List<PageData> list(PageData pageData);

    void add(PageData pageData);

    PageData getById(int i);

    List<PageData> getByName(String s);

    void edit(PageData pageData);

    void updatePassword(PageData pageData);

    void delete(int id);

    void batchDelete(List<PageData> list);

    List<PageData> listUserRoleByUserId(int id);

    void deleteUserRoleByUserId(Integer id);

    void saveUserRoles(List list);

    void setSKIN(PageData pageData);

    void saveIP(User user);

    void updateLastLogin2(PageData pageData);

    PageData getByOpenId(String openId);
}