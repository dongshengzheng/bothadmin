package com.fish.idle.weixin.mapper;

import com.fish.idle.weixin.entity.Button;

public interface ButtonMapper {
    int deleteByPrimaryKey(Integer buttonId);

    int insert(Button record);

    int insertSelective(Button record);

    Button selectByPrimaryKey(Integer buttonId);

    int updateByPrimaryKeySelective(Button record);

    int updateByPrimaryKey(Button record);
}