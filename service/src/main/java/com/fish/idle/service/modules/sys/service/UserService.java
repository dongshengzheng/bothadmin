package com.fish.idle.service.modules.sys.service;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.framework.service.ISuperService;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.entity.User;

import java.util.List;

/**
 * Created by dongs on 2016/11/21.
 */
public interface UserService extends ISuperService<User> {
    List<Role> getRoles(Integer userId);

    void editRole(User user);

    boolean isNameExist(String loginName);

    JSONObject editPassword(String password, String oldPassword);


    //根据姓名模糊匹配用户,且带有粉丝数目和作品数目(去除用户自己)
    List<User> searchUsersByName(String name, Integer myId);

    //<根据id查找用户,用且带有关注他人的数目,收藏作品数目
    User searchMyInfo(Integer myId);

    //根据id查找该用户关注的用户,用且带有关注他人的数目,收藏作品数目
    List<User> searchFocusById(Integer id);

}
