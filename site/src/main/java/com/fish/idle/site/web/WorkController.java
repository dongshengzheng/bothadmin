package com.fish.idle.site.web;

import com.fish.idle.service.modules.jsdd.entity.GoodsInfo;
import com.fish.idle.service.modules.jsdd.entity.WorksInfo;
import com.fish.idle.service.modules.jsdd.service.IGoodsInfoService;
import com.fish.idle.service.modules.jsdd.service.IWorksInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * Created by szy on 29/11/2016.
 * 作品
 */
@Controller
@RequestMapping(value = "/works")
public class WorkController extends BaseController {

    // TODO: 08/12/2016 记录登记到第几步骤

    @Autowired
    private IGoodsInfoService goodsInfoService;

    @Autowired
    private IWorksInfoService worksInfoService;


    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail() {
        return "works/work_detail";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String register(ModelMap map) {
        map.put("step", 1);
        return "works/work_register";
    }

    /**
     * 登记物品信息
     *
     * @param goodsInfo
     * @return
     */
    @RequestMapping(value = "/addGoodsInfo/{type}", method = RequestMethod.POST)
    public String addGoodsInfo(@ModelAttribute GoodsInfo goodsInfo, ModelMap map, @PathVariable Integer type) {
        if (type == 1) {
            //存为草稿
            goodsInfo.setIsDraft(1);
        }
        goodsInfo.setUpdateBy("1");
        goodsInfo.setUpdateDate(new Date());
        goodsInfo.setCreateBy("1");
        goodsInfo.setCreateDate(new Date());

        boolean result = goodsInfoService.insert(goodsInfo);
        if (result) {
            map.put("goodsName", goodsInfo.getName());
            map.put("goodsId", goodsInfo.getId());
            map.put("success", true);
            map.put("msg", "添加成功");
            map.put("step", 2);
        } else {
            map.put("success", false);
            map.put("msg", "添加失败");
            map.put("step", 1);
        }
        return "works/work_register";

    }

    /**
     * 登记作品信息
     *
     * @param worksInfo
     * @return
     */
    @RequestMapping(value = "/addWorksInfo/{type}", method = RequestMethod.POST)
    public String addWorksInfo(@ModelAttribute WorksInfo worksInfo, ModelMap map, @PathVariable Integer type) {
        //判断goodsId
        if (null == worksInfo.getGoodsId()) {
            map.put("step", 1);
        } else {
            if (type == 1) {
                //存为草稿
                worksInfo.setIsDraft(1);
            }
            worksInfo.setUpdateBy("1");
            worksInfo.setUpdateDate(new Date());
            worksInfo.setCreateBy("1");
            worksInfo.setCreateDate(new Date());

            boolean result = worksInfoService.insert(worksInfo);
            if (result) {
                map.put("goodsName", worksInfo.getGoodsId());
                map.put("step", 3);
            } else {
                map.put("success", false);
                map.put("msg", "添加失败");
                map.put("step", 2);
            }
        }
        return "works/work_register";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(ModelMap map) {
        map.put("step", 2);
        return "works/work_edit";
    }


}
