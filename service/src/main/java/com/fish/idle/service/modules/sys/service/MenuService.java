package com.fish.idle.service.modules.sys.service;

import com.baomidou.mybatisplus.service.IService;
import com.fish.idle.service.modules.sys.entity.Menu;

import java.util.List;

/**
 * Created by dongs on 2016/11/21.
 */
public interface MenuService extends IService<Menu> {
    List<Menu> getHierarchyByPath(String url);
}
