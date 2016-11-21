package com.fish.idle.service.service.impl;

import com.fish.idle.service.service.RoleService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import org.apache.commons.lang.StringUtils;
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
public class RoleServiceImpl implements RoleService {

    public PageData list(PageData pd)  {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
//        int totalNum = (int) dao.findForObject("RoleMapper.count", pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
//        List<PageData> pds = dao.findForList("RoleMapper.list", pd);
//        AppUtil.nullToEmpty(pds, new String[]{"roleName", "description"});

        result.put(Const.DRAW, pd.getString(Const.DRAW));
//        result.put(Const.RECORDSTOTAL, totalNum);
//        result.put(Const.RECORDSFILTERED, totalNum);
//        result.put(Const.NDATA, pds);
        return result;
    }

    public void add(PageData pd) {
//        dao.save("RoleMapper.add", pd);
    }

    public PageData getById(Integer roleId) {
//        return (PageData) dao.findForObject("RoleMapper.getById", roleId);
        return null;
    }

    public void edit(PageData pd) {
//        dao.update("RoleMapper.edit", pd);
    }

    public Integer delete(Integer roleId) {
//        return (Integer) dao.delete("RoleMapper.delete", roleId);
        return 0;
    }

    public Integer batchDelete(PageData pd) {
        List<Integer> idList = com.fish.idle.service.util.StringUtils.split(pd.getString("ids"), Const.COMMA);
        if (null != idList && idList.size() > 0) {
            pd.put("idList", idList);
//            return (Integer) dao.delete("RoleMapper.batchDelete", pd);
            return 0;
        }
        return 0;
    }

    public List<PageData> listTreeData(Integer roleId) {
        List<PageData> result = new ArrayList<PageData>();

        PageData pd = new PageData();
        pd.put("menuType", 1);
//        List<PageData> menuList = dao.findForList("MenuMapper.listBy", pd);
        pd.put("menuType", 2);
//        for (PageData menu : menuList) {
//            PageData p1 = new PageData();
//            p1.put("id", menu.getString("menuId"));
//            p1.put("pId", menu.getString("parentId"));
//            p1.put("name", menu.getString("menuName"));
//            p1.put("open", "true");
//            p1.put("resFlag", menu.getString("menuId") + "_" + menu.getString("menuType"));
//            result.add(p1);
//
//            pd.put("parentId", menu.getInteger("menuId"));
//            List<PageData> subMenuList = dao.findForList("MenuMapper.listBy", pd);
//            for (PageData subMenu : subMenuList) {
//                PageData p2 = new PageData();
//                p2.put("id", subMenu.getString("menuId"));
//                p2.put("pId", subMenu.getString("parentId"));
//                p2.put("name", subMenu.getString("menuName"));
//                p2.put("open", "true");
//                p2.put("resFlag", subMenu.getString("menuId") + "_" + subMenu.getString("menuType"));
//                result.add(p2);
//
//                List<PageData> buttonList = dao.findForList("ButtonMapper.listByMenuId", subMenu.getInteger("menuId"));
//                for (PageData button : buttonList) {
//                    PageData p3 = new PageData();
//                    p3.put("id", button.getString("menuId") + "_" + button.getString("buttonId"));
//                    p3.put("pId", button.getString("menuId"));
//                    p3.put("name", button.getString("buttonName"));
//                    p3.put("open", "true");
//                    p3.put("resFlag", button.getString("buttonId") + "_" + 3);
//                    result.add(p3);
//                }
//            }
//        }

//        List<PageData> roleResList = dao.findForList("RoleMapper.listResByRoleId", roleId);
//        for (PageData roleRes : roleResList) {
//            String resFlag = roleRes.getInteger("resourceId") + "_" + roleRes.getInteger("resourceType");
//            for (PageData p : result) {
//                if (resFlag.equals(p.getString("resFlag"))) {
//                    p.put("checked", true);
//                    break;
//                }
//            }
//        }

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
//            dao.delete("RoleMapper.deleteResByRoleId", roleId);
//            dao.batchSave("RoleMapper.saveRes", list);
        }
    }

}
