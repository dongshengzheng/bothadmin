package com.fish.idle.service.mapper;

import com.fish.idle.service.entity.User;
import com.fish.idle.service.util.PageData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    PageData getUserInfo(PageData pageData);

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

    void saveIP(PageData pageData);

    void updateLastLogin2(PageData pageData);
}