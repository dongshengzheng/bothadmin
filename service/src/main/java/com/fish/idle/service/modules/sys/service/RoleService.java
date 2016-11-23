package com.fish.idle.service.modules.sys.service;

import com.fish.idle.service.util.PageData;

import java.util.List;

/**
 * Created by dongs on 2016/11/21.
 */
public interface RoleService {

    PageData list(PageData pd);

    void add(PageData pd);

    PageData getById(Integer roleId);

    void edit(PageData pd);

    Integer delete(Integer roleId);

    Integer batchDelete(PageData pd);

    List<PageData> listTreeData(Integer roleId) throws Exception ;

    void editRight(PageData pd);
}
