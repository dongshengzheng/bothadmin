package com.fish.idle.site.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.util.BaseEntity;
import com.fish.idle.service.util.Const;
import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpTemplateMsgService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.apache.commons.logging.impl.Log4JLogger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by szy on 03/12/2016.
 */
public class BaseController {
    protected Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    protected IAppUserService appUserService;

    @Autowired
    protected WxMpConfigStorage configStorage;

    @Autowired
    protected WxMpTemplateMsgService wxMpTemplateMsgService;

    public void wrapInsertEntity(BaseEntity baseEntity){
        baseEntity.setCreateDate(new Date());
        baseEntity.setCreateBy(getCurrentUser().getId());
        baseEntity.setUpdateBy(getCurrentUser().getId());
        baseEntity.setUpdateDate(new Date());
    }

    public void wrapUpdateEntity(BaseEntity baseEntity){
        baseEntity.setUpdateBy(getCurrentUser().getId());
        baseEntity.setUpdateDate(new Date());
    }


    /**
     * <p>
     * 获取分页对象
     * </p>
     *
     * @return
     */
    protected <T> Page<T> getPage(HttpServletRequest request) {
        int start = 0;
        int length = 10;
        if (request.getParameter(Const.START) != null) {
            start = Integer.parseInt(request.getParameter(Const.START));
        }
        if (request.getParameter(Const.LENGTH) != null) {
            length = Integer.parseInt(request.getParameter(Const.LENGTH));
        }
        return new Page<>(start / length + 1, length);
    }
    /**
     * <p>
     * 获取分页对象
     * </p>
     *
     * @return
     */
    protected <T> Page<T> getPage(Integer start,Integer length) {
        return new Page<>(start, length);
    }

    protected <T> EntityWrapper<T>  getEntityWrapper(){
        EntityWrapper<T> ew = new EntityWrapper<>();
        ew.where("del_flag={0}", Const.DEL_FLAG_NORMAL);
        return ew;
    }

    public AppUser getCurrentUser() {
        Subject subject = SecurityUtils.getSubject();
        return (AppUser) subject.getPrincipal();
    }

    //发送模板消息
    public void sendTemplateMsg(int targetId, String templateId, String url, String first, String keyword1, String keyword2, String remark) {
        AppUser targetUser = appUserService.selectById(targetId);
        WxMpTemplateMessage templateMessage = new WxMpTemplateMessage();
        templateMessage.setToUser(targetUser.getOpenId());
        logger.error("site######################fasong##openid:"+targetUser.getOpenId());
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

}
