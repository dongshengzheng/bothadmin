package com.fish.idle.site.web;

import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by szy on 29/11/2016.
 * 作品
 */
@Controller
@RequestMapping(value = "/works")
public class WorkController extends BaseController {

    @Value("${img_oss_path}")
    private String imgOssPath;

    // TODO: 08/12/2016 记录登记到第几步骤

    @Autowired
    private IGoodsInfoService goodsInfoService;

    @Autowired
    private IWorksInfoService worksInfoService;

    @Autowired
    private IWorksLevelService worksLevelService;

    @Autowired
    private IValueReportService valueReportService;

    @Autowired
    private IConsumerService consumerService;


    @RequestMapping(value = "detail/{goodsId}", method = RequestMethod.GET)
    public String detail(@PathVariable Integer goodsId, ModelMap map) {
        if (StringUtils.isNotEmpty(goodsId.toString())) {

            GoodsInfo goodsInfo = goodsInfoService.selectById(goodsId);
            String imgStr = goodsInfo.getImgs();
            String[] imgArr = imgStr.split(",");
            List<String> goodsInfoImages = new ArrayList<>();

            for (String s : imgArr) {
                goodsInfoImages.add(imgOssPath + s);
            }
            WorksInfo worksInfo = worksInfoService.getWorksInfoByGoodsId(goodsId);
            WorksLevel worksLevel = worksLevelService.getWorksLevelByGoodsId(goodsId);
            ValueReport valueReport = valueReportService.getValueReportByGoodsId(goodsId);
            Consumer consumer = consumerService.getConsumerByGoodsId(goodsId);

            map.put("goodsInfo", goodsInfo);
            map.put("worksInfo", worksInfo);
            map.put("worksLevel", worksLevel);
            map.put("valueReport", valueReport);
            map.put("consumer", consumer);

            //作品信息图片列表
            map.put("goodsInfoImages", goodsInfoImages);
            //评估报告图片
            map.put("pgbgImg", imgOssPath + valueReport.getJzrzImge());
            //todo 转让历史列表

            //todo 诠释列表


            //todo 收藏者列表

            //todo 最近浏览的人

            return "works/work_detail";
        }
        return "index";
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
        goodsInfo.setDelFlag(Const.DEL_FLAG_NORMAL);

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
            GoodsInfo goodsInfo = getGoodsInfoById(worksInfo.getGoodsId());
            if (type == 1) {
                //存为草稿
                worksInfo.setIsDraft(1);
            }
            worksInfo.setUpdateBy("1");
            worksInfo.setUpdateDate(new Date());
            worksInfo.setCreateBy("1");
            worksInfo.setCreateDate(new Date());
            worksInfo.setDelFlag(Const.DEL_FLAG_NORMAL);

            boolean result = worksInfoService.insert(worksInfo);

            if (result) {
                map.put("goodsName", goodsInfo.getName());
                map.put("goodsId", goodsInfo.getId());
                map.put("step", 3);
            } else {
                map.put("success", false);
                map.put("msg", "添加失败");
                map.put("step", 2);
            }
        }
        return "works/work_register";
    }

    /**
     * 登记作品等级
     *
     * @param worksLevel
     * @return
     */
    @RequestMapping(value = "/addWorksLevel/{type}", method = RequestMethod.POST)
    public String addWorksLevel(@ModelAttribute WorksLevel worksLevel, ModelMap map, @PathVariable Integer type) {
        //判断goodsId
        if (null == worksLevel.getWorksId()) {
            map.put("step", 1);
        } else {
            GoodsInfo goodsInfo = goodsInfoService.selectById(worksLevel.getWorksId());
            if (type == 1) {
                //存为草稿
                worksLevel.setIsDraft(1);
            }
            worksLevel.setUpdateBy("1");
            worksLevel.setUpdateDate(new Date());
            worksLevel.setCreateBy("1");
            worksLevel.setCreateDate(new Date());
            worksLevel.setDelFlag(Const.DEL_FLAG_NORMAL);

            boolean result = worksLevelService.insert(worksLevel);

            if (result) {
                map.put("goodsName", goodsInfo.getName());
                map.put("goodsId", goodsInfo.getId());
                map.put("step", 4);
            } else {
                map.put("success", false);
                map.put("msg", "添加失败");
                map.put("step", 3);
            }
        }
        return "works/work_register";
    }

    /**
     * 登记价值报告
     *
     * @param valueReport
     * @return
     */
    @RequestMapping(value = "/addValueReport/{type}", method = RequestMethod.POST)
    public String addValueReport(@ModelAttribute ValueReport valueReport, ModelMap map, @PathVariable Integer type) {
        //判断goodsId
        if (null == valueReport.getGoodsId()) {
            map.put("step", 1);
        } else {
            GoodsInfo goodsInfo = getGoodsInfoById(valueReport.getGoodsId());
            if (type == 1) {
                //存为草稿
                valueReport.setIsDraft(1);
            }
            valueReport.setUpdateBy("1");
            valueReport.setUpdateDate(new Date());
            valueReport.setCreateBy("1");
            valueReport.setCreateDate(new Date());
            valueReport.setDelFlag(Const.DEL_FLAG_NORMAL);

            boolean result = valueReportService.insert(valueReport);
            if (result) {
                map.put("goodsName", goodsInfo.getName());
                map.put("goodsId", goodsInfo.getId());
                map.put("step", 5);
            } else {
                map.put("goodsName", goodsInfo.getName());
                map.put("goodsId", goodsInfo.getId());
                map.put("success", false);
                map.put("msg", "添加失败");
                map.put("step", 4);
            }
        }
        return "works/work_register";
    }

    /**
     * 第五步
     * 登记收藏者信息
     *
     * @param consumer
     * @return
     */
    @RequestMapping(value = "/addCollect/{type}", method = RequestMethod.POST)
    public String addCollect(@ModelAttribute Consumer consumer, ModelMap map, @PathVariable Integer type) {
        //判断goodsId
        if (null == consumer.getWorksId()) {
            map.put("step", 1);
        } else {
            GoodsInfo goodsInfo = getGoodsInfoById(consumer.getWorksId());
            if (type == 1) {
                //存为草稿
                consumer.setIsDraft(1);
            }
            consumer.setUpdateBy("1");
            consumer.setUpdateDate(new Date());
            consumer.setCreateBy("1");
            consumer.setCreateDate(new Date());
            consumer.setDelFlag(Const.DEL_FLAG_NORMAL);

            boolean result = consumerService.insert(consumer);
            if (result) {
                map.put("goodsName", goodsInfo.getName());
                map.put("goodsId", goodsInfo.getId());
                map.put("step", 1);
            } else {
                map.put("goodsName", goodsInfo.getName());
                map.put("goodsId", goodsInfo.getId());
                map.put("success", false);
                map.put("msg", "添加失败");
                map.put("step", 5);
            }
        }
        return "works/work_edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(ModelMap map) {
        map.put("step", 2);
        return "works/work_edit";
    }


    private GoodsInfo getGoodsInfoById(Integer id) {
        return goodsInfoService.selectById(id);
    }


}
