package com.fish.idle.service.mapper;

import com.fish.idle.service.entity.Button;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface ButtonMapper {
    List<Button> findButtonsByUserId(Integer userId);

    int count(PageData pageData);

    List<PageData> list(PageData pageData);

    void add(PageData pageData);

    PageData getById(int buttonId);

    PageData listByMenuId(int menuId);

    void edit(PageData pageData);

    void delete(int buttonId);

    void batchDelete(List<PageData> list);
}