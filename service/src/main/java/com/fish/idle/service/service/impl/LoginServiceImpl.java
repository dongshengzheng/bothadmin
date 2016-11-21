package com.fish.idle.service.service.impl;

import com.fish.idle.service.entity.Button;
import com.fish.idle.service.entity.Menu;
import com.fish.idle.service.mapper.ButtonMapper;
import com.fish.idle.service.mapper.MenuMapper;
import com.fish.idle.service.mapper.RoleMapper;
import com.fish.idle.service.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName LoginServiceImpl.java
 * @Description:
 * @Date May 6, 2015
 */
@Transactional(readOnly = true)
@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private ButtonMapper buttonMapper;

    public List<String> getRightsRolesId(Integer userId) {
        return null;
//        return dao.findForList("RoleMapper.findRolesIdByUserId", userId);
    }

    public List<Menu> getRightsParentMenus(Integer userId) {
        return null;
//        return dao.findForList("MenuMapper.findParentMenusByUserId", userId);
    }

    public List<Menu> getRightsSubMenus(Map<?, ?> parames) {
        return null;
//        return dao.findForList("MenuMapper.findMenusByUserIdAndParent", parames);
    }

    public List<Button> getRightsButtons(Integer userId) {
        return null;
//        return dao.findForList("ButtonMapper.findButtonsByUserId", userId);
    }
}
