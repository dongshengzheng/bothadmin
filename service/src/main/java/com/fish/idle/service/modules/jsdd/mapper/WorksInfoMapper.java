package com.fish.idle.service.modules.jsdd.mapper;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.fish.idle.service.modules.jsdd.entity.GoodsInfo;
import com.fish.idle.service.modules.jsdd.entity.WorksInfo;

/**
 *
 * Works 表数据库控制层接口
 *
 */
public interface WorksInfoMapper extends AutoMapper<WorksInfo> {

    WorksInfo getWorksInfoByGoodsId(Integer id);


}