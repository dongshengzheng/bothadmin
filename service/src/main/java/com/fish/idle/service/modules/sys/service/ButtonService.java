package com.fish.idle.service.modules.sys.service;

import com.fish.idle.service.util.PageData;

/**
 * Created by dongs on 2016/11/21.
 */
public interface ButtonService {
    PageData list(PageData pd);
   
    void add(PageData pd);

    PageData getById(Integer buttonId);

    void edit(PageData pd);

    void delete(Integer buttonId);

    void batchDelete(String ids);
}
