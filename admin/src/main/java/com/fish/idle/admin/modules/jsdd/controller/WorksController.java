package com.fish.idle.admin.modules.jsdd.controller;

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
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * Works 控制层
 *
 */
@Controller
@RequestMapping("works")
public class WorksController {

    @Autowired
    private IWorksLevelService worksLevelService;

    @Autowired
    private IReportService reportService;

    @Autowired
    private IConsumerService consumerService;

    @Autowired
    private IWorksService worksService;

    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public String info(@RequestParam Integer id, ModelMap map) {
       Works works = worksService.selectById(id);
        map.put("works", works);
        return "jsdd/works/info";
    }

    @RequestMapping(value = "/level", method = RequestMethod.GET)
    public String level(@RequestParam Integer worksId, ModelMap map) {
        WorksLevel worksLevel = worksLevelService.selectOne(new WorksLevel(worksId));
        map.put("worksLevel", worksLevel);
        return "jsdd/works/level";
    }


    @RequestMapping(value = "/provider", method = RequestMethod.GET)
    public String provider(@RequestParam Integer worksId, ModelMap map) {
        Consumer provider = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_PROVIDER,worksId));
        map.put("provider", provider);
        return "jsdd/works/provider";
    }

    @RequestMapping(value = "/collect", method = RequestMethod.GET)
    public String collect(@RequestParam Integer worksId, ModelMap map) {
        Consumer collect = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_COLLECT,worksId));
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