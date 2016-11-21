package com.fish.idle.service.service.impl;

import com.fish.idle.service.entity.Dict;
import com.fish.idle.service.mapper.DictMapper;
import com.fish.idle.service.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dongs on 2016/11/20.
 */
@Transactional(readOnly = false)
@Service
public class DictServiceImpl implements DictService {

    @Autowired
    private DictMapper dictMapper;

    @Override
    public List<Dict> getList() {
        return dictMapper.dictList();
    }
}
