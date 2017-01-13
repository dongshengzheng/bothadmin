package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.util.Const;
import me.chanjar.weixin.common.api.WxConsts;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import me.chanjar.weixin.mp.bean.result.WxMpOAuth2AccessToken;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.impl.Log4JLogger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;


@Controller
public class LoginController extends BaseController {

    @Autowired
    private IAppUserService appUserService;

    @Autowired
    private WxMpService wxMpService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String detail() {
        return "user/login";
    }

    @RequestMapping(value = "/loginOut", method = RequestMethod.GET)
    public String loginOut() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/";
    }

    @RequestMapping(value = "/wx_login", method = RequestMethod.GET)
    public String wxLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        String resultUrl = request.getRequestURL().toString();
        String param = request.getQueryString();
        if (param != null) {
            resultUrl += "?" + param;
        }
        WxMpUser wxMpUser = new WxMpUser();
        if (StringUtils.isEmpty(code)) {
            response.sendRedirect(wxMpService.oauth2buildAuthorizationUrl(resultUrl, WxConsts.OAUTH2_SCOPE_USER_INFO, null));
        } else {
            WxMpOAuth2AccessToken accessToken = null;
            try {
                accessToken = wxMpService.oauth2getAccessToken(code);
                wxMpUser = wxMpService.oauth2getUserInfo(accessToken, null);
                System.out.println("accessToken:" + accessToken + "---------");
                System.out.println("wxMpUser:" + wxMpUser + "---------");
            } catch (WxErrorException e) {
                response.sendRedirect(wxMpService.oauth2buildAuthorizationUrl(resultUrl, WxConsts.OAUTH2_SCOPE_USER_INFO, null));
            }
        }

        AppUser user = new AppUser();
        user.setOpenId(wxMpUser.getOpenId());
        AppUser appUser = appUserService.selectOne(user);
        if (appUser == null) {
            appUser = new AppUser();
            appUser.setLoginName(filterEmoji(wxMpUser.getNickname()));
            appUser.setPassword("iLoveMoney");
            appUser.setName(filterEmoji(wxMpUser.getNickname()));
            appUser.setDelFlag(Const.DEL_FLAG_NORMAL);
            appUser.setOpenId(wxMpUser.getOpenId());
            appUser.setLastLogin(new Date());
            appUser.setHeadImgUrl(wxMpUser.getHeadImgUrl());
            appUserService.insert(appUser);
        } else {
            appUser.setLastLogin(new Date());
            appUserService.updateSelectiveById(appUser);
        }
        appUserService.insert(user);
        Subject subject = SecurityUtils.getSubject();
        Session session = subject.getSession();
        session.setAttribute(Const.SITE_SESSION_USER, user);
        session.setAttribute("wxMpUser", wxMpUser);
        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword());
        JSONObject jsonObject = new JSONObject();
        try {
            subject.login(token);
        } catch (AuthenticationException e) {
            jsonObject.put("suc", false);
        }
        jsonObject.put("suc", true);

        session.setAttribute(Const.SITE_SESSION_USER, user);

        return "redirect:/";
    }


    /**
     * 请求登录，验证用户
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject login(String loginName, String password) throws Exception {
        JSONObject jsonObject = new JSONObject();
        String errInfo = "";
        String passwd = new SimpleHash("SHA-1", loginName, password).toString(); // 密码加密
        AppUser user = new AppUser();
        user.setLoginName(loginName);
        user.setPassword(passwd);
        user = appUserService.selectOne(new EntityWrapper<>(user));
        // 用于验证用户名和密码，改方法名需要改良
        if (user != null) {
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession();
            session.setAttribute(Const.SITE_SESSION_USER, user);
            // shiro加入身份验证
            UsernamePasswordToken token = new UsernamePasswordToken(loginName, password);
            try {
                subject.login(token);
            } catch (AuthenticationException e) {
                errInfo = "身份验证失败！";
            }
        } else {
            errInfo = "用户名或密码有误";
        }
        jsonObject.put("result", errInfo);

        return jsonObject;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject register(AppUser user) throws Exception {
        JSONObject jsonObject = new JSONObject();
        user.setLoginName(user.getLoginName().toLowerCase());

        if (appUserService.isNameExist(user.getLoginName())) {
            jsonObject.put("suc", false);
            jsonObject.put("message", "用户名重复，请修改");
        } else {
            String password = new SimpleHash("SHA-1", user.getLoginName(), user.getPassword()).toString();
            user.setPassword(password);

            appUserService.insert(user);
            Subject subject = SecurityUtils.getSubject();
            Session session = subject.getSession();
            session.setAttribute(Const.SITE_SESSION_USER, user);
            UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword());
            try {
                subject.login(token);
            } catch (AuthenticationException e) {
                jsonObject.put("suc", false);
            }
            jsonObject.put("suc", true);
        }
        return jsonObject;
    }


    @RequestMapping(value = "/terms", method = RequestMethod.GET)
    public String terms() {
        return "user/terms";
    }

    @RequestMapping(value = "/loginStatus", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject loginStatus() {
        JSONObject jsonObject = new JSONObject();
        AppUser user = getCurrentUser();
        if (user == null) {
            jsonObject.put("suc", false);
        } else {
            jsonObject.put("suc", true);
            jsonObject.put("loginName", user.getLoginName());
        }
        return jsonObject;
    }


    public static String filterEmoji(String source) {
        if (org.apache.commons.lang.StringUtils.isNotBlank(source)) {
            return source.replaceAll("[\\ud800\\udc00-\\udbff\\udfff\\ud800-\\udfff]", "*");
        } else {
            return source;
        }
    }

}
