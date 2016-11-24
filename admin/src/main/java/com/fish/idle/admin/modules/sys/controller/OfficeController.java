package com.fish.idle.admin.modules.sys.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.admin.controller.BaseController;
import com.fish.idle.service.modules.sys.entity.Office;
import com.fish.idle.service.modules.sys.service.IOfficeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Office 控制层
 */
@Controller(value = "office")
public class OfficeController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(OfficeController.class);

    @Autowired
    private IOfficeService officeService;
    @RequestMapping
    public String menu() {
        return "sys/office/office_list";
    }


    @RequestMapping(value = "/list")
    @ResponseBody
    public JSONObject listMenu(Office office) {
        Page<Office> page = getPage();
        return jsonPage(officeService.selectPage(page, null));

    }
}