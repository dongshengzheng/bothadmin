package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import com.fish.idle.service.modules.sys.service.UserService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import com.fish.idle.weixin.interceptor.OAuthRequired;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    private IWorksService worksService;

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
        user.put("lastLogin", DateFormatUtils.format(new Date(), "yyyy-MM-dd"));
        userService.updateLastLogin(user);

        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/works";
    }

    /**
     * 作品列表
     *
     * @return
     */
    @RequestMapping(value = "works", method = RequestMethod.GET)
    @OAuthRequired
    public String works(HttpSession session,
                        Works works,
                        HttpServletRequest request,
                        HttpServletResponse response,
                        ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        PageData user = userService.findByOpenid(openId);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setStatus(Const.WORKS_STATUS_PASS);
        Page<Works> page = new Page<>(1, 4);
        page = worksService.selectPage(page, new EntityWrapper<>(works));
        map.put("page", page);
        return "modules/mobile/pawn/works";
    }

}

