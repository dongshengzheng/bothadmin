package com.fish.idle.service.modules.sys.service.impl;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.fish.idle.service.modules.sys.entity.Office;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.mapper.ButtonMapper;
import com.fish.idle.service.modules.sys.mapper.MenuMapper;
import com.fish.idle.service.modules.sys.mapper.OfficeMapper;
import com.fish.idle.service.modules.sys.mapper.RoleMapper;
import com.fish.idle.service.modules.sys.service.IOfficeService;
import com.fish.idle.service.modules.sys.service.RoleService;
import com.fish.idle.service.util.AppUtil;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.List;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName RoleServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class RoleServiceImpl  extends SuperServiceImpl<RoleMapper, Role>  implements RoleService {

        @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private ButtonMapper buttonMapper;

    public void add(PageData pd) {
        roleMapper.add(pd);
    }

    public PageData getById(Integer roleId) {
        return roleMapper.getById(roleId);
    }

    public void edit(PageData pd) {
        roleMapper.edit(pd);
    }

    public Integer delete(Integer roleId) {
        PageData pageData = roleMapper.getById(roleId);
        if (pageData.isEmpty()) {
            return 0;
        }
        roleMapper.delete(roleId);
        return 1;
    }

    public Integer batchDelete(PageData pd) {
        List<Integer> idList = com.fish.idle.service.util.StringUtils.split(pd.getString("ids"), Const.COMMA);
        if (null != idList && idList.size() > 0) {
            pd.put("idList", idList);
            int count = roleMapper.count(pd);
            roleMapper.batchDelete(pd);
            return count;
        }
        return 0;
    }

    public List<PageData> listTreeData(Integer roleId) throws Exception {
        List<PageData> result = new ArrayList<PageData>();

        PageData pd = new PageData();
        pd.put("menuType", 1);
        List<PageData> menuList = menuMapper.listBy(pd);
        pd.put("menuType", 2);
        for (PageData menu : menuList) {
            PageData p1 = new PageData();
            p1.put("id", menu.getString("menuId"));
            p1.put("pId", menu.getString("parentId"));
            p1.put("name", menu.getString("menuName"));
            p1.put("open", "true");
            p1.put("resFlag", menu.getString("menuId") + "_" + menu.getString("menuType"));
            result.add(p1);

            pd.put("parentId", menu.getInteger("menuId"));
            List<PageData> subMenuList = menuMapper.listBy(pd);
            for (PageData subMenu : subMenuList) {
                PageData p2 = new PageData();
                p2.put("id", subMenu.getString("menuId"));
                p2.put("pId", subMenu.getString("parentId"));
                p2.put("name", subMenu.getString("menuName"));
                p2.put("open", "true");
                p2.put("resFlag", subMenu.getString("menuId") + "_" + subMenu.getString("menuType"));
                result.add(p2);

                List<PageData> buttonList = buttonMapper.listByMenuId(subMenu.getInteger("menuId"));
                for (PageData button : buttonList) {
                    PageData p3 = new PageData();
                    p3.put("id", button.getString("menuId") + "_" + button.getString("buttonId"));
                    p3.put("pId", button.getString("menuId"));
                    p3.put("name", button.getString("buttonName"));
                    p3.put("open", "true");
                    p3.put("resFlag", button.getString("buttonId") + "_" + 3);
                    result.add(p3);
                }
            }
        }

        List<PageData> roleResList = roleMapper.listResByRoleId(roleId);
        for (PageData roleRes : roleResList) {
            String resFlag = roleRes.getInteger("resourceId") + "_" + roleRes.getInteger("resourceType");
            for (PageData p : result) {
                if (resFlag.equals(p.getString("resFlag"))) {
                    p.put("checked", true);
                    break;
                }
            }
        }

        return result;
    }

    public void editRight(PageData pd) {
        String selRes = pd.getString("selRes");
        if (StringUtils.isNotBlank(selRes)) {
            List<PageData> list = new ArrayList<PageData>();
            Integer roleId = pd.getInteger("roleId");
            String[] resFlags = selRes.split(",");
            for (String resFlag : resFlags) {
                String[] resArr = resFlag.split("_");
                PageData p = new PageData();
                p.put("roleId", roleId);
                p.put("resourceId", Integer.valueOf(resArr[0]));
                p.put("resourceType", Integer.valueOf(resArr[1]));
                list.add(p);
            }
            roleMapper.deleteResByRoleId(roleId);
            roleMapper.saveRes(list);
        }
    }

}
