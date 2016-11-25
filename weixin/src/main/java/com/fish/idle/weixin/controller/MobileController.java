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

import java.util.Date;

/**
 * @author Sun.Han
 * @version 1.0
 * @Description:
 * @Date 2016年11月12日
 */
@Controller
@RequestMapping(value = "/mobile")
public class MobileController {
    @Autowired
    private UserService userService;

    @Autowired
    private WxMpConfigStorage configStorage;

    @Autowired
    private WxMpService wxMpService;

    @RequestMapping(method = RequestMethod.GET)
    @OAuthRequired
    public String toLogin(HttpSession session, ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        PageData user = userService.findByOpenid(openId);
        if (user == null || user.isEmpty()) {
            user = new PageData();
            user.put("loginName", wxMpUser.getNickname());
            user.put("password", "iLoveMoney");
            user.put("name", wxMpUser.getNickname());
            user.put("status", "1");
            user.put("description", "");
            user.put("email", "");
            user.put("phone", "");
            user.put("openId", wxMpUser.getOpenId());

            userService.add(user);
        }
        user.put("lastLogin", new Date().toString());
        userService.updateLastLogin(user);

        map.put("user", user);
//        return "redirect:" + configStorage.getOauth2redirectUri() + "/modules/mobile/pawn/mobile/works";
        return "/modules/mobile/pawn/works";
    }
}

