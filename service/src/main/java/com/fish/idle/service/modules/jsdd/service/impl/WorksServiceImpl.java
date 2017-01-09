package com.fish.idle.service.modules.jsdd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.WorksMapper;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/**
 * Works 表数据服务层接口实现类
 */
@Service
public class WorksServiceImpl extends SuperServiceImpl<WorksMapper, Works> implements IWorksService {
    @Autowired
    WorksMapper worksMapper;

    @Override
    public List<Works> transferWorksList(Integer userId) {
        return worksMapper.transferWorksList(userId);
    }

    @Override
    public List<Works> collectionWorksList(Integer userId) {
        return worksMapper.collectionWorksList(userId);
    }

    @Override
    public  List<Works> getSlideImage(){
        List<Works> list = worksMapper.getSlideImage();
        Map<String,Works> map = new HashMap<>();
        List<Works> images = new ArrayList<>();
        for(int i=0;list!=null&&i<list.size();i++){
            Works work = list.get(i);
            if(!map.containsKey(work.getId()+"")){
                map.put(work.getId()+"",work);
                images.add(work);
            }
        }
        return images;
    }
}