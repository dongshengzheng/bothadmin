package com.fish.idle.admin.modules.sys.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.admin.controller.BaseController;
import com.fish.idle.admin.util.StringUtils;
import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Menu;
import com.fish.idle.service.modules.sys.entity.Role;
import com.fish.idle.service.modules.sys.service.ButtonService;
import com.fish.idle.service.modules.sys.service.MenuService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName RightController.java
 * @Description:
 * @Date 2015年5月9日
 */
@Controller
@RequestMapping(value = "/right")
public class RightController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(RightController.class);
    @Autowired
    private MenuService menuService;
    @Autowired
    private ButtonService buttonService;

    @RequestMapping
    public String menu() {
        return "sys/right/right_list";
    }

    @RequestMapping(value = "/subMenu")
    public String subMenu(ModelMap map, @RequestParam Integer parentId) {
        EntityWrapper<Menu> ew = getEntityWrapper();
        ew.addFilter("menu_id={0}", parentId);
        menuService.selectOne(ew);
        map.put("menu", menuService.selectOne(ew));
        return "sys/right/subMenu_list";
    }

    @RequestMapping(value = "/button")
    public String button(ModelMap map, @RequestParam Integer menuId) {
        EntityWrapper<Menu> ew = getEntityWrapper();
        ew.addFilter("menu_id={0}", menuId);
        menuService.selectOne(ew);
        map.put("menu", menuService.selectOne(ew));
        return "sys/right/button_list";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject listMenu(Menu menu) {
        EntityWrapper<Menu> ew = getEntityWrapper();
        if (menu.getMenuType() != null)
            ew.addFilter("menu_type={0}", menu.getMenuType());
        if (menu.getParentId() != null)
            ew.addFilter("parent_id={0}", menu.getParentId());
        if (!StringUtils.isEmpty(menu.getMenuName()))
            ew.addFilter("CONCAT(IFNULL(menu_name,''),IFNULL(menu_url,'')) like {0}", "%" + menu.getMenuName() + "%");
        return jsonPage(menuService.selectPage(getPage(), ew));

    }

    @RequestMapping(value = "/addMenu", method = RequestMethod.GET)
    public String toAddMenu(Integer parentId, ModelMap map) {
        if (parentId == null) {
            map.put("parentId", 0);
            map.put("menuType", 1);
        } else {
            map.put("parentId", parentId);
            map.put("menuType", 2);
        }
        return "sys/right/menu_add";
    }

    @RequestMapping(value = "/addMenu", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addMenu(Menu menu) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 1);
        menu.setDelFlag(Const.DEL_FLAG_NORMAL);
        menuService.insert(menu);
        return jsonObject;

    }

    @RequestMapping(value = "/editMenu", method = RequestMethod.GET)
    public String toEditMenu(@RequestParam Integer menuId, ModelMap map) {
        Menu menu = menuService.selectById(menuId);
        map.put("menu", menu);
        return "sys/right/menu_edit";

    }

    @RequestMapping(value = "/editMenu", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editMenu(Menu menu) {
        JSONObject jsonObject = new JSONObject();
        menuService.updateById(menu);
        jsonObject.put("status", 1);
        return jsonObject;
    }

    @RequestMapping(value = "/deleteMenu")
    @ResponseBody
    public JSONObject deleteMenu(@RequestParam Integer menuId) {
        int effect = menuService.delete(menuId);
        JSONObject jsonObject = new JSONObject();
        if (effect == 1) {
            jsonObject.put("status", 1);
        } else {
            jsonObject.put("status", 0);
            jsonObject.put("msg", "删除失败或者为不可删除状态");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/batchDeleteMenu")
    @ResponseBody
    public JSONObject batchDeleteMenu(@RequestParam String ids) {
        JSONObject jsonObject = new JSONObject();
        menuService.batchDelete(ids);
        jsonObject.put("status", 1);
        return jsonObject;


    }

    /************************Button*****************************/

    @RequestMapping(value = "/listBtn")
    @ResponseBody
    public JSONObject listBtn(@RequestParam Integer menuId, String keyword) {
        EntityWrapper<Button> ew = new EntityWrapper<>();
        ew.where("del_flag={0}", Const.DEL_FLAG_NORMAL);
        ew.addFilter("menu_id={0}", menuId);
        if (!StringUtils.isEmpty(keyword))
            ew.addFilter(" CONCAT(IFNULL(button_name,''),IFNULL(button_url,'')) like {0}", "%" + keyword + "%");
        return jsonPage(buttonService.selectPage(getPage(), ew));

    }

    @RequestMapping(value = "/addBtn", method = RequestMethod.GET)
    public String toAddBtn(@RequestParam Integer menuId, ModelMap map) {
        map.put("menuId", menuId);
        return "sys/right/button_add";
    }

    @RequestMapping(value = "/addBtn", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addBtn(Button button) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 1);
        button.setDelFlag(Const.DEL_FLAG_NORMAL);
        buttonService.insert(button);
        return jsonObject;
    }

    @RequestMapping(value = "/editBtn", method = RequestMethod.GET)
    public String toEditBtn(@RequestParam Integer buttonId, ModelMap map) {
        Button button = buttonService.selectById(buttonId);
        map.put("button", button);
        return "sys/right/button_edit";
    }

    @RequestMapping(value = "/editBtn", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editBtn(Button button) {
        JSONObject jsonObject = new JSONObject();
        buttonService.updateById(button);
        jsonObject.put("status", 1);
        return jsonObject;
    }

    @RequestMapping(value = "/deleteBtn")
    @ResponseBody
    public JSONObject deleteBtn(@RequestParam Integer buttonId) {
        buttonService.delete(buttonId);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 1);
        return jsonObject;
    }

    @RequestMapping(value = "/batchDeleteBtn")
    @ResponseBody
    public JSONObject batchDeleteBtn(@RequestParam String ids) {
        JSONObject jsonObject = new JSONObject();
        buttonService.batchDelete(ids);
        jsonObject.put("status", 1);
        return jsonObject;
    }

}
