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
    public String index(ModelMap map){
        return "index";
    }
}
