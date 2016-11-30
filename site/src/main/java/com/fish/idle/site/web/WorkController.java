package com.fish.idle.site.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    public String register(){
        return "works/work_register";
    }

}
