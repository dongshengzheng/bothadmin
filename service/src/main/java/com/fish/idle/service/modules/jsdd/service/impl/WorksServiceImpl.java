package com.fish.idle.service.modules.jsdd.service.impl;

import com.fish.idle.service.modules.jsdd.entity.WorksNumber;
import com.fish.idle.service.modules.jsdd.mapper.WorksNumberMapper;
import com.fish.idle.service.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.WorksMapper;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.*;

/**
 * Works 表数据服务层接口实现类
 */
@Service
public class WorksServiceImpl extends SuperServiceImpl<WorksMapper, Works> implements IWorksService {
    @Autowired
    WorksMapper worksMapper;

    @Autowired
    WorksNumberMapper worksNumberMapper;

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

    public String getLastNumber(){
        WorksNumber worksNumber = new WorksNumber();
        String number = worksMapper.getLastNumber();
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        if(StringUtils.isEmpty(number)){
            number ="MSWH-" + year + "000001";
            worksNumber.setNumber(number);
            worksNumberMapper.insertSelective(worksNumber);
            return number;
        }
        String year1 = number.substring(5,9);
        int no = Integer.parseInt(number.substring(12,15))+1;
        if(year1.equals(year+"")){
            number = "MSWH-" + year + String.format("%06d",no);
            worksNumber.setNumber(number);
            worksNumberMapper.insertSelective(worksNumber);
            return number;
        }
        number ="MSWH-" + year + "000001";
        worksNumber.setNumber(number);
        worksNumberMapper.insertSelective(worksNumber);
        return number;
    }
}