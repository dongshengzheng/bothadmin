package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.fish.idle.service.modules.sys.entity.Button;

import java.util.List;

public interface ButtonMapper extends BaseMapper<Button> {
    List<Button> findButtonsByUserId(Integer userId);

}