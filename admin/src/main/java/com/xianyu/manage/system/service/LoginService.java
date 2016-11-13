/*
 *
 * ALL RIGHTS RESERVED.
 *
 * No part of this publication may be reproduced, stored in a retrieval system, or transmitted,
 * on any form or by any means, electronic, mechanical, photocopying, recording, 
 * or otherwise, without the prior written permission of ShenZhen GreatVision Network Technology Co., Ltd.
 *
 * Amendment History:
 * 
 * Date                   By              Description
 * -------------------    -----------     -------------------------------------------
 * May 6, 2015    Sun.Han         Create the class
*/

package com.xianyu.manage.system.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.xianyu.manage.base.dao.BaseDao;
import com.xianyu.manage.system.entity.Button;
import com.xianyu.manage.system.entity.Menu;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName LoginService.java
 * @Description:
 * @Date May 6, 2015
 */
@Transactional(readOnly = true)
@Service("loginService")
public class LoginService {

    @Resource(name = "BaseDao")
    private BaseDao dao;


    public List<String> getRightsRolesId(Integer userId) throws Exception {
        return dao.findForList("RoleMapper.findRolesIdByUserId", userId);
    }

    public List<Menu> getRightsParentMenus(Integer userId) throws Exception {
        return dao.findForList("MenuMapper.findParentMenusByUserId", userId);
    }

    public List<Menu> getRightsSubMenus(Map<?, ?> parames) throws Exception {
        return dao.findForList("MenuMapper.findMenusByUserIdAndParent", parames);
    }

    public List<Button> getRightsButtons(Integer userId) throws Exception {
        return dao.findForList("ButtonMapper.findButtonsByUserId", userId);
    }
}
