package com.fish.idle.service.modules.sys.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Menu;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public Integer batchDelete(String ids) {
        List<Integer> idList = com.fish.idle.service.util.StringUtils.split(ids, Const.COMMA);
        if (null != idList && idList.size() > 0) {
            roleMapper.batchDelete(idList);
        }
        return 0;
    }

    public List<PageData> listTreeData(Integer roleId) throws Exception {
        JSONArray jsonArray = new JSONArray();


        EntityWrapper<Menu> ew1 = new EntityWrapper<>();
        ew1.addFilter("del_flag != -1 AND menu_type={0}",1);
        List<Menu> menuList = menuMapper.selectList(ew1);

        for (Menu menu : menuList) {
            JSONObject p1 = new JSONObject();
            p1.put("id", menu.getMenuId());
            p1.put("pId", menu.getParentId());
            p1.put("name", menu.getMenuName());
            p1.put("open", "true");
            p1.put("resFlag", menu.getMenuId() + "_" + menu.getMenuType());
            jsonArray.add(p1);


            EntityWrapper<Menu> ew2 = new EntityWrapper<>();
            ew2.addFilter("del_flag != -1 AND menu_type={0} AND parent_id={1}",2,menu.getMenuId());
            List<Menu> subMenuList = menuMapper.selectList(ew2);
            for (Menu subMenu : subMenuList) {
                JSONObject p2 = new JSONObject();
                p2.put("id", subMenu.getMenuId());
                p2.put("pId", subMenu.getParentId());
                p2.put("name", subMenu.getMenuName());
                p2.put("open", "true");
                p2.put("resFlag", subMenu.getMenuId() + "_" + subMenu.getMenuType());
                jsonArray.add(p2);

                EntityWrapper<Button> ew3 = new EntityWrapper<>();
                ew3.addFilter("del_flag != -1 AND menu_id={0} ",subMenu.getMenuId());
                List<Button> buttonList = buttonMapper.selectList(ew3);
                for (Button button : buttonList) {
                    JSONObject p3 = new JSONObject();
                    p3.put("id",button.getMenuId() + "_" +button.getButtonId());
                    p3.put("pId", button.getMenuId());
                    p3.put("name",button.getButtonName());
                    p3.put("open", "true");
                    p3.put("resFlag", button.getButtonId() + "_" + 3);
                    jsonArray.add(p3);
                }
            }
        }

        List<> roleResList = roleMapper.listResByRoleId(roleId);
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
