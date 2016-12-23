package com.fish.idle.service.modules.sys.service.impl;

import com.fish.idle.service.modules.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.sys.mapper.AppUserMapper;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * AppUser 表数据服务层接口实现类
 *
 */
@Service
public class AppUserServiceImpl extends SuperServiceImpl<AppUserMapper, AppUser> implements IAppUserService {

    @Autowired
    private AppUserMapper appUserMapper;
    @Override
    public boolean isNameExist(String loginName) {
        AppUser appUser = new AppUser();
        appUser.setLoginName(loginName);
        int count = appUserMapper.selectCount(appUser);
        return count > 0;
    }
}