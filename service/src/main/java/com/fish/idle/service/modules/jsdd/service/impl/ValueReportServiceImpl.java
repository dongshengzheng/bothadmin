package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.ValueReportMapper;
import com.fish.idle.service.modules.jsdd.entity.ValueReport;
import com.fish.idle.service.modules.jsdd.service.IValueReportService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * ValueReport 表数据服务层接口实现类
 *
 */
@Service
public class ValueReportServiceImpl extends SuperServiceImpl<ValueReportMapper, ValueReport> implements IValueReportService {

    @Autowired
    private ValueReportMapper valueReportMapper;

    @Override
    public ValueReport getValueReportByGoodsId(Integer id) {
        return valueReportMapper.getValueReportByGoodsId(id);
    }
}