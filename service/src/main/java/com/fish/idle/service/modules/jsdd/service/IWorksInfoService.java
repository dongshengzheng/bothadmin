package com.fish.idle.service.modules.jsdd.service;

import com.baomidou.framework.service.ISuperService;

/**
 *
 * Works 表数据服务层接口
 *
 */
public interface IWorksInfoService extends ISuperService<WorksInfo> {

    WorksInfo getWorksInfoByGoodsId(Integer id);

}