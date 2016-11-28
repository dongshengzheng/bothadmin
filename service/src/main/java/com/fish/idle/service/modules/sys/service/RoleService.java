package com.fish.idle.service.modules.sys.service;

import com.baomidou.framework.service.ISuperService;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface RoleService  extends ISuperService<Role> {

    void add(PageData pd);

    PageData getById(Integer roleId);

    void edit(PageData pd);

    Integer delete(Integer roleId);

    Integer batchDelete(String ids);

    List<PageData> listTreeData(Integer roleId) throws Exception ;

    void editRight(PageData pd);
}
