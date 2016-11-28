package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.Menu;
import com.fish.idle.service.util.PageData;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MenuMapper extends AutoMapper<Menu> {
    List<Menu> findParentMenusByUserId(int userId);

    List<Menu> findMenusByUserIdAndParent(Map<?,?> params);

    int count(PageData pageData);

    List<PageData> list(PageData pageData);

    List<Menu> listBy(Menu menu);

    void add(PageData pageData);

    PageData getById(int menuId);

    Menu getMenuById(int menuId);

    Menu getByPath(String url);

    void edit(PageData pageData);

    void delete(int menuId);

    void batchDelete(List<PageData> list);


}