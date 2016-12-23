package com.fish.idle.service.modules.sys.service;

import com.fish.idle.service.modules.sys.entity.AppUser;
import com.baomidou.framework.service.ISuperService;

/**
 *
 * AppUser 表数据服务层接口
 *
 */
public interface IAppUserService extends ISuperService<AppUser> {


    boolean isNameExist(String loginName);
}