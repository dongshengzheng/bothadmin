package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.StringUtils;
import com.fish.idle.site.entity.WorksBo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.awt.*;
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
public class WorksDetailController extends BaseController {

    @Autowired
    private IDictService dictService;

    @Autowired
    private IWorksLevelService worksLevelService;


    @Autowired
    private IConsumerService consumerService;

    @Autowired
    private IWorksService worksService;

    @Autowired
    private IImagesService imagesService;

    @Autowired
    private IFollowHistoryService followHistoryService;

    @Autowired
    private IReportService reportService;

    @Autowired
    private IAppUserService appUserService;

    @Autowired
    private IInterpretationService interpretationService;

    @Autowired
    private ITransferHistoryService transferHistoryService;


    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Page<Works> list(@RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                            @RequestParam(required = false, defaultValue = "6") Integer pageSize,
                            @RequestParam(required = false) String keywords,
                            Works works) {
        Page<Works> page = new Page<>(pageIndex, pageSize);
        works.setStatus(Const.WORKS_STATUS_PASS);
        EntityWrapper<Works> ew = new EntityWrapper<>(works);
        ew.setSqlSelect("id,name,type,remarks,breed");
        ew.orderBy("id", false);
        if (keywords != null && keywords.trim().length() > 0) {
            ew.like("name", keywords);
        }

        Page<Works> worksPage = worksService.selectPage(page, ew);
        for (Works work : worksPage.getRecords()) {
            //品种
            if (!StringUtils.isEmpty(work.getBreed())) {
                work.setBreed(dictService.getLabelByValue(work.getBreed(), "dd_pinzhong"));
            }
            Images images = imagesService.selectOne(new EntityWrapper<>(new Images(work.getId(), Const.IMAGES_WORKS)));
            if (images != null && !StringUtils.isEmpty(images.getUrl())) {
                work.setImages(images.getUrl());
            }
        }
        return worksPage;
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

        //增加浏览记录
        FollowHistory addBrowse = new FollowHistory();
        addBrowse.setTargetId(id);
        addBrowse.setUserId(getCurrentUser().getId());
        addBrowse.setType(Const.FOLLOW_HISTORY_TYPE_BROWSE);
        FollowHistory oldBrowse = followHistoryService.selectOne(new EntityWrapper<>(addBrowse));
        if (oldBrowse == null) {
            addBrowse.setCreateDate(new Date());
            addBrowse.setUpdateDate(new Date());
            followHistoryService.insert(addBrowse);
        } else {
            oldBrowse.setUpdateDate(new Date());
            followHistoryService.updateById(oldBrowse);
        }


        //矿区地域
        if (StringUtils.isNotEmpty(works.getKqdy())) {
            works.setKqdy(dictService.getLabelByValue(works.getKqdy(), "dd_kqdy"));
        }
        //作品品种
        if (StringUtils.isNotEmpty(works.getBreed())) {
            works.setBreed(dictService.getLabelByValue(works.getBreed(), "dd_pinzhong"));
        }
        //作品类型
        if (StringUtils.isNotEmpty(works.getType())) {
            works.setType(dictService.getLabelByValue(works.getType(), "dd_zuopinleixing"));
        }
        if (StringUtils.isNotEmpty(works.getGyType())) {
            works.setGyType(dictService.getLabelByValue(works.getGyType(), "dd_level"));
        }
        if (StringUtils.isNotEmpty(works.getLevelZk())) {
            works.setLevelZk(dictService.getLabelByValue(works.getLevelZk(), "dd_level"));
        }
        map.put("works", works);
        List<Images> worksImage = imagesService.selectList(new EntityWrapper<>(new Images(id, Const.IMAGES_WORKS)));
        //作品信息图片列表
        map.put("worksImage", worksImage);
        WorksLevel worksLevel = worksLevelService.selectOne(new EntityWrapper<>(new WorksLevel(id)));
        if (worksLevel != null) {
            if (StringUtils.isNotEmpty(worksLevel.getZhidi())) {
                worksLevel.setZhidi(dictService.getLabelByValue(worksLevel.getZhidi(), "dd_zhidi"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getZhidi2())) {
                worksLevel.setZhidi2(dictService.getLabelByValue(worksLevel.getZhidi2(), "dd_zhidi2"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getGanguan())) {
                worksLevel.setGanguan(dictService.getLabelByValue(worksLevel.getGanguan(), "dd_ganguan"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getMoshidu())) {
                worksLevel.setMoshidu(dictService.getLabelByValue(worksLevel.getMoshidu(), "dd_moshidu"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getXueliang())) {
                worksLevel.setXueliang(dictService.getLabelByValue(worksLevel.getXueliang(), "dd_xueliang"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getXuese())) {
                worksLevel.setXuese(dictService.getLabelByValue(worksLevel.getXuese(), "dd_xuese"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getXuexing())) {
                worksLevel.setXuexing(dictService.getLabelByValue(worksLevel.getXuexing(), "dd_xuexing"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getNongyandu())) {
                worksLevel.setNongyandu(dictService.getLabelByValue(worksLevel.getNongyandu(), "dd_nongyandu"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getChunjingdu())) {
                worksLevel.setChunjingdu(dictService.getLabelByValue(worksLevel.getChunjingdu(), "dd_jingdu"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getDise())) {
                worksLevel.setDise(dictService.getLabelByValue(worksLevel.getDise(), "dd_dise"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getLie())) {
                worksLevel.setLie(dictService.getLabelByValue(worksLevel.getLie(), "dd_lie"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getLiu())) {
                worksLevel.setLiu(dictService.getLabelByValue(worksLevel.getLiu(), "dd_liu"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getInithanxueliang())) {
                worksLevel.setInithanxueliang(dictService.getLabelByValue(worksLevel.getInithanxueliang(), "dd_mian"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getHanxueliang())) {
                worksLevel.setHanxueliang(dictService.getLabelByValue(worksLevel.getHanxueliang(), "dd_hanxuefangshi"));
            }
            if (StringUtils.isNotEmpty(worksLevel.getHanxuefangshi())) {
                worksLevel.setHanxuefangshi(dictService.getLabelByValue(worksLevel.getHanxuefangshi(), "dd_hanxuefangshi"));
            }
        }
        map.put("worksLevel", worksLevel);
        Consumer provider = consumerService.selectOne(new EntityWrapper<>(new Consumer(Const.CONSUMER_TYPE_PROVIDER, id)));
        map.put("provider", provider);
        Consumer collect = consumerService.selectOne(new EntityWrapper<>(new Consumer(Const.CONSUMER_TYPE_COLLECT, id)));
        map.put("collect", collect);
        Report report = reportService.selectOne(new EntityWrapper<>(new Report(id)));
        map.put("report", report);

        //评估报告图片
        List<Images> reportImage = imagesService.selectList(new EntityWrapper<>(new Images(id, Const.IMAGES_REPORT_DES)));
        if (reportImage.size() > 0) {
            map.put("reportImage", reportImage.get(0));
        }
        //评估价值认证照片
        if (report != null) {
            List<Images> certifyImage = imagesService.selectList(new EntityWrapper<>(new Images(report.getId(), Const.IMAGES_REPORT_CERTIFICATE)));
            map.put("certifyImage", certifyImage);
        }


        // 转让历史列表
        List<TransferHistory> transferHistoryList = transferHistoryService.thContainUsersInfo(id);
        map.put("transferHistoryList", transferHistoryList);

        // 诠释列表
        List<Interpretation> interpretationList = interpretationService.interpretationContainImages(id);
        map.put("interpretationList", interpretationList);

        // 收藏者列表
        List<AppUser> collecterList = appUserService.searchFollowHistoryUsers(Const.FOLLOW_HISTORY_TYPE_COLLECT, id);
        if (collecterList.size() > 9) {
            collecterList = collecterList.subList(0, 9);
        }
        map.put("collecterList", collecterList);

        // 最近浏览的人
        List<FollowHistory> browserPeopleList = followHistoryService.browserPeopleList(id);
        works.setBrowserCount(browserPeopleList.size());
        if (collecterList.size() > 9) {
            browserPeopleList = browserPeopleList.subList(0, 9);
        }
        map.put("browserPeopleList", browserPeopleList);

        AppUser appUser = appUserService.selectById(works.getCreateBy());
        map.put("appUser", appUser);

        AppUser currentUser = getCurrentUser();
        map.put("currentUser", currentUser);

        return "works/work_detail";
    }


}
