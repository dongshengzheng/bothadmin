package com.fish.idle.service.modules.jsdd.service;

import com.fish.idle.service.modules.jsdd.entity.ValueReport;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * ValueReport 表数据服务层接口
 *
 */
public interface IValueReportService extends ISuperService<ValueReport> {

    ValueReport getValueReportByGoodsId(Integer id);


}