package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Menu;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface ButtonMapper  extends AutoMapper<Button> {
    List<Button> findButtonsByUserId(Integer userId);

    int count(PageData pageData);

    List<PageData> list(PageData pageData);

    void add(PageData pageData);

    PageData getById(int buttonId);

    List<PageData> listByMenuId(int menuId);

    void edit(PageData pageData);

    void delete(int buttonId);

    void batchDelete(List<PageData> list);
}