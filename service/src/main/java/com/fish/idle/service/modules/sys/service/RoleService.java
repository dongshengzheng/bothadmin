package com.fish.idle.service.modules.sys.service;

import com.alibaba.fastjson.JSONArray;
import com.baomidou.framework.service.ISuperService;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.entity.RoleTree;
import com.fish.idle.service.modules.sys.service.impl.RoleServiceImpl;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface RoleService extends ISuperService<Role> {

    void add(PageData pd);

    PageData getById(Integer roleId);

    void edit(PageData pd);

    Integer delete(Integer roleId);

    Integer batchDelete(String ids);

    List<RoleTree> listTreeData(Integer roleId);

    void editRight(String selRes, Integer roleId);
}
