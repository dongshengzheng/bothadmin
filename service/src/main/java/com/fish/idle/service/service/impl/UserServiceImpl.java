package com.fish.idle.service.service.impl;

import com.fish.idle.service.entity.User;
import com.fish.idle.service.mapper.RoleMapper;
import com.fish.idle.service.mapper.UserMapper;
import com.fish.idle.service.util.AppUtil;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import com.fish.idle.service.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName UserServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    public void setSKIN(PageData pd)  {
        userMapper.setSKIN(pd);
    }

    public void saveIP(PageData pd) {
        userMapper.saveIP(pd);
    }

    public PageData getUserByNameAndPwd(PageData pd) {
        return userMapper.getUserInfo(pd);
    }

    public void updateLastLogin(PageData pd) {
        userMapper.updateLastLogin2(pd);
    }

    public PageData list(PageData pd) {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
        int totalNum = userMapper.count(pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
        List<PageData> pds = userMapper.list(pd);
        AppUtil.nullToEmpty(pds, new String[]{"loginName", "lastLogin", "email", "phone", "name"});

        result.put(Const.DRAW, pd.getString(Const.DRAW));
        result.put(Const.RECORDSTOTAL, totalNum);
        result.put(Const.RECORDSFILTERED, totalNum);
        result.put(Const.NDATA, pds);
        return result;
    }

    public void add(PageData pd) {
        userMapper.add(pd);
    }

    public PageData getById(Integer userId) {
        return userMapper.getById(userId);
    }

    public void edit(PageData pd) {
        userMapper.edit(pd);
    }

    public void delete(Integer userId) {
        userMapper.delete(userId);
    }

    public void batchDelete(String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] idArr = ids.split(",");
            if (idArr.length > 0) {
                List<Integer> idList = new ArrayList<Integer>();
                for (String idStr : idArr) {
                    idList.add(Integer.valueOf(idStr));
                }
                for(int i = 0; i < idList.size(); i++) {
                    userMapper.delete(idList.get(i));
                }
            }
        }
    }

    public List<PageData> getRoles(Integer userId) {
        List<PageData> roles = roleMapper.listAllRoles();
        List<PageData> userRoles = userMapper.listUserRoleByUserId(userId);
        for (PageData role : roles) {
            Integer roleId = role.getInteger("roleId");
            for (PageData userRole : userRoles) {
                if (roleId.equals(userRole.getInteger("roleId"))) {
                    role.put("checked", true);
                    break;
                }
            }
        }
        return roles;
    }

    public List<PageData> getAllRoles() {
        List<PageData> roles = roleMapper.listAllRoles();
        return roles;
    }

    public void editRole(PageData pd) {
        String roleIds = pd.getString("roleIds");
        if (StringUtils.isNotBlank(roleIds)) {
            List<PageData> list = new ArrayList<PageData>();
            Integer userId = pd.getInteger("userId");
            String[] roleIdArr = roleIds.split(",");
            for (String roleId : roleIdArr) {
                PageData p = new PageData();
                p.put("userId", userId);
                p.put("roleId", Integer.valueOf(roleId));
                list.add(p);
            }
            userMapper.delete(userId);
            userMapper.saveUserRoles(list);
        }
    }

    public boolean isNameExist(PageData pd) {
        String loginName = pd.getString("loginName").toLowerCase();
        pd.put("loginName", loginName);
        List<PageData> pds = userMapper.getByName(loginName);
        return pds.size() > 0 ? true : false;
    }

    public PageData editPassword(PageData pd) {
        PageData result = new PageData();

        Subject subject = SecurityUtils.getSubject();
        User sessionUser = (User) subject.getSession().getAttribute(Const.SESSION_USER);

        PageData user = userMapper.getById(sessionUser.getUserId());
        String loginName = user.getString("loginName");
        String encodePwd = new SimpleHash("SHA-1", loginName, pd.getString("oldpassword")).toString();
        if (user.getString("password").equals(encodePwd)) {
            pd.put("newEncodePwd", new SimpleHash("SHA-1", loginName, pd.getString("password")).toString());
            pd.put("userId", sessionUser.getUserId());
            userMapper.updatePassword(pd);
            result.put("status", 1);
        } else {
            result.put("status", 0);
            result.put("msg", "原密码错误");
        }
        return result;
    }

}
