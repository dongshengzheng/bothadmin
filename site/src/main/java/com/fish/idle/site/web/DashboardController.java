package com.fish.idle.site.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import com.fish.idle.site.entity.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String index(ModelMap map, HttpServletRequest request,
                        @RequestParam(required = false) Integer start,
                        @RequestParam(required = false) Integer length){
        Paging paging = new Paging();
        if(null == start){
            start = 1;
        }
        if(null == length){
            length = 6;
        }
        //首页轮播图
        //首页全部作品(pageSize=6)
        EntityWrapper<Works> ew = getEntityWrapper();
        Page<Works> page = worksService.selectPage(getPage(start,length),ew);
        for (Works item:page.getRecords()){
            if (!StringUtils.isEmpty(item.getImages())){
                String[] imageArr = item.getImages().split(",");
                item.setImages(imgOssPath + imageArr[0]);
            }
        }
        paging.setData(page.getRecords());
        paging.setTotalPages(page.getPages());
        paging.setCurrent(start);
        paging.setPageSize(length);
        map.put("worksPaging",paging);
        return "index";
    }


}
