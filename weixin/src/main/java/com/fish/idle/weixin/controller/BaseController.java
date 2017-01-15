package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.util.BaseEntity;
import com.fish.idle.service.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by szy on 03/12/2016.
 */
public class BaseController {

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpSession session;

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

}
