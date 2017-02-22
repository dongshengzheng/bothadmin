package com.fish.idle.service.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.fish.idle.service.modules.sys.entity.Dict;

/**
 * Dict 表数据库控制层接口
 */
public interface DictMapper extends BaseMapper<Dict> {

    int findPinZhongIdByValue(String breed);
}