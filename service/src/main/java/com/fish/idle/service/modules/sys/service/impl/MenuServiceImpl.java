package com.fish.idle.service.modules.sys.service.impl;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Menu;
import com.fish.idle.service.modules.sys.mapper.ButtonMapper;
import com.fish.idle.service.modules.sys.mapper.MenuMapper;
import com.fish.idle.service.modules.sys.service.MenuService;
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
 * @FileName MenuServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class MenuServiceImpl extends SuperServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    public PageData list(PageData pd) {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
        int totalNum = menuMapper.count(pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
        List<PageData> pds = menuMapper.list(pd);
        AppUtil.nullToEmpty(pds, new String[]{"menuId", "menuName", "menuUrl", "menuOrder", "description"});

        result.put(Const.DRAW, pd.getString(Const.DRAW));
        result.put(Const.RECORDSTOTAL, totalNum);
        result.put(Const.RECORDSFILTERED, totalNum);
        result.put(Const.NDATA, pds);
        return result;
    }


//	@SuppressWarnings("unchecked")
//	public List<PageData> list(PageData pd) throws Exception {
//		pd.put("menuType", 1);
//		List<Menu> menus = menuMapper.list(pd);
//
//		pd.put("menuType", 2);
//		for (Menu menu : menus) {
//			pd.put("parentId", menu.getMenuId());
//			List<Menu> subMenus = (List<Menu>) dao.findForList("MenuMapper.list", pd);
//			menu.setSubMenu(subMenus);
//		}
//		return menus;
//	}

    public List<PageData> listMenu(PageData pd) {
        pd.put("menuType", 2);
        List<PageData> subMenus = menuMapper.list(pd);
        return subMenus;
    }

    public void add(PageData pd) {
        menuMapper.add(pd);
    }

    public PageData getById(Integer menuId) {
        return  menuMapper.getById(menuId);
    }

    public List<Menu> getHierarchyByPath(String url) {
        List<Menu> lists = new ArrayList<Menu>(2);
        Menu menu = menuMapper.getByPath(url);
        if (menu != null) {
            if (menu.getParentId() != 0) {
                Menu parent = menuMapper.getMenuById(menu.getParentId());
                lists.add(parent);
            }
            lists.add(menu);
        }
        return lists;
    }

    public void edit(PageData pd) {
        menuMapper.edit(pd);
    }

    public Integer delete(Integer menuId) {
        if (menuMapper.getById(menuId).isEmpty()) {
            return 0;
        }
        menuMapper.delete(menuId);
        return 1;

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
                for (int i = 0; i < idList.size(); i++) {
                    menuMapper.delete(idList.get(i));
                }
                return idList.size();
            }
        }
        return 0;
    }

}
