package com.fish.idle.service.modules.sys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.fish.idle.service.modules.sys.entity.*;
import com.fish.idle.service.modules.sys.mapper.ButtonMapper;
import com.fish.idle.service.modules.sys.mapper.MenuMapper;
import com.fish.idle.service.modules.sys.mapper.RoleMapper;
import com.fish.idle.service.modules.sys.mapper.RoleResourceMapper;
import com.fish.idle.service.modules.sys.service.RoleService;
import org.apache.commons.lang3.StringUtils;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private RoleResourceMapper roleResourceMapper;

    @Autowired
    private ButtonMapper buttonMapper;

    public List<RoleTree> listTreeData(Integer roleId) {
        List<RoleTree> roleTrees = new ArrayList<>();
        EntityWrapper<Menu> ew1 = new EntityWrapper<>();
        ew1.addFilter("del_flag != -1 AND menu_type={0}", 1);
        List<Menu> menuList = menuMapper.selectList(ew1);

        for (Menu menu : menuList) {
            RoleTree roleTree = new RoleTree();
            roleTree.setId(menu.getId().toString());
            roleTree.setpId(menu.getParentId());
            roleTree.setName(menu.getMenuName());
            roleTree.setOpen("true");
            roleTree.setResFlag(menu.getId() + "_" + menu.getMenuType());
            roleTrees.add(roleTree);


            EntityWrapper<Menu> ew2 = new EntityWrapper<>();
            ew2.addFilter("del_flag != -1 AND menu_type={0} AND parent_id={1}", 2, menu.getId());
            List<Menu> subMenuList = menuMapper.selectList(ew2);
            for (Menu subMenu : subMenuList) {
                RoleTree subTree = new RoleTree();
                subTree.setId(subMenu.getId().toString());
                subTree.setpId(subMenu.getParentId());
                subTree.setName(subMenu.getMenuName());
                subTree.setOpen("true");
                subTree.setResFlag(subMenu.getId() + "_" + subMenu.getMenuType());
                roleTrees.add(subTree);
                EntityWrapper<Button> ew3 = new EntityWrapper<>();
                ew3.addFilter("del_flag != -1 AND menu_id={0} ", subMenu.getId());
                List<Button> buttonList = buttonMapper.selectList(ew3);
                for (Button button : buttonList) {
                    RoleTree butttonTree = new RoleTree();
                    butttonTree.setId(button.getMenuId() + "_" + button.getId());
                    butttonTree.setpId(button.getMenuId());
                    butttonTree.setName(button.getButtonName());
                    butttonTree.setOpen("true");
                    butttonTree.setResFlag(button.getId() + "_" + 3);
                    roleTrees.add(butttonTree);
                }
            }
        }


        Map<String, Object> map = new HashMap<>();
        map.put("role_id", roleId);
        List<RoleResource> roleResList = roleResourceMapper.selectByMap(map);
        for (RoleResource roleRes : roleResList) {
            String resFlag = roleRes.getResourceId() + "_" + roleRes.getResourceType();
            for (RoleTree tree : roleTrees) {
                if (resFlag.equals(tree.getResFlag())) {
                    tree.setChecked(true);
                    break;
                }
            }
        }
        return roleTrees;
    }


    public void editRight(String selRes, Integer roleId) {
        if (StringUtils.isNotBlank(selRes)) {
            List<RoleResource> list = new ArrayList<>();
            String[] resFlags = selRes.split(",");

            for (String resFlag : resFlags) {
                String[] resArr = resFlag.split("_");
                RoleResource roleResource = new RoleResource();
                roleResource.setRoleId(roleId);
                roleResource.setResourceId(Integer.valueOf(resArr[0]));
                roleResource.setResourceType(Integer.valueOf(resArr[1]));
                list.add(roleResource);
            }
            Map<String, Object> map = new HashMap<>();
            map.put("role_id", roleId);
            roleResourceMapper.deleteByMap(map);
            // roleResourceMapper.insertBatch(list);
            for (RoleResource roleResource : list) {
                roleResourceMapper.insert(roleResource);
            }
        }
    }
}
