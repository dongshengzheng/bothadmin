package com.fish.idle.admin.system.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.fish.idle.admin.base.dao.BaseDao;
import com.fish.idle.admin.system.entity.Menu;
import com.fish.idle.admin.system.entity.Button;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName LoginService.java
 * @Description:
 * @Date May 6, 2015
 */
@Transactional(readOnly = true)
@Service("loginService")
public class LoginService {

    @Resource(name = "BaseDao")
    private BaseDao dao;


    public List<String> getRightsRolesId(Integer userId) throws Exception {
        return dao.findForList("RoleMapper.findRolesIdByUserId", userId);
    }

    public List<Menu> getRightsParentMenus(Integer userId) throws Exception {
        return dao.findForList("MenuMapper.findParentMenusByUserId", userId);
    }

    public List<Menu> getRightsSubMenus(Map<?, ?> parames) throws Exception {
        return dao.findForList("MenuMapper.findMenusByUserIdAndParent", parames);
    }

    public List<Button> getRightsButtons(Integer userId) throws Exception {
        return dao.findForList("ButtonMapper.findButtonsByUserId", userId);
    }
}
