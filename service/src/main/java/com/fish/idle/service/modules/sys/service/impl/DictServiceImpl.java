package com.fish.idle.service.modules.sys.service.impl;

import com.fish.idle.service.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.mapper.DictMapper;
import com.fish.idle.service.modules.sys.service.IDictService;

import java.util.List;

/**
 * Dict 表数据服务层接口实现类
 */
@Service
public class DictServiceImpl extends SuperServiceImpl<DictMapper, Dict> implements IDictService {

    @Autowired
    DictMapper dictMapper;
    // 获取作品登记字典表
    public String getLabelByValue(String value, String type) {
        EntityWrapper entityWrapper = new EntityWrapper();

        entityWrapper.addFilter("value={0} and type={1}", value, type);

        return selectOne(entityWrapper).getLabel();
    }


    // 获取作品登记字典表
    public List<Dict> getWorksLevelDicByType(String type,String breed) {
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.addFilter("type={0}", type);
        if(StringUtils.isNotEmpty(breed)){
            Integer id = dictMapper.findPinZhongIdByValue(breed);
            entityWrapper.like("parent_id",id+"");
        }
        entityWrapper.orderBy("value");
        List<Dict> list = selectList(entityWrapper);
        return list;
    }

    // 获取作品登记字典表
    public List<Dict> getWorksLevelDicByType(String type) {
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.addFilter("type={0}", type);
        entityWrapper.orderBy("value");
        List<Dict> list = selectList(entityWrapper);
        return list;
    }


    //获取积分具体数值
    public int getPointsByValue(String value, String type) {
        EntityWrapper entityWrapper = new EntityWrapper();

        entityWrapper.addFilter("value={0} and type={1}", value, type);

        return selectOne(entityWrapper).getPoints();
    }
}
