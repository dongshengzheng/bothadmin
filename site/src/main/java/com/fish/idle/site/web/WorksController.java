package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.StringUtils;
import com.fish.idle.site.entity.Paging;
import com.fish.idle.site.entity.WorkInfoRequest;
import com.fish.idle.site.entity.WorksBo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by szy on 29/11/2016.
 * 作品
 */
@Controller
@RequestMapping(value = "/works")
public class WorksController extends BaseController {

    @Value("${img_oss_path}")
    private String imgOssPath;

    @Autowired
    private IWorksLevelService worksLevelService;


    @Autowired
    private IConsumerService consumerService;

    @Autowired
    private IWorksService worksService;


    @Autowired
    private IDictService dictService;


    @Autowired
    private IImagesService imagesService;


    @Autowired
    private IReportService reportService;

    /**
     * 第一步：登记物品信息
     *
     * @return
     */
    @RequestMapping(value = {"/add"}, method = RequestMethod.GET)
    public String add(ModelMap map) {
        return "works/work_add_provider";
    }






    /**
     * 第一步：登记物品信息
     *
     * @return
     */
    @RequestMapping(value = "/add/provider", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject saveProvider(Works works, Consumer consumer,
                                   @RequestParam(required = false) String worksRemarks,
                                   @RequestParam(required = false) String provider
    ) {

        JSONObject jsonObject = new JSONObject();

        // 保存作品信息
        wrapInsertEntity(works);
        works.setRemarks(worksRemarks);
        if (!worksService.insert(works)) {
            jsonObject.put("suc", false);
            jsonObject.put("msg", "保存作品信息出错");
            return jsonObject;
        }

        //保存提供者
        wrapInsertEntity(consumer);
        consumer.setName(provider);
        consumer.setWorksId(works.getId());
        if (!consumerService.insert(consumer)) {
            jsonObject.put("suc", false);
            jsonObject.put("msg", "保存提供者信息出错");
            return jsonObject;
        }
        insertImage(works.getImages(), works.getId(), Const.IMAGES_WORKS);


        jsonObject.put("suc", true);
        jsonObject.put("id", works.getId());
        return jsonObject;
    }


    /**
     * 第二步：登记作品信息
     *
     * @return
     */
    @RequestMapping(value = "/add/{id}/info", method = RequestMethod.GET)
    public String info(ModelMap map, @PathVariable Integer id) {
        Works works = worksService.selectById(id);
        //矿区地域
        map.put("kqdy", dictService.getWorksLevelDicByType("dd_kqdy"));
        map.put("level", dictService.getWorksLevelDicByType("dd_level"));
        map.put("pinzhong", dictService.getWorksLevelDicByType("dd_pinzhong"));
        map.put("zuopinleixing", dictService.getWorksLevelDicByType("dd_zuopinleixing"));
        map.put("gyType", dictService.getWorksLevelDicByType("dd_level"));
        map.put("works", works);
        return "works/work_add_info";
    }

    /**
     * 第二步：登记作品信息
     *
     * @return
     */
    @RequestMapping(value = "/add/info", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject saveInfo(Works works) {
        wrapUpdateEntity(works);
        JSONObject jsonObject = new JSONObject();
        if (!worksService.updateSelectiveById(works)) {
            jsonObject.put("suc", false);
            jsonObject.put("msg", "保存作品信息出错");
            return jsonObject;
        }
        jsonObject.put("suc", true);
        return jsonObject;
    }


    /**
     * 第三步：登记作品等级
     *
     * @return
     */
    @RequestMapping(value = "/add/{id}/level", method = RequestMethod.GET)
    public String level(ModelMap map, @PathVariable Integer id) {
        Works works = worksService.selectById(id);
        map.put("zhidi1", dictService.getWorksLevelDicByType("dd_zhidi"));
        map.put("zhidi2", dictService.getWorksLevelDicByType("dd_zhidi2"));
        map.put("ganguan", dictService.getWorksLevelDicByType("dd_ganguan"));
        map.put("moshidu", dictService.getWorksLevelDicByType("dd_moshidu"));
        map.put("xueliang", dictService.getWorksLevelDicByType("dd_xueliang"));
        map.put("xuese", dictService.getWorksLevelDicByType("dd_xuese"));
        map.put("xuexing", dictService.getWorksLevelDicByType("dd_xuexing"));
        map.put("nongyandu", dictService.getWorksLevelDicByType("dd_nongyandu"));
        map.put("jingdu", dictService.getWorksLevelDicByType("dd_jingdu"));
        map.put("dise", dictService.getWorksLevelDicByType("dd_dise"));
        map.put("liu", dictService.getWorksLevelDicByType("dd_liu"));
        map.put("lie", dictService.getWorksLevelDicByType("dd_lie"));
        map.put("mian", dictService.getWorksLevelDicByType("dd_mian"));
        map.put("hanxuefangshi", dictService.getWorksLevelDicByType("dd_hanxuefangshi"));
        map.put("works", works);
        return "works/work_add_level";
    }


    /**
     * 第三步：登记作品等级
     *
     * @return
     */
    @RequestMapping(value = "/add/level", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject saveLevel(WorksLevel worksLevel) {
        JSONObject jsonObject = new JSONObject();

        wrapInsertEntity(worksLevel);

        if (!worksLevelService.insert(worksLevel)) {
            jsonObject.put("suc", false);
            jsonObject.put("msg", "保存作品等级出错");
            return jsonObject;
        }
        jsonObject.put("suc", true);
        return jsonObject;
    }


    /**
     * 第四步：登记评估报告
     *
     * @return
     */
    @RequestMapping(value = "/add/{id}/report", method = RequestMethod.GET)
    public String report(ModelMap map, @PathVariable Integer id) {
        Works works = worksService.selectById(id);
        map.put("works", works);
        return "works/work_add_report";
    }

    /**
     * 第四步：登记评估报告
     *
     * @return
     */
    @RequestMapping(value = "/add/report", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject saveReport(Report report,
                                 @RequestParam(required = false) String certifyImage,
                                 @RequestParam(required = false) String desImage) {
        wrapInsertEntity(report);
        JSONObject jsonObject = new JSONObject();
        if (!reportService.insert(report)) {
            jsonObject.put("suc", false);
            jsonObject.put("msg", "保存评估报告出错");
            return jsonObject;
        }
        // 保存评估报告
        insertImage(desImage, report.getId(), Const.IMAGES_REPORT_DES);
        // 保存作品认证图片
        insertImage(certifyImage, report.getId(), Const.IMAGES_REPORT_CERTIFICATE);

        jsonObject.put("suc", true);
        return jsonObject;
    }


    /**
     * 第五步：登记收藏者信息
     *
     * @return
     */
    @RequestMapping(value = "/add/{id}/collect", method = RequestMethod.GET)
    public String collect(ModelMap map, @PathVariable Integer id) {
        Works works = worksService.selectById(id);
        map.put("works", works);
        return "works/work_add_collect";
    }


    /**
     * 第五步：登记收藏者信息
     *
     * @return
     */
    @RequestMapping(value = "/add/collect", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject saveCollect(Consumer consumer) {
        JSONObject jsonObject = new JSONObject();


        wrapInsertEntity(consumer);
        if (!StringUtils.isEmpty(consumer.getPub())) {
            consumer.setPub("1");
        } else {
            consumer.setPub("0");
        }
        if (!consumerService.insert(consumer)) {
            jsonObject.put("suc", false);
            jsonObject.put("msg", "保存评估报告出错");
            return jsonObject;
        }
        jsonObject.put("suc", true);
        return jsonObject;
    }

    /**
     * 作品编辑
     *
     * @return
     */
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Integer id, ModelMap map) {
        map.put("works", worksService.selectById(id));

        WorksLevel worksLevel = worksLevelService.selectOne(new EntityWrapper<>(new WorksLevel(id)));
        map.put("worksLevel", worksLevel);
        Consumer provider = consumerService.selectOne(new EntityWrapper<>(new Consumer(Const.CONSUMER_TYPE_PROVIDER, id)));
        map.put("provider", provider);
        Consumer collect = consumerService.selectOne(new EntityWrapper<>(new Consumer(Const.CONSUMER_TYPE_COLLECT, id)));
        map.put("collect", collect);
        Report report = reportService.selectOne(new EntityWrapper<>(new Report(id)));
        map.put("report", report);

        List<Images> worksImage = imagesService.selectList(new EntityWrapper<>(new Images(id, Const.IMAGES_WORKS)));
        //作品信息图片列表
        map.put("worksImage", worksImage);

        //评估报告图片
        List<Images> reportImage = imagesService.selectList(new EntityWrapper<>(new Images(id, Const.IMAGES_REPORT_DES)));
        map.put("reportImage", reportImage);
        //评估价值认证照片
        List<Images> certifyImage = imagesService.selectList(new EntityWrapper<>(new Images(report.getId(), Const.IMAGES_REPORT_CERTIFICATE)));
        map.put("certifyImage", certifyImage);

        // 矿区地域
        map.put("kqdy", dictService.getWorksLevelDicByType("dd_kqdy"));
        map.put("level", dictService.getWorksLevelDicByType("dd_level"));
        map.put("pinzhong", dictService.getWorksLevelDicByType("dd_pinzhong"));
        map.put("zuopinleixing", dictService.getWorksLevelDicByType("dd_zuopinleixing"));
        map.put("gyType", dictService.getWorksLevelDicByType("dd_level"));

        // 作品登记
        map.put("zhidi1", dictService.getWorksLevelDicByType("dd_zhidi"));
        map.put("zhidi2", dictService.getWorksLevelDicByType("dd_zhidi2"));
        map.put("ganguan", dictService.getWorksLevelDicByType("dd_ganguan"));
        map.put("moshidu", dictService.getWorksLevelDicByType("dd_moshidu"));
        map.put("xueliang", dictService.getWorksLevelDicByType("dd_xueliang"));
        map.put("xuese", dictService.getWorksLevelDicByType("dd_xuese"));
        map.put("xuexing", dictService.getWorksLevelDicByType("dd_xuexing"));
        map.put("nongyandu", dictService.getWorksLevelDicByType("dd_nongyandu"));
        map.put("jingdu", dictService.getWorksLevelDicByType("dd_jingdu"));
        map.put("dise", dictService.getWorksLevelDicByType("dd_dise"));
        map.put("liu", dictService.getWorksLevelDicByType("dd_liu"));
        map.put("lie", dictService.getWorksLevelDicByType("dd_lie"));
        map.put("mian", dictService.getWorksLevelDicByType("dd_mian"));
        map.put("hanxuefangshi", dictService.getWorksLevelDicByType("dd_hanxuefangshi"));
        return "works/work_edit";
    }


    /**
     * 编辑作品信息
     *
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject editWorks(WorksBo worksBo) {
        JSONObject jsonObject = new JSONObject();
        wrapUpdateEntity(worksBo.getCollect());
        wrapUpdateEntity(worksBo.getWorks());
        wrapUpdateEntity(worksBo.getProvider());
        wrapUpdateEntity(worksBo.getReport());
        wrapUpdateEntity(worksBo.getLevel());
        if (!StringUtils.isEmpty(worksBo.getCollect().getPub())) {
            worksBo.getCollect().setPub("1");
        } else {
            worksBo.getCollect().setPub("0");
        }

        // 更新作品相关信息
        worksService.updateSelectiveById(worksBo.getWorks());
        worksLevelService.updateSelectiveById(worksBo.getLevel());
        reportService.updateSelectiveById(worksBo.getReport());
        consumerService.updateSelectiveById(worksBo.getProvider());
        consumerService.updateSelectiveById(worksBo.getCollect());

        // 保存图片信息
        insertImage(worksBo.getWorksImages(), worksBo.getWorks().getId(), Const.IMAGES_WORKS);
        // 保存评估报告
        insertImage(worksBo.getDesImage(), worksBo.getReport().getId(), Const.IMAGES_REPORT_DES);
        // 保存作品认证图片
        insertImage(worksBo.getCertifyImage(), worksBo.getReport().getId(), Const.IMAGES_REPORT_CERTIFICATE);

        jsonObject.put("suc", true);
        return jsonObject;
    }



    /**
     * 根据Id删除图片消息
     *
     * @return
     */
    @RequestMapping(value = "/image/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    public JSONObject saveCollect(@PathVariable Integer id) {
        JSONObject jsonObject = new JSONObject();
        imagesService.deleteById(id);
        jsonObject.put("suc", true);
        return jsonObject;
    }

    /**
     * @param binder
     * @Title: initBinder
     * @Description:日期格式转换
     * @date Apr 17, 2015
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }

    private void insertImage(String images, Integer targetId, String types) {
        // 保存图片信息
        if (images != null && images.trim().length() > 0) {
            String[] urls = images.split(",");
            List<Images> list = new ArrayList<>();
            for (String url : urls) {
                Images img = new Images();
                img.setTargetId(targetId);
                img.setUrl(url);
                img.setType(types);
                list.add(img);
            }
            imagesService.insertBatch(list);
        }
    }

}
