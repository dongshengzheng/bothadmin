package com.fish.idle.site.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by szy on 29/11/2016.
 * 用户
 */

@Controller
@RequestMapping(value = "/user")
public class UserController {

    /**
     * 用户详情
     * @return
     */
    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(){
        return "user/user_detail";
    }

    /**
     * 搜索用户结果
     * @return
     */
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String search(HttpServletRequest request){
        return "search/search_user_result";
    }

    /**
     * 用户中心
     * @param request
     * @return
     */
    @RequestMapping(value = "/center",method = RequestMethod.GET)
    public String center(HttpServletRequest request){
        return "user/user_center";
    }



}
