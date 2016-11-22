package com.fish.idle.admin.system.controller;

import com.fish.idle.admin.system.service.DictService;
import com.fish.idle.admin.controller.BaseController;
import com.fish.idle.service.util.PageData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by szy on 21/11/2016.
 */
@Controller()
@RequestMapping(value = "/dict")
public class DictController extends BaseController {


    private static Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Resource(name = "dictionariesService")
    private DictService dictionariesService;


    @RequestMapping
    public ModelAndView page() {
        ModelAndView mv = super.getModelAndView();
        mv.setViewName("sys/dictionaries/dictionaries_list");
        return mv;
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public PageData list() {
        PageData result = null;
        try {
            PageData pd = super.getPageData();
            result = dictionariesService.list(pd);
        } catch (Exception e) {
            logger.error("list dictionaries error", e);
            result = new PageData();
        }
        return result;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView toAdd() {
        ModelAndView mv = super.getModelAndView();
        mv.setViewName("sys/dictionaries/dictionaries_add");
        return mv;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public PageData add() {
        PageData result = new PageData();
        try {
            PageData pd = super.getPageData();
            pd.put("status", 1);
            dictionariesService.add(pd);
            result.put("status", 1);
        } catch (Exception e) {
            logger.error("add dictionaries error", e);
            result.put("status", 0);
            result.put("msg", "新增失败");
        }
        return result;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView toEdit(@RequestParam Integer id) {
        PageData pd = null;
        try {
            pd = dictionariesService.getById(id);
        } catch (Exception e) {
            logger.error("get dictionaries error", e);
        }
        ModelAndView mv = super.getModelAndView();
        mv.addObject("pd", pd);
        mv.setViewName("sys/dictionaries/dictionaries_edit");
        return mv;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public PageData edit() {
        PageData result = new PageData();
        try {
            PageData pd = super.getPageData();
            dictionariesService.edit(pd);
            result.put("status", 1);
        } catch (Exception e) {
            logger.error("edit dictionaries error", e);
            result.put("status", 0);
            result.put("msg", "更新失败");
        }
        return result;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public PageData delete(@RequestParam Integer id) {
        PageData result = new PageData();
        try {
            Integer line = dictionariesService.delete(id);
            if (line > 0) {
                result.put("status", 1);
            } else {
                result.put("status", 0);
                result.put("msg", "删除失败或者为不可删除状态");
            }
        } catch (Exception e) {
            logger.error("delete dictionaries error", e);
            result.put("status", 0);
            result.put("msg", "删除失败");
        }
        return result;
    }







}
