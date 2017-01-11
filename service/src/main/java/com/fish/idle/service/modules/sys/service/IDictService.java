package com.fish.idle.service.modules.sys.service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * Dict 表数据服务层接口
 */
public interface IDictService extends ISuperService<Dict> {

    // 获取作品登记字典表
    String getLabelByValue(String value, String type);

    List<Dict> getWorksLevelDicByType(String type,String breed);

    List<Dict> getWorksLevelDicByType(String type);

    //获取积分具体数值
    int getPointsByValue(String value, String type);
}