package com.fish.idle.site.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by szy on 28/11/2016.
 * 首页
 */
@Controller
@RequestMapping("/main")
public class MainController {


    @RequestMapping("")
    public String index(){
        return "index";
    }




}
