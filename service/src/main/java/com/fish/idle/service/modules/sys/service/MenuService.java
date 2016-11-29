package com.fish.idle.service.modules.sys.service;

import com.baomidou.framework.service.ISuperService;
import com.fish.idle.service.modules.sys.entity.Menu;
import com.fish.idle.service.modules.sys.entity.RoleResource;
import com.fish.idle.service.util.PageData;

import java.util.List;

/**
 * Created by dongs on 2016/11/21.
 */
public interface MenuService extends ISuperService<Menu> {

    PageData list(PageData pd);

    List<PageData> listMenu(PageData pd);

    void add(PageData pd);

    PageData getById(Integer menuId);

    List<Menu> getHierarchyByPath(String url);

    void edit(PageData pd);

    Integer delete(Integer menuId);

    Integer batchDelete(String ids);
}
