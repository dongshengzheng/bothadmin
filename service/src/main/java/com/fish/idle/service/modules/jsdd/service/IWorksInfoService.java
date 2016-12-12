package com.fish.idle.service.modules.jsdd.service;

import com.baomidou.framework.service.ISuperService;
import com.fish.idle.service.modules.jsdd.entity.GoodsInfo;
import com.fish.idle.service.modules.jsdd.entity.WorksInfo;

/**
 *
 * Works 表数据服务层接口
 *
 */
public interface IWorksInfoService extends ISuperService<WorksInfo> {

    WorksInfo getWorksInfoByGoodsId(Integer id);

}