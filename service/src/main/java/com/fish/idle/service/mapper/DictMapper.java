package com.fish.idle.service.mapper;

import com.fish.idle.service.entity.Dict;
import com.fish.idle.service.util.PageData;

import java.util.List;

public interface DictMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Dict record);

    int insertSelective(Dict record);

    Dict selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dict record);

    int updateByPrimaryKey(Dict record);

    List<Dict> getDicList(PageData pd);

    int getDictCount(PageData pd);
}