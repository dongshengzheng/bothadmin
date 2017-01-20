package com.fish.idle.admin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.User;

import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.util.Const;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpTemplateMsgService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName BaseController.java
 * @Description: Controller基类
 * @Date Apr 17, 2015
 */
public class BaseController {

    @Autowired
    protected IAppUserService appUserService;

    @Autowired
    protected WxMpTemplateMsgService wxMpTemplateMsgService;

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpSession session;

    @Autowired
    protected ServletContext application;
    public HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    /**
     * @param binder
     * @Title: initBinder
     * @Description:日期格式转换
     * @date Apr 17, 2015
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }


    public User getCurrentUser() {
        Subject subject = SecurityUtils.getSubject();
        return (User) subject.getPrincipal();
    }

    /**
     * <p>
     * 转换为 bootstrap-table 需要的分页格式 JSON
     * </p>
     *
     * @param page 分页对象
     * @return
     */
    protected JSONObject jsonPage(Page<?> page) {
        JSONObject jo = new JSONObject();
        jo.put(Const.DRAW, request.getParameter(Const.DRAW));
        jo.put(Const.RECORDSTOTAL, page.getTotal());
        jo.put(Const.RECORDSFILTERED, page.getTotal());
        jo.put(Const.NDATA, page.getRecords());
        return jo;
    }

    /**
     * <p>
     * 获取分页对象
     * </p>
     *
     * @return
     */
    protected <T> Page<T> getPage() {
        int start = 0;
        int length = 10;
        if (request.getParameter(Const.LENGTH) != null) {
            start = Integer.parseInt(request.getParameter(Const.START));
        }
        if (request.getParameter(Const.LENGTH) != null) {
            length = Integer.parseInt(request.getParameter(Const.LENGTH));
        }
        return new Page<>(start / length + 1, length);
    }

    protected <T> EntityWrapper<T>  getEntityWrapper(){
        EntityWrapper<T> ew = new EntityWrapper<>();
        ew.where("del_flag={0}", Const.DEL_FLAG_NORMAL);
        return ew;
    }

    /**
     * 返回 JSON 格式对象
     *
     * @param object 转换对象
     * @return
     */
    protected String toJson(Object object) {
        return JSON.toJSONString(object, SerializerFeature.BrowserCompatible);
    }


    /**
     * 返回 JSON 格式对象
     *
     * @param object 转换对象
     * @param format 序列化特点
     * @return
     */
    protected String toJson(Object object, String format) {
        if (format == null) {
            return toJson(object);
        }
        return JSON.toJSONStringWithDateFormat(object, format, SerializerFeature.WriteDateUseDateFormat);
    }

    //发送模板消息
    public void sendTemplateMsg(int targetId, String templateId, String url, String first, String keyword1, String keyword2, String remark) {
        AppUser targetUser = appUserService.selectById(targetId);
        WxMpTemplateMessage templateMessage = new WxMpTemplateMessage();
        templateMessage.setToUser("oP3FIwQWG5A-w_1Tqmxls1TK2cDU");
        templateMessage.setTemplateId(templateId);
        templateMessage.setUrl(url);
        templateMessage.setTopColor("#000000");
        templateMessage.getData().add(new WxMpTemplateData("first", first, "#000000"));
        templateMessage.getData().add(new WxMpTemplateData("keyword1", keyword1));
        templateMessage.getData().add(new WxMpTemplateData("keyword2", keyword2));
        templateMessage.getData().add(new WxMpTemplateData("remark", remark, "#000000"));
        try {
            wxMpTemplateMsgService.sendTemplateMsg(templateMessage);
        } catch (WxErrorException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取当前管理员的app用户信息
     * @return
     */
    public AppUser getCurrentAppUser(){
        User user = getCurrentUser();
        String openId = user.getOpenId();
        AppUser appUser = new AppUser();
        appUser.setOpenId(openId);
        return appUserService.selectOne(appUser);
    }
}
