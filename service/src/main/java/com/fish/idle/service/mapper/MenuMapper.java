package com.fish.idle.service.mapper;

import com.fish.idle.service.entity.Menu;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface MenuMapper {
    List<Menu> findParentMenusByUserId(int userId);

    List<Menu> findMenusByUserIdAndParent(int userId);

    int count(PageData pageData);

    List<PageData> list(PageData pageData);

    List<PageData> listBy(PageData pageData);

    void add(PageData pageData);

    List<PageData> getById(int menuId);

    Menu getMenuById(int menuId);

    Menu getByPath(String url);

    void edit(PageData pageData);

    void delete(int menuId);

    void batchDelete(List<PageData> list);
}