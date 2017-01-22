package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.Images;
import com.fish.idle.service.modules.jsdd.service.IImagesService;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.BaseEntity;
import com.fish.idle.service.util.Const;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpTemplateMsgService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by szy on 03/12/2016.
 */
public class BaseController {

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpSession session;

    @Autowired
    protected IImagesService imagesService;

    @Autowired
    protected IAppUserService appUserService;

    @Autowired
    protected WxMpTemplateMsgService wxMpTemplateMsgService;

    @Autowired
    protected IDictService dictService;


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

    protected <T> EntityWrapper<T> getEntityWrapper() {
        EntityWrapper<T> ew = new EntityWrapper<>();
        ew.where("del_flag={0}", Const.DEL_FLAG_NORMAL);
        return ew;
    }

    /**
     * @param binder
     * @Title: initBinder
     * @Description:日期格式转换
     * @date Apr 17, 2015
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }


    public void wrapInsertEntity(BaseEntity baseEntity) {
        int id = getCurrentUser().getId();
        baseEntity.setCreateDate(new Date());
        baseEntity.setCreateBy(id);
        baseEntity.setUpdateBy(id);
        baseEntity.setUpdateDate(new Date());
    }

    public void wrapUpdateEntity(BaseEntity baseEntity) {
        int id = getCurrentUser().getId();
        baseEntity.setUpdateBy(id);
        baseEntity.setUpdateDate(new Date());
    }

    public AppUser getCurrentUser() {
        return (AppUser) session.getAttribute("currentUser");
    }

    public void insertImage(String images, Integer targetId, String types) {
        // 保存图片信息
        if (images != null && images.trim().length() > 0) {
            String[] urls = images.split(",");
            List<Images> list = new ArrayList<>();
            for (String url : urls) {
                Images img = new Images();
                img.setTargetId(targetId);
                img.setUrl(url);
                img.setType(types);
                list.add(img);
            }
            imagesService.insertBatch(list);
        }
    }

    //去除emoji
    public static String filterEmoji(String source) {
        if (StringUtils.isNotBlank(source)) {
            return source.replaceAll("[\\ud800\\udc00-\\udbff\\udfff\\ud800-\\udfff]", "*");
        } else {
            return source;
        }
    }

    //发送模板消息
    public void sendTemplateMsg(int targetId, String templateId, String url, String first, String keyword1, String keyword2, String remark) {
        AppUser targetUser = appUserService.selectById(targetId);
        WxMpTemplateMessage templateMessage = new WxMpTemplateMessage();
        templateMessage.setToUser("o-POcwATRHa-HtPTXf8bYKmhhqv4");
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

    //    获取作品登记字典表
    public List<Dict> getWorksLevelDicByType(String type) {
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.addFilter("type={0}", type);
        List<Dict> list = dictService.selectList(entityWrapper);
        return list;
    }

}
