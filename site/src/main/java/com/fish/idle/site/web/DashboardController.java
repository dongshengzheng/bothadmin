package com.fish.idle.site.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import com.fish.idle.site.entity.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by szy on 28/11/2016.
 * 首页
 */
@Controller
@RequestMapping("/")
public class DashboardController extends BaseController{

    @Autowired
    private IWorksService worksService;


    @RequestMapping(value = { "", "index" })
    public String index(ModelMap map){

        //首页轮播图

        //首页全部作品(pageSize=6)
        EntityWrapper<Works> ew = getEntityWrapper();
        Page<Works> page = worksService.selectPage(this.<Works>getPage(),ew);
        Paging paging = new Paging();
        paging.setData(page.getRecords());
        paging.setTotals(page.getTotal());
        map.put("worksPaging",paging);
        return "index";
    }

}
