package com.fish.idle.weixin.controller;

import com.fish.idle.service.modules.sys.service.UserService;
import com.fish.idle.service.util.PageData;
import com.fish.idle.weixin.interceptor.OAuthRequired;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    private UserService userService;

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
//    @RequestMapping(method = RequestMethod.GET)
//    @OAuthRequired
//    public String user(HttpSession session, ModelMap map) {
//        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
//        map.put("wxMpUser",wxMpUser);
//
//        return "modules/mobile/pawn/login";
//    }

    @RequestMapping(method = RequestMethod.GET)
    @OAuthRequired
    public String toLogin(HttpSession session, ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        PageData user = userService.findByOpenid(openId);
        if (user == null) {
            // TODO create new user with openId, photo and nick and so on...
            // TODO write user into DataBase
            // TODO refer new user to user variable
        }

//        map.put("wxMpUser",wxMpUser);
        map.put("user", user);
        return "redirect:" + configStorage.getOauth2redirectUri() + "/modules/mobile/pawn/mobile/works";
    }
}

