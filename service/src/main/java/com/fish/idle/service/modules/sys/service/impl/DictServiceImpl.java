package com.fish.idle.service.modules.sys.service.impl;

import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.mapper.DictMapper;
import com.fish.idle.service.modules.sys.service.IDictService;
import org.springframework.stereotype.Service;

import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * Dict 表数据服务层接口实现类
 *
 */
@Service
public class DictServiceImpl extends SuperServiceImpl<DictMapper, Dict> implements IDictService {

}