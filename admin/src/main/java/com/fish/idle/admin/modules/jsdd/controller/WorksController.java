package com.fish.idle.admin.modules.jsdd.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.admin.controller.BaseController;
import com.fish.idle.service.modules.jsdd.entity.Consumer;
import com.fish.idle.service.modules.jsdd.entity.Report;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.entity.WorksLevel;
import com.fish.idle.service.modules.jsdd.service.IConsumerService;
import com.fish.idle.service.modules.jsdd.service.IReportService;
import com.fish.idle.service.modules.jsdd.service.IWorksLevelService;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import com.fish.idle.service.modules.jsdd.service.impl.ReportServiceImpl;
import com.fish.idle.service.modules.jsdd.service.impl.WorksServiceImpl;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.DateUtil;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

/**
 * Works 控制层
 */
@Controller
@RequestMapping("works")
public class WorksController extends BaseController {
    protected Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private IWorksLevelService worksLevelService;

    @Autowired
    private IReportService reportService;

    @Autowired
    private IConsumerService consumerService;

    @Autowired
    private IWorksService worksService;

    @Value("${site_path}")
    private String sitePath;

    @RequestMapping
    public String page(ModelMap map) {
        map.put("sitePath",sitePath);
        return "jsdd/works/works_list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject list(Works works) {
            EntityWrapper<Works> ew = getEntityWrapper();
        ew.addFilter("status <> {0}", Const.WORKS_STATUS_DRAFT);
        ew.orderBy("createDate", false);
        if (!StringUtils.isEmpty(works.getName()))
            ew.addFilter("name={0}", works.getName());
        Page<Works> page = worksService.selectPage(getPage(), ew);
        for (Works w : page.getRecords()) {
            Consumer collect = consumerService.selectOne(new EntityWrapper<>(new Consumer(Const.CONSUMER_TYPE_COLLECT, works.getId())));
            w.setCollector(collect.getName());
        }
        return jsonPage(page);
    }

    /**
     * 审核作品
     */
    @RequestMapping(value = "check", method = RequestMethod.POST)
    @ResponseBody
    public Boolean check(Works works) {
        Boolean result = worksService.updateSelectiveById(new Works(works.getId(), works.getStatus()));
        if(result) {
            Works work = worksService.selectById(works.getId());
            Integer targetId = work.getCreateBy();
            AppUser currentUser = getCurrentAppUser();
            logger.error("admin##########################审核作品");
            logger.error("admin##########################currentUser:"+(currentUser==null?"null":currentUser));
            logger.error("admin##########################configStorage.getOauth2redirectUri():"+configStorage.getOauth2redirectUri());
            logger.error("admin##########################currentUser.getId():"+currentUser.getId());
            sendTemplateMsg(targetId,
                    "pEDBw5vP3qqKDInJuYP3eaV38eIH3hXrLmAl8nk2RIw",
                    configStorage.getOauth2redirectUri() + "/mobile/appUserInfo?appUserId=" + currentUser.getId(),
                    "您好，您收到一条新的通知",
                    "作品「" + works.getName() + "」登记申请 ",
                    "审核成功",
                    "原因：符合规范");
        }
        return result;
    }

    /**
     * 作品轮播
     */
    @RequestMapping(value = "slide", method = RequestMethod.POST)
    @ResponseBody
    public Boolean slide(Integer id, Integer slide) {
        Works works = new Works();
        works.setId(id);
        works.setSlide(slide);
        return worksService.updateSelectiveById(works);

    }

    @RequestMapping(value = "/level", method = RequestMethod.GET)
    public String level(@RequestParam Integer worksId, ModelMap map) {
        WorksLevel worksLevel = worksLevelService.selectOne(new WorksLevel(worksId));
        map.put("worksLevel", worksLevel);
        return "jsdd/works/level";
    }


    @RequestMapping(value = "/provider", method = RequestMethod.GET)
    public String provider(@RequestParam Integer worksId, ModelMap map) {
        Consumer provider = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_PROVIDER, worksId));
        map.put("provider", provider);
        return "jsdd/works/provider";
    }

    @RequestMapping(value = "/collect", method = RequestMethod.GET)
    public String collect(@RequestParam Integer worksId, ModelMap map) {
        Consumer collect = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_COLLECT, worksId));
        map.put("collect", collect);
        return "jsdd/works/collect";
    }


    @RequestMapping(value = "/report", method = RequestMethod.GET)
    public String toEdit(@RequestParam Integer worksId, ModelMap map) {
        Report works = reportService.selectOne(new Report(worksId));
        map.put("works", works);
        return "jsdd/works/report";
    }
}