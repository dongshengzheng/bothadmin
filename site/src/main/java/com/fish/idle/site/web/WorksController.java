package com.fish.idle.site.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.StringUtils;
import com.fish.idle.site.entity.GoodsInfoRequest;
import com.fish.idle.site.entity.Paging;
import com.fish.idle.site.entity.WorkInfoRequest;
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

    @Autowired
    private IValueReportService valueReportService;

    @Autowired
    private IConsumerService consumerService;

    @Autowired
    private IWorksService worksService;

    @RequestMapping(value = "/demo", method = RequestMethod.GET)
    public String demo(ModelMap map) {
        return "works/works_demo";
    }


    @Autowired
    private IDictService dictService;

    @RequestMapping(value = "search",method = RequestMethod.GET)
    public String search(ModelMap map,@RequestParam(value ="keywords",required = false) String keywords,
                         @RequestParam(value = "start",required = false) Integer start,
                         @RequestParam(value= "length",required = false) Integer length){
        Paging paging = new Paging();
        if(null == start){
            start = 1;
        }
        if(null == length){
            length = 6;
        }
        //首页全部作品(pageSize=6)
        EntityWrapper<Works> ew = getEntityWrapper();
        if(org.apache.commons.lang.StringUtils.isNotBlank(keywords)){
            ew.addFilter("name like {0}","%"+keywords.trim()+"%");
        }
        Page<Works> page = worksService.selectPage(getPage(start,length),ew);
        for (Works item:page.getRecords()){
            String[] imageArr = item.getImages().split(",");
            item.setImages(imgOssPath + imageArr[0]);
        }
        paging.setData(page.getRecords());
        paging.setTotalPages(page.getPages());
        paging.setCurrent(start);
        paging.setPageSize(length);
        map.put("worksPaging",paging);
        return "search/search_works_result";
    }


    @RequestMapping(value = "detail/{goodsId}", method = RequestMethod.GET)
    public String detail(@PathVariable Integer goodsId, ModelMap map) {
        if (StringUtils.isNotEmpty(goodsId.toString())) {
            Works works = worksService.selectById(goodsId);
            String imgStr = works.getImages();
            String[] imgArr = imgStr.split(",");
            List<String> goodsInfoImages = new ArrayList<>();

            for (String s : imgArr) {
                goodsInfoImages.add(imgOssPath + s);
            }
            WorksLevel worksLevel = worksLevelService.getWorksLevelByGoodsId(goodsId);
            ValueReport valueReport = valueReportService.getValueReportByGoodsId(goodsId);
            Consumer consumer = consumerService.getConsumerByGoodsId(goodsId);
            map.put("works", works);
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
     * @param goodsInfoRequest
     * @return
     */
    @RequestMapping(value = "/addGoodsInfo/{type}", method = RequestMethod.POST)
    public String addGoodsInfo(@ModelAttribute GoodsInfoRequest goodsInfoRequest, ModelMap map, @PathVariable Integer type) {
        if (type == 1) {
            //存为草稿
            goodsInfoRequest.setIsDraft(Integer.valueOf(Const.WORKS_STATUS_DRAFT));
        }
        //生成works
        Works works = new Works();
        works.setName(goodsInfoRequest.getName());
        works.setRemarks(goodsInfoRequest.getDescription());
        works.setStatus(Const.WORKS_STATUS_UNPASS);
        works.setProvideBy(goodsInfoRequest.getProvideBy());
        works.setImages(goodsInfoRequest.getImgs());
        works.setDelFlag(String.valueOf(Const.DEL_FLAG_NORMAL));
        works.setCreateBy(1);
        works.setCreateDate(new Date());
        boolean isWorkOk = worksService.insert(works);
        //生成提供者
        Consumer consumer = new Consumer();
        consumer.setType(String.valueOf(1));
        consumer.setNo(goodsInfoRequest.getCardNo());
        consumer.setAddress(goodsInfoRequest.getAddress());
        consumer.setWorksId(works.getId());
        consumer.setPhone(goodsInfoRequest.getContact());
        consumer.setDatetime(goodsInfoRequest.getRegisterTime());
        consumer.setCreateBy(1);
        consumer.setDelFlag(Const.DEL_FLAG_NORMAL);
        boolean isConsumerOk = consumerService.insert(consumer);
        if (isWorkOk && isConsumerOk) {
            //矿区地域
            List<Dict> kqdy = getWorksLevelDicByType("dd_kqdy");
            //todo  篆刻级别
            List<Dict> level = getWorksLevelDicByType("dd_level");
            List<Dict> pinzhong = getWorksLevelDicByType("dd_pinzhong");
            List<Dict> zuopinleixing = getWorksLevelDicByType("dd_zuopinleixing");
            //todo  工艺制作
            map.put("kqdy",kqdy);
            map.put("level",level);
            map.put("pinzhong",pinzhong);
            map.put("zuopinleixing",zuopinleixing);
            map.put("goodsName", works.getName());
            map.put("goodsId", works.getId());
            map.put("success", true);
            map.put("msg", "添加成功");
            map.put("step", 2);


        } else {
            map.put("success", false);
            map.put("msg", "添加失败");
            map.put("step", 1);
            map.put("goodsInfoRequest", goodsInfoRequest);
            map.put("consumer", consumer);
        }
        return "works/work_register";
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
                works.setWorksMeanning(workInfoRequest.getWorksExplanation());
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
                    map.put("zhidi1",zhidi1);
                    map.put("zhidi2",zhidi2);
                    map.put("ganguan",ganguan);
                    map.put("moshidu",moshidu);
                    map.put("xueliang",xueliang);
                    map.put("xuese",xuese);
                    map.put("xuexing",xuexing);
                    map.put("nongyandu",nongyandu);
                    map.put("jingdu",jingdu);
                    map.put("dise",dise);
                    map.put("liu",liu);
                    map.put("lie",lie);
                    map.put("mian",mian);
                    map.put("hanxuefangshi",hanxuefangshi);
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
            Works works = worksService.selectById(worksLevel.getWorksId());
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
                map.put("goodsName", works.getName());
                map.put("goodsId", works.getId());
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
        if (null == valueReport.getWorksId()) {
            map.put("step", 1);
        } else {
            Works works = worksService.selectById(valueReport.getWorksId());
            if (type == 1) {
                //todo 存为草稿

            }
            valueReport.setUpdateBy("1");
            valueReport.setUpdateDate(new Date());
            valueReport.setCreateBy("1");
            valueReport.setCreateDate(new Date());

            boolean result = valueReportService.insert(valueReport);
            if (result) {
                map.put("goodsName", works.getName());
                map.put("goodsId", works.getId());
                map.put("step", 5);
            } else {
                map.put("goodsName", works.getName());
                map.put("goodsId", works.getId());
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
//        //判断goodsId
        if (null == consumer.getWorksId()) {
            map.put("step", 1);
        } else {
            Works works = worksService.selectById(consumer.getWorksId());
            if (type == 1) {
                //存为草稿
                consumer.setIsDraft(1);
            }
            consumer.setUpdateBy(1);
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

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(ModelMap map) {
        map.put("step", 2);
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
    private List<Dict> getWorksLevelDicByType(String type){
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.addFilter("type={0}",type);
        List<Dict> list = dictService.selectList(entityWrapper);
        return list;
    }


}