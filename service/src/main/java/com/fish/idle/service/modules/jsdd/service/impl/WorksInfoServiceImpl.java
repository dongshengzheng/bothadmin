package com.fish.idle.service.modules.jsdd.service.impl;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.fish.idle.service.modules.jsdd.service.IWorksInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * Works 表数据服务层接口实现类
 *
 */
@Service
public class WorksInfoServiceImpl extends SuperServiceImpl<WorksInfoMapper, WorksInfo> implements IWorksInfoService {

    @Autowired
    private WorksInfoMapper worksInfoMapper;

    @Override
    public WorksInfo getWorksInfoByGoodsId(Integer id) {
        return worksInfoMapper.getWorksInfoByGoodsId(id);
    }
}