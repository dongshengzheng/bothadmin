package com.fish.idle.weixin.controller;

import com.fish.idle.weixin.interceptor.OAuthRequired;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;

/**
 * @author Sun.Han
 * @version 1.0
 * @Description:
 * @Date 2016年11月12日
 */
@Controller
@RequestMapping(value = "/pawn")
public class PawnController {
    @Autowired
    private WxMpConfigStorage configStorage;

    @Autowired
    private WxMpService wxMpService;


    /**
     * 用户注册页面
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "user", method = RequestMethod.GET)
    @OAuthRequired
    public String user(HttpSession session) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        return "index";
    }

}

