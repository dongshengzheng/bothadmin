package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.entity.WorksInfo;
import com.fish.idle.service.modules.jsdd.service.IWorksInfoService;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * Created by szy on 29/11/2016.
 * 作品
 */
@Controller
@RequestMapping(value = "/works")
public class WorkController extends BaseController{

    @Autowired
    private IWorksInfoService worksInfoService;



    @RequestMapping(value = "detail",method = RequestMethod.GET)
    public String detail(){
        return "works/work_detail";
    }


    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String register(ModelMap map){
        map.put("step",1);
        return "works/work_register";
    }

    /**
     * 登记物品信息
     * @param worksInfo
     * @return
     */
    @RequestMapping(value = "/addInfo",method =  RequestMethod.POST)
    public String addWorksInfo(@ModelAttribute WorksInfo worksInfo, ModelMap map){
        boolean result = worksInfoService.insert(worksInfo);
        if(result){
            map.put("success",true);
            map.put("msg","添加成功");
            map.put("type",2);
        }else {
            map.put("success",false);
            map.put("msg","添加失败");
            map.put("type",1);
        }
        return "works/work_register";

    }

    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String edit(ModelMap map){
        map.put("step",2);
        return "works/work_edit";
    }







}
