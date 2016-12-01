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
    List<Menu> getHierarchyByPath(String url);
}
