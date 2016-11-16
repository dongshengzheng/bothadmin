package com.fish.idle.admin.system.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fish.idle.admin.base.dao.BaseDao;
import com.fish.idle.admin.system.entity.Menu;
import com.fish.idle.admin.base.util.AppUtil;
import com.fish.idle.admin.base.util.Const;
import com.fish.idle.admin.base.util.PageData;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName MenuService.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service("menuService")
public class MenuService {

    @Resource(name = "BaseDao")
    private BaseDao dao;

    public PageData list(PageData pd) throws Exception {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
        int totalNum = (int) dao.findForObject("MenuMapper.count", pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
        List<PageData> pds = dao.findForList("MenuMapper.list", pd);
        AppUtil.nullToEmpty(pds, new String[]{"menuId", "menuName", "menuUrl", "menuOrder", "description"});

        result.put(Const.DRAW, pd.getString(Const.DRAW));
        result.put(Const.RECORDSTOTAL, totalNum);
        result.put(Const.RECORDSFILTERED, totalNum);
        result.put(Const.NDATA, pds);
        return result;
    }

//	@SuppressWarnings("unchecked")
//	public List<Menu> list(PageData pd) throws Exception {
//		pd.put("menuType", 1);
//		List<Menu> menus = (List<Menu>) dao.findForList("MenuMapper.list", pd);
//		
//		pd.put("menuType", 2);
//		for (Menu menu : menus) {
//			pd.put("parentId", menu.getMenuId());
//			List<Menu> subMenus = (List<Menu>) dao.findForList("MenuMapper.list", pd);
//			menu.setSubMenu(subMenus);
//		}
//		return menus;
//	}

    public List<Menu> listMenu(PageData pd) throws Exception {
        pd.put("menuType", 2);
        List<Menu> subMenus = dao.findForList("MenuMapper.list", pd);
        return subMenus;
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public void add(PageData pd) throws Exception {
        dao.save("MenuMapper.add", pd);
    }

    public PageData getById(Integer menuId) throws Exception {
        return (PageData) dao.findForObject("MenuMapper.getById", menuId);
    }

    public List<Menu> getHierarchyByPath(String url) throws Exception {
        List<Menu> lists = new ArrayList<Menu>(2);
        Menu menu = (Menu) dao.findForObject("MenuMapper.getByPath", url);
        if (menu != null) {
            if (menu.getParentId() != 0) {
                Menu parent = (Menu) dao.findForObject("getMenuById", menu.getParentId());
                lists.add(parent);
            }
            lists.add(menu);
        }
        return lists;
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public void edit(PageData pd) throws Exception {
        dao.update("MenuMapper.edit", pd);
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public Integer delete(Integer menuId) throws Exception {
        return (Integer) dao.delete("MenuMapper.delete", menuId);

//		PageData menu = getById(menuId);
//		if (menu.getInteger("menuType") == 1) {
//			dao.delete("MenuMapper.deleteFromMenu", menuId);
//		} else {
//			dao.delete("MenuMapper.deleteFromSubMenu", menuId);
//		}
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public Integer batchDelete(String ids) throws Exception {
        if (StringUtils.isNotBlank(ids)) {
            String[] idArr = ids.split(",");
            if (idArr.length > 0) {
                List<Integer> idList = new ArrayList<Integer>();
                for (String idStr : idArr) {
                    idList.add(Integer.valueOf(idStr));
                }
                return (Integer) dao.delete("MenuMapper.batchDelete", idList);

            }
        }
        return 0;
    }

}
