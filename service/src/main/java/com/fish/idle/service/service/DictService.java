package com.fish.idle.service.service;

import com.fish.idle.service.util.PageData;

/**
 * Created by szy on 22/11/2016.
 */
public interface DictService {


    PageData list(PageData pageData)  throws Exception;

    int add(PageData pd) throws Exception;

    PageData getById(PageData pd) throws Exception;

    void updateDicById(PageData pageData) throws Exception;

    int deleteById(Integer id) throws Exception;



}
