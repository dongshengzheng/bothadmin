package com.fish.idle.service.mapper;

import com.fish.idle.service.entity.Dict;

import java.util.List;

public interface DictMapper {
    int deleteByPrimaryKey(String id);

    int insert(Dict record);

    int insertSelective(Dict record);

    Dict selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Dict record);

    int updateByPrimaryKey(Dict record);

    List<Dict> dictList();
}