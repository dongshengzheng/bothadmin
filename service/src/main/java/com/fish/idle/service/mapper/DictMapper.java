package com.fish.idle.service.mapper;

import com.fish.idle.service.entity.Dict;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface DictMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Dict record);

    int save(PageData pd);

    int deleteById(Integer id);

    PageData getById(PageData pd);

    int insertSelective(Dict record);

    PageData selectByPrimaryKey(Integer id);

    PageData updateDicById(PageData pd);

    int updateByPrimaryKeySelective(Dict record);

    int updateByPrimaryKey(Dict record);

    List<Dict> getDicList(PageData pd);

    int getDictCount(PageData pd);
}