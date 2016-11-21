package com.fish.idle.service.service.impl;

import com.fish.idle.service.entity.Menu;
import com.fish.idle.service.service.MenuService;
import com.fish.idle.service.util.AppUtil;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName MenuServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class MenuServiceImpl implements MenuService {


    public PageData list(PageData pd) {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
//        int totalNum = (int) dao.findForObject("MenuMapper.count", pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
//        List<PageData> pds = dao.findForList("MenuMapper.list", pd);
//        AppUtil.nullToEmpty(pds, new String[]{"menuId", "menuName", "menuUrl", "menuOrder", "description"});

        result.put(Const.DRAW, pd.getString(Const.DRAW));
//        result.put(Const.RECORDSTOTAL, totalNum);
//        result.put(Const.RECORDSFILTERED, totalNum);
//        result.put(Const.NDATA, pds);
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

    public List<Menu> listMenu(PageData pd) {
        pd.put("menuType", 2);
//        List<Menu> subMenus = dao.findForList("MenuMapper.list", pd);
        return null;
//        return subMenus;
    }

    public void add(PageData pd) {
//        dao.save("MenuMapper.add", pd);
    }

    public PageData getById(Integer menuId) {
//        return (PageData) dao.findForObject("MenuMapper.getById", menuId);
        return null;
    }

    public List<Menu> getHierarchyByPath(String url) {
        List<Menu> lists = new ArrayList<Menu>(2);
//        Menu menu = (Menu) dao.findForObject("MenuMapper.getByPath", url);
//        if (menu != null) {
//            if (menu.getParentId() != 0) {
//                Menu parent = (Menu) dao.findForObject("getMenuById", menu.getParentId());
//                lists.add(parent);
//            }
//            lists.add(menu);
//        }
        return lists;
    }

    public void edit(PageData pd) {
//        dao.update("MenuMapper.edit", pd);
    }

    public Integer delete(Integer menuId) {
//        return (Integer) dao.delete("MenuMapper.delete", menuId);
        return 0;

//		PageData menu = getById(menuId);
//		if (menu.getInteger("menuType") == 1) {
//			dao.delete("MenuMapper.deleteFromMenu", menuId);
//		} else {
//			dao.delete("MenuMapper.deleteFromSubMenu", menuId);
//		}
    }

    public Integer batchDelete(String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] idArr = ids.split(",");
            if (idArr.length > 0) {
                List<Integer> idList = new ArrayList<Integer>();
                for (String idStr : idArr) {
                    idList.add(Integer.valueOf(idStr));
                }
//                return (Integer) dao.delete("MenuMapper.batchDelete", idList);
                return 0;
            }
        }
        return 0;
    }

}
