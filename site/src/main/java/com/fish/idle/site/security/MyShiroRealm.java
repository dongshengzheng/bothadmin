package com.fish.idle.site.security;

import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.modules.sys.mapper.UserMapper;
import com.fish.idle.service.modules.sys.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

/**
 * Created by szy on 19/12/2016.
 */
public class MyShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserMapper userMapper;

    /**
     * 身份认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String userName = token.getUsername();
        char[] password = token.getPassword();
        String passwordStr = new String(password);

//        if(!StringUtils.isEmpty(userName)){
//            User user = userMapper.getUserByUserName(userName);
//            if(null == user){
//                return null;
//            }
//            //使用dao中的user获取用户名和密码,交给shiro进行验证
//            return new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(),getName());
//        }
        return null;
    }



    /**
     * 授权
     * @param principalCollection
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        String username = (String) principalCollection.fromRealm(
                getName()).iterator().next();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.addRole("user");
        return simpleAuthorizationInfo;
    }

//    public void setUserDao(UserDao userDao) {
//        this.userDao = userDao;
//    }





}
