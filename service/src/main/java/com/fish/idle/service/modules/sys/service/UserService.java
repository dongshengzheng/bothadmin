package com.fish.idle.service.modules.sys.service;

import com.baomidou.framework.service.ISuperService;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.util.PageData;

import java.util.List;

/**
 * Created by dongs on 2016/11/21.
 */
public interface UserService extends ISuperService<User>  {

    void setSKIN(PageData pd);

    void saveIP(User user);

    PageData getUserByNameAndPwd(PageData pd);

    void updateLastLogin(PageData pd);

    PageData list(PageData pd);

    void add(PageData pd);

    PageData getById(Integer userId);

    void edit(PageData pd);

    void delete(Integer userId);

    void batchDelete(String ids);

    List<Role> getRoles(Integer userId);

    List<PageData> getAllRoles();

    void editRole(User user);

    boolean isNameExist(String loginName);

    PageData editPassword(PageData pd);

    PageData findByOpenid(String openId);
}
