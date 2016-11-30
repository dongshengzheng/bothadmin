package com.fish.idle.service.modules.sys.service.impl;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.entity.RoleResource;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.modules.sys.entity.UserRole;
import com.fish.idle.service.modules.sys.mapper.RoleMapper;
import com.fish.idle.service.modules.sys.mapper.RoleResourceMapper;
import com.fish.idle.service.modules.sys.mapper.UserMapper;
import com.fish.idle.service.modules.sys.mapper.UserRoleMapper;
import com.fish.idle.service.modules.sys.service.UserService;
import com.fish.idle.service.util.AppUtil;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName UserServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class UserServiceImpl extends SuperServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    public void setSKIN(PageData pd) {
        userMapper.setSKIN(pd);
    }

    public void saveIP(User user) {
        userMapper.saveIP(user);
    }

    public PageData getUserByNameAndPwd(PageData pd) {
        return userMapper.getUserInfo(pd);
    }

    @Transactional
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

    @Transactional(readOnly = false)
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
                for (int i = 0; i < idList.size(); i++) {
                    userMapper.delete(idList.get(i));
                }
            }
        }
    }

    public List<Role> getRoles(Integer userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("del_flag", 1);
        map.put("allocatable", 1);
        List<Role> roles = roleMapper.selectByMap(map);
        map = new HashMap<>();
        map.put("user_id", userId);
        List<UserRole> userRoles = userRoleMapper.selectByMap(map);
        for (Role role : roles) {
            for (UserRole userRole : userRoles) {
                if (role.getRoleId().equals(userRole.getRoleId())) {
                    role.setChecked(true);
                    break;
                }
            }
        }
        return roles;
    }

    public List<PageData> getAllRoles() {
        return roleMapper.listAllRoles();
    }

    public void editRole(User user) {
        String roleIds = user.getRoleIds();
        if (StringUtils.isNotBlank(roleIds)) {
            List<UserRole> list = new ArrayList<>();
            Integer userId = user.getUserId();
            String[] roleIdArr = roleIds.split(",");
            for (String roleId : roleIdArr) {
                UserRole userRole = new UserRole();
                userRole.setUserId(userId);
                userRole.setRoleId(Integer.valueOf(roleId));
                list.add(userRole);
            }
            userMapper.deleteById(userId);
            userRoleMapper.insertBatch(list);
        }
    }

    public boolean isNameExist(String loginName) {
        User user = new User();
        user.setLoginName(loginName);
        user.setDelFlag(1);
        int count = userMapper.selectCount(user);
        return count > 0;
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

    @Override
    public PageData findByOpenid(String openId) {
        return userMapper.getByOpenId(openId);
    }

}
