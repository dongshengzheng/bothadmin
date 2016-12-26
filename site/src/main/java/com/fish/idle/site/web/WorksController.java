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

    // TODO: 08/12/2016 记录登记到第几步骤

    @Autowired
    private IWorksLevelService worksLevelService;

//    @Autowired
//    private IValueReportService valueReportService;

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
        map.put("kqdy", getWorksLevelDicByType("dd_kqdy"));
        map.put("level", getWorksLevelDicByType("dd_level"));
        map.put("pinzhong", getWorksLevelDicByType("dd_pinzhong"));
        map.put("zuopinleixing", getWorksLevelDicByType("dd_zuopinleixing"));
        map.put("gyType", getWorksLevelDicByType("dd_level"));
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
        map.put("zhidi1", getWorksLevelDicByType("dd_zhidi"));
        map.put("zhidi2", getWorksLevelDicByType("dd_zhidi2"));
        map.put("ganguan", getWorksLevelDicByType("dd_ganguan"));
        map.put("moshidu", getWorksLevelDicByType("dd_moshidu"));
        map.put("xueliang", getWorksLevelDicByType("dd_xueliang"));
        map.put("xuese", getWorksLevelDicByType("dd_xuese"));
        map.put("xuexing", getWorksLevelDicByType("dd_xuexing"));
        map.put("nongyandu", getWorksLevelDicByType("dd_nongyandu"));
        map.put("jingdu", getWorksLevelDicByType("dd_jingdu"));
        map.put("dise", getWorksLevelDicByType("dd_dise"));
        map.put("liu", getWorksLevelDicByType("dd_liu"));
        map.put("lie", getWorksLevelDicByType("dd_lie"));
        map.put("mian", getWorksLevelDicByType("dd_mian"));
        map.put("hanxuefangshi", getWorksLevelDicByType("dd_hanxuefangshi"));
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

        WorksLevel worksLevel = worksLevelService.selectOne(new WorksLevel(id));
        map.put("worksLevel", worksLevel);
//        ValueReport valueReport = valueReportService.selectOne(new ValueReport(id));
//        map.put("valueReport", valueReport);
        Consumer provider = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_PROVIDER, id));
        map.put("provider", provider);
        Consumer collect = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_COLLECT, id));
        map.put("collect", collect);
        Report report = reportService.selectOne(new Report(id));
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
        map.put("kqdy", getWorksLevelDicByType("dd_kqdy"));
        map.put("level", getWorksLevelDicByType("dd_level"));
        map.put("pinzhong", getWorksLevelDicByType("dd_pinzhong"));
        map.put("zuopinleixing", getWorksLevelDicByType("dd_zuopinleixing"));
        map.put("gyType", getWorksLevelDicByType("dd_level"));

        // 作品登记
        map.put("zhidi1", getWorksLevelDicByType("dd_zhidi"));
        map.put("zhidi2", getWorksLevelDicByType("dd_zhidi2"));
        map.put("ganguan", getWorksLevelDicByType("dd_ganguan"));
        map.put("moshidu", getWorksLevelDicByType("dd_moshidu"));
        map.put("xueliang", getWorksLevelDicByType("dd_xueliang"));
        map.put("xuese", getWorksLevelDicByType("dd_xuese"));
        map.put("xuexing", getWorksLevelDicByType("dd_xuexing"));
        map.put("nongyandu", getWorksLevelDicByType("dd_nongyandu"));
        map.put("jingdu", getWorksLevelDicByType("dd_jingdu"));
        map.put("dise", getWorksLevelDicByType("dd_dise"));
        map.put("liu", getWorksLevelDicByType("dd_liu"));
        map.put("lie", getWorksLevelDicByType("dd_lie"));
        map.put("mian", getWorksLevelDicByType("dd_mian"));
        map.put("hanxuefangshi", getWorksLevelDicByType("dd_hanxuefangshi"));
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


    @RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable Integer id, ModelMap map) {
        if (id == null) {
            return "redirect:/";
        }
        Works works = worksService.selectById(id);
        if (works == null) {
            return "redirect:/404";
        }
        map.put("works", works);
        List<Images> worksImage = imagesService.selectList(new EntityWrapper<>(new Images(id, Const.IMAGES_WORKS)));
        //作品信息图片列表
        map.put("worksImage", worksImage);
        WorksLevel worksLevel = worksLevelService.selectOne(new WorksLevel(id));
        map.put("worksLevel", worksLevel);
//        ValueReport valueReport = valueReportService.selectOne(new ValueReport(id));
//        map.put("valueReport", valueReport);
        Consumer provider = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_PROVIDER, id));
        map.put("provider", provider);
        Consumer collect = consumerService.selectOne(new Consumer(Const.CONSUMER_TYPE_COLLECT, id));
        map.put("collect", collect);
        Report report = reportService.selectOne(new Report(id));
        map.put("report", report);

        //评估报告图片
        List<Images> reportImage = imagesService.selectList(new EntityWrapper<>(new Images(id, Const.IMAGES_REPORT_DES)));
        map.put("reportImage", reportImage.get(0));
        //评估价值认证照片
        List<Images> certifyImage = imagesService.selectList(new EntityWrapper<>(new Images(report.getId(), Const.IMAGES_REPORT_CERTIFICATE)));
        map.put("certifyImage", certifyImage);
        //todo 转让历史列表
        //todo 诠释列表
        //todo 收藏者列表
        //todo 最近浏览的人

        return "works/work_detail";
    }

    /**
     * 第五步：登记收藏者信息
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
     * 登记作品信息
     *
     * @param workInfoRequest
     * @return
     */
    @RequestMapping(value = "/addWorksInfo/{type}", method = RequestMethod.POST)
    public String addWorksInfo(@ModelAttribute WorkInfoRequest workInfoRequest, ModelMap map, @PathVariable Integer type) {
        //判断goodsId
        if (null == workInfoRequest.getGoodsId()) {
            map.put("step", 1);
        } else {
            Works works = worksService.selectById(workInfoRequest.getGoodsId());
            if (works != null) {
                works.setBreed(workInfoRequest.getBreed());
                works.setType(workInfoRequest.getType());
                works.setLength(workInfoRequest.getLength());
                works.setWidth(workInfoRequest.getWidth());
                works.setHeight(workInfoRequest.getHeight());
                works.setWeight(workInfoRequest.getWeight());
                works.setGyType(workInfoRequest.getProductionProcess());
                //篆刻级别
                works.setLevelZk(workInfoRequest.getSealCuttingLevel());
                works.setKqdy(workInfoRequest.getMineArea());
                works.setMaker(workInfoRequest.getProducer());
                works.setMakeTime(workInfoRequest.getProduceTime());
                works.setWorksMeaning(workInfoRequest.getWorksExplanation());
                boolean isOk = worksService.updateById(works);
                if (isOk) {
                    //质地一
                    List<Dict> zhidi1 = getWorksLevelDicByType("dd_zhidi");
                    List<Dict> zhidi2 = getWorksLevelDicByType("dd_zhidi2");
                    List<Dict> ganguan = getWorksLevelDicByType("dd_ganguan");
                    List<Dict> moshidu = getWorksLevelDicByType("dd_moshidu");
                    List<Dict> xueliang = getWorksLevelDicByType("dd_xueliang");
                    List<Dict> xuese = getWorksLevelDicByType("dd_xuese");
                    List<Dict> xuexing = getWorksLevelDicByType("dd_xuexing");
                    List<Dict> nongyandu = getWorksLevelDicByType("dd_nongyandu");
                    List<Dict> jingdu = getWorksLevelDicByType("dd_jingdu");
                    List<Dict> dise = getWorksLevelDicByType("dd_dise");
                    //活经
                    List<Dict> liu = getWorksLevelDicByType("dd_liu");
                    List<Dict> lie = getWorksLevelDicByType("dd_lie");
//                    印章含血面
                    List<Dict> mian = getWorksLevelDicByType("dd_mian");
                    List<Dict> hanxuefangshi = getWorksLevelDicByType("dd_hanxuefangshi");
                    map.put("zhidi1", zhidi1);
                    map.put("zhidi2", zhidi2);
                    map.put("ganguan", ganguan);
                    map.put("moshidu", moshidu);
                    map.put("xueliang", xueliang);
                    map.put("xuese", xuese);
                    map.put("xuexing", xuexing);
                    map.put("nongyandu", nongyandu);
                    map.put("jingdu", jingdu);
                    map.put("dise", dise);
                    map.put("liu", liu);
                    map.put("lie", lie);
                    map.put("mian", mian);
                    map.put("hanxuefangshi", hanxuefangshi);
                    map.put("goodsName", works.getName());
                    map.put("goodsId", works.getId());
                    map.put("step", 3);
                } else {
                    map.put("success", false);
                    map.put("msg", "添加失败");
                    map.put("step", 2);
                    map.put("worksInfoRequest", workInfoRequest);
                }
            }
        }
        return "/WEB-INF/ftl/works/work_add.ftl";
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
            Works works = worksService.selectById(worksLevel.getWorksId());
            worksLevel.setUpdateDate(new Date());
            worksLevel.setCreateDate(new Date());
            worksLevel.setDelFlag(Const.DEL_FLAG_NORMAL);

            boolean result = worksLevelService.insert(worksLevel);

            if (result) {
                map.put("goodsName", works.getName());
                map.put("goodsId", works.getId());
                map.put("step", 4);
            } else {
                map.put("success", false);
                map.put("msg", "添加失败");
                map.put("step", 3);
            }
        }
        return "/WEB-INF/ftl/works/work_add.ftl";
    }

    /**
     * 登记价值报告
     *
     * @param valueReport
     * @return
     */
//    @RequestMapping(value = "/addValueReport/{type}", method = RequestMethod.POST)
//    public String addValueReport(@ModelAttribute ValueReport valueReport, ModelMap map, @PathVariable Integer type) {
//        //判断goodsId
//        if (null == valueReport.getWorksId()) {
//            map.put("step", 1);
//        } else {
//            Works works = worksService.selectById(valueReport.getWorksId());
//            if (type == 1) {
//                //todo 存为草稿
//
//            }
//            valueReport.setUpdateBy("1");
//            valueReport.setUpdateDate(new Date());
//            valueReport.setCreateBy("1");
//            valueReport.setCreateDate(new Date());
//
//            boolean result = valueReportService.insert(valueReport);
//            if (result) {
//                map.put("goodsName", works.getName());
//                map.put("goodsId", works.getId());
//                map.put("step", 5);
//            } else {
//                map.put("goodsName", works.getName());
//                map.put("goodsId", works.getId());
//                map.put("success", false);
//                map.put("msg", "添加失败");
//                map.put("step", 4);
//            }
//        }
//        return "/WEB-INF/ftl/works/work_add.ftl";
//    }

    /**
     * 第五步
     * 登记收藏者信息
     *
     * @param consumer
     * @return
     */
    @RequestMapping(value = "/addCollect/{type}", method = RequestMethod.POST)
    public String addCollect(@ModelAttribute Consumer consumer, ModelMap map, @PathVariable Integer type) {
//        //判断goodsId
        if (null == consumer.getWorksId()) {
            map.put("step", 1);
        } else {
            Works works = worksService.selectById(consumer.getWorksId());

            consumer.setUpdateDate(new Date());
            consumer.setCreateBy(1);
            consumer.setCreateDate(new Date());
            consumer.setDelFlag(Const.DEL_FLAG_NORMAL);
            //收藏者
            consumer.setType(String.valueOf(2));

            boolean result = consumerService.insert(consumer);
            if (result) {
                map.put("goodsName", works.getName());
                map.put("goodsId", works.getId());
                map.put("step", 1);
            } else {
                map.put("goodsName", works.getName());
                map.put("goodsId", works.getId());
                map.put("success", false);
                map.put("msg", "添加失败");
                map.put("step", 5);
            }
        }
        return "works/work_edit";
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

    //    获取作品登记字典表
    private List<Dict> getWorksLevelDicByType(String type) {
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.addFilter("type={0}", type);
        List<Dict> list = dictService.selectList(entityWrapper);
        return list;
    }


    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(ModelMap map, @RequestParam(value = "keywords", required = false) String keywords,
                         @RequestParam(value = "start", required = false) Integer start,
                         @RequestParam(value = "length", required = false) Integer length) {
        Paging paging = new Paging();
        if (null == start) {
            start = 1;
        }
        if (null == length) {
            length = 6;
        }
        //首页全部作品(pageSize=6)
        EntityWrapper<Works> ew = getEntityWrapper();
        if (org.apache.commons.lang.StringUtils.isNotBlank(keywords)) {
            ew.addFilter("name like {0}", "%" + keywords.trim() + "%");
        }
        Page<Works> page = worksService.selectPage(getPage(start, length), ew);
        for (Works item : page.getRecords()) {
            String[] imageArr = item.getImages().split(",");
            item.setImages(imgOssPath + imageArr[0]);
        }
        paging.setData(page.getRecords());
        paging.setTotalPages(page.getPages());
        paging.setCurrent(start);
        paging.setPageSize(length);
        map.put("worksPaging", paging);
        return "search/search_works_result";
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
