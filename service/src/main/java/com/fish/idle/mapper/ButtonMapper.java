package com.fish.idle.mapper;

import com.fish.idle.entity.Button;

public interface ButtonMapper {
    int deleteByPrimaryKey(Integer buttonId);

    int insert(Button record);

    int insertSelective(Button record);

    Button selectByPrimaryKey(Integer buttonId);

    int updateByPrimaryKeySelective(Button record);

    int updateByPrimaryKey(Button record);
}