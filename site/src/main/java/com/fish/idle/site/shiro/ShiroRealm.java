package com.fish.idle.site.shiro;

import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.util.Const;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author Sun.Han
 * @version 1.0
 * @FileName ShiroRealm.java
 * @Description: 认证和鉴权
 * @Date Apr 17, 2015
 */
public class ShiroRealm extends AuthorizingRealm {
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());

        if (null != username) {
            Subject subject = SecurityUtils.getSubject();
            AppUser user = (AppUser) subject.getSession().getAttribute(Const.SITE_SESSION_USER);
            return new SimpleAuthenticationInfo(user, password, getName());
        } else {
            return null;
        }

    }

    @SuppressWarnings("unchecked")
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        AppUser sysUser = (AppUser) principals.fromRealm(getName()).iterator().next();
        if (null != sysUser) {
            SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
            return info;
        }
        return null;
    }

}
