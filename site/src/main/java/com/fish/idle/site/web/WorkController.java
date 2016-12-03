package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by szy on 29/11/2016.
 * 作品
 */
@Controller
@RequestMapping(value = "/works")
public class WorkController {

    @RequestMapping(value = "detail",method = RequestMethod.GET)
    public String detail(){
        return "works/work_detail";
    }


    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(ModelMap map){
        map.put("step",2);
        return "works/work_register";
    }

    @RequestMapping(value = "/edit",method = RequestMethod.GET)
    public String edit(ModelMap map){
        map.put("step",2);
        return "works/work_edit";
    }


    @RequestMapping(value = "getPaging")
    @ResponseBody
    public JSONObject getPaging(){

        return null;
    }




}
