package com.fish.idle.service.modules.sys.service.impl;

import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Menu;
import com.fish.idle.service.modules.sys.mapper.ButtonMapper;
import com.fish.idle.service.modules.sys.mapper.MenuMapper;
import com.fish.idle.service.modules.sys.mapper.RoleMapper;
import com.fish.idle.service.modules.sys.service.LoginService;

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

        return roleMapper.findRolesIdByUserId(userId.toString());
    }

    public List<Menu> getRightsParentMenus(Integer userId) {

        return menuMapper.findParentMenusByUserId(userId);
    }

    public List<Menu> getRightsSubMenus(Map<?, ?> parames) {
        return menuMapper.findMenusByUserIdAndParent(parames);
    }

    public List<Button> getRightsButtons(Integer userId) {
        return buttonMapper.findButtonsByUserId(userId);
    }
}
