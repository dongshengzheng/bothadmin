package com.fish.idle.admin.system.controller;

import com.alibaba.fastjson.JSONObject;
import com.fish.idle.admin.base.util.PageData;
import com.fish.idle.service.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by dongs on 2016/11/20.
 */
@Controller
@RequestMapping("/dict")
public class DictController {
    @Autowired
    private DictService dictService;
    @RequestMapping
    public String dictList(ModelMap modelMap) {
        modelMap.put("list", dictService.getList());
        return "dictList";
    }

//    @RequestMapping
//    @ResponseBody
//    public PageData dictList() {
//
//    }
}
