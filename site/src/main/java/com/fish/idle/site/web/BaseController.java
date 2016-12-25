package com.fish.idle.site.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.util.BaseEntity;
import com.fish.idle.service.util.Const;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by szy on 03/12/2016.
 */
public class BaseController {


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

}
