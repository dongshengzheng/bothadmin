package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.GoodsInfo;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IGoodsInfoService;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import com.fish.idle.site.entity.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by szy on 28/11/2016.
 * 首页
 */
@Controller
@RequestMapping("/")
public class DashboardController extends BaseController{

    @Value("${img_oss_path}")
    private String imgOssPath;

    @Autowired
    private IWorksService worksService;


    @RequestMapping(value = { "", "index" })
    public String index(ModelMap map,HttpServletRequest request){
        //首页轮播图
        //首页全部作品(pageSize=6)
        EntityWrapper<Works> ew = getEntityWrapper();
        Page<Works> page = worksService.selectPage(getPage(request),ew);
        for (Works item:page.getRecords()){
            String[] imageArr = item.getImages().split(",");
            item.setImages(imgOssPath + imageArr[0]);
        }
        Paging paging = new Paging();
        paging.setData(page.getRecords());
        paging.setTotalPages(page.getPages());
        paging.setCurrent(page.getCurrent()+1);
        paging.setPageSize(page.getSize());
        map.put("worksPaging",paging);
        return "index";
    }

}
