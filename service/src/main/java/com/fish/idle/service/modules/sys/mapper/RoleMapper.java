package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.Office;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface RoleMapper extends AutoMapper<Role> {
    List<String> findRolesIdByUserId(String userId);

    int count(PageData pageData);

    List<PageData> list(PageData pageData);

    void add(PageData pageData);

    PageData getById(int roleId);

    void edit(PageData pageData);

    void delete(int roleId);

    void batchDelete(List<Integer> idList);

    List<PageData> listResByRoleId(int roleId);

    List<PageData> listAllRoles();

    void deleteResByRoleId(int roleId);

    void saveRes(List<PageData> list);
}