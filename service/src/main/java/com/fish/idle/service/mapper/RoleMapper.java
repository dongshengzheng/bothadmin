package com.fish.idle.service.mapper;

import com.fish.idle.service.util.PageData;

import java.util.List;

public interface RoleMapper {
    List<String> findRolesIdByUserId(String userId);

    int count(PageData pageData);

    List<PageData> list(PageData pageData);

    void add(PageData pageData);

    PageData getById(int roleId);

    void edit(PageData pageData);

    void delete(int roleId);

    void batchDelete(PageData pageData);

    List<PageData> listResByRoleId(int roleId);

    List<PageData> listAllRoles();

    void deleteResByRoleId(int roleId);

    void saveRes(List<PageData> list);
}