package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.DateUtil;
import com.fish.idle.weixin.interceptor.OAuthRequired;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.WxMpTemplateMsgService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by lenovo on 2017/1/13.
 */

@Controller
@RequestMapping(value = "/mobile")
public class MobileRegisterEditController extends BaseController {
    @Autowired
    private IAppUserService appUserService;

    @Autowired
    private IConsumerService consumerService;

    @Autowired
    private IWorksService worksService;

    @Autowired
    private IWorksLevelService worksLevelService;

    @Autowired
    private IImagesService imagesService;

    @Autowired
    private IReportService reportService;

    @Autowired
    private IFollowHistoryService followHistoryService;

    @Autowired
    private ITransferHistoryService transferHistoryService;

    @Autowired
    private IInterpretationService interpretationService;

    @Autowired
    private WxMpConfigStorage configStorage;

    @Autowired
    private IDictService dictService;

    @Autowired
    private WxMpService wxMpService;

    @Autowired
    private WxMpTemplateMsgService wxMpTemplateMsgService;

    @Autowired
    private IScoreHistoryService scoreHistoryService;

    @Value("#{wxProperties.bucket}")
    private String bucket;

    @Value("#{wxProperties.redirect_url}")
    private String redirectUrl;

    /**
     * 作品注册页面1
     *
     * @return
     */
    @RequestMapping(value = "worksRegister1", method = RequestMethod.GET)
    @OAuthRequired
    public String worksRegister1(HttpSession session,
                                 ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        map.put("bucket", bucket);
        map.put("redirectUrl", redirectUrl);
        return "modules/mobile/pawn2/worksRegister1";
    }

    /**
     * 作品注册页面2
     *
     * @return
     */
    @RequestMapping(value = "worksRegister2", method = RequestMethod.POST)
    @OAuthRequired
    public String worksRegister2(HttpSession session,
                                 Works works,
                                 Consumer consumer,
                                 ModelMap map,
                                 @RequestParam(required = false) String createDateString,
                                 @RequestParam(required = false) String worksName,
                                 @RequestParam(required = false) String providerName,
                                 @RequestParam(required = false) String providerNo,
                                 @RequestParam(required = false) String worksRemarks,
                                 @RequestParam(required = false) String draftYN) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setCreateBy(appUser.getId());
        if (createDateString != null && createDateString.trim().length() > 0) {
            Date createDate = DateUtil.parseDate(createDateString, "yyyy-MM-dd");
            works.setCreateDate(createDate);
        }
        works.setName(worksName);
        works.setRemarks(worksRemarks);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Long time = new Date().getTime();
        String no = sdf.format(time);
        works.setNo("JS-A" + no + "A");

        if ("yes".equals(draftYN)) {
            works.setStatus(Const.WORKS_STATUS_DRAFT);
        }
        worksService.insert(works);

        Integer worksId = works.getId();

        consumer.setType(Const.CONSUMER_TYPE_PROVIDER);
        consumer.setWorksId(worksId);
        consumer.setName(providerName);
        consumer.setNo(providerNo);
        Consumer oldConsumer = new Consumer();
        oldConsumer.setWorksId(worksId);
        oldConsumer.setType(Const.CONSUMER_TYPE_PROVIDER);
        oldConsumer = consumerService.selectOne(new EntityWrapper<>(oldConsumer));
        if (oldConsumer == null) {
            consumerService.insert(consumer);
        } else {
            consumer.setId(oldConsumer.getId());
            consumerService.updateById(consumer);
        }


        insertImage(works.getImages(), worksId, Const.IMAGES_WORKS);

        if ("yes".equals(draftYN)) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }
        session.setAttribute("registerWorksName", works.getName());
        session.setAttribute("registerWorksId", worksId);
        session.setAttribute("registerWorks", works);

        map.put("kqdy", dictService.getWorksLevelDicByType("dd_kqdy"));
        map.put("level", dictService.getWorksLevelDicByType("dd_level"));
        map.put("pinzhong", dictService.getWorksLevelDicByType("dd_pinzhong"));
        map.put("zuopinleixing", dictService.getWorksLevelDicByType("dd_zuopinleixing"));
        map.put("gyType", dictService.getWorksLevelDicByType("dd_level"));


        return "modules/mobile/pawn2/worksRegister2";
    }

    /**
     * 作品注册页面3
     *
     * @return
     */
    @RequestMapping(value = "worksRegister3", method = RequestMethod.POST)
    @OAuthRequired
    public String worksRegister3(HttpSession session,
                                 ModelMap map,
                                 @RequestParam(required = false) String breed,
                                 @RequestParam(required = false) String type,
                                 @RequestParam(required = false) BigDecimal length,
                                 @RequestParam(required = false) BigDecimal width,
                                 @RequestParam(required = false) BigDecimal height,
                                 @RequestParam(required = false) BigDecimal weight,
                                 @RequestParam(required = false) String gyType,
                                 @RequestParam(required = false) String levelZk,
                                 @RequestParam(required = false) String kqdy,
                                 @RequestParam(required = false) String maker,
                                 @RequestParam(required = false) String makeTimeString,
                                 @RequestParam(required = false) String worksMeanning,
                                 @RequestParam(required = false) String draftYN) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        Works works = (Works) session.getAttribute("registerWorks");
        works.setBreed(breed);
        works.setType(type);
        works.setLength(length);
        works.setWidth(width);
        works.setHeight(height);
        works.setWeight(weight);
        works.setGyType(gyType);
        works.setLevelZk(levelZk);
        works.setKqdy(kqdy);
        works.setMaker(maker);
        if (makeTimeString != null && makeTimeString.trim().length() > 0) {
            Date makeTime = DateUtil.parseDate(makeTimeString, "yyyy-MM-dd");
            works.setMakeTime(makeTime);
        }
        works.setWorksMeaning(worksMeanning);
        if ("yes".equals(draftYN)) {
            works.setStatus(Const.WORKS_STATUS_DRAFT);
        }
        worksService.updateById(works);
        if ("yes".equals(draftYN)) {
            session.removeAttribute("registerWorksId");
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }
        session.setAttribute("registerWorks", works);

        if (type != null && (type == "5" || type == "6")) {
            return "modules/mobile/pawn2/worksRegister4";
        }
        map.put("zhidi1", dictService.getWorksLevelDicByType("dd_zhidi"));
        map.put("zhidi2", dictService.getWorksLevelDicByType("dd_zhidi2"));
        map.put("ganguan", dictService.getWorksLevelDicByType("dd_ganguan"));
        map.put("moshidu", dictService.getWorksLevelDicByType("dd_moshidu"));
        map.put("xueliang", dictService.getWorksLevelDicByType("dd_xueliang"));
        map.put("xuese", dictService.getWorksLevelDicByType("dd_xuese"));
        map.put("xuexing", dictService.getWorksLevelDicByType("dd_xuexing"));
        map.put("nongyandu", dictService.getWorksLevelDicByType("dd_nongyandu"));
        map.put("chunjingdu", dictService.getWorksLevelDicByType("dd_jingdu"));
        map.put("dise", dictService.getWorksLevelDicByType("dd_dise"));
        map.put("liu", dictService.getWorksLevelDicByType("dd_liu"));
        map.put("lie", dictService.getWorksLevelDicByType("dd_lie"));
        map.put("mian", dictService.getWorksLevelDicByType("dd_mian"));
        map.put("hanxuefangshi", dictService.getWorksLevelDicByType("dd_hanxuefangshi"));
        return "modules/mobile/pawn2/worksRegister3";
    }

    /**
     * 作品注册页面4
     *
     * @return
     */
    @RequestMapping(value = "worksRegister4", method = RequestMethod.POST)
    @OAuthRequired
    public String worksRegister4(HttpSession session,
                                 WorksLevel worksLevel,
                                 @RequestParam(required = false) String draftYN) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        int worksId = (int) session.getAttribute("registerWorksId");
        worksLevel.setWorksId(worksId);
        WorksLevel oldWorksLevel = new WorksLevel();
        oldWorksLevel.setWorksId(worksId);
        oldWorksLevel = worksLevelService.selectOne(new EntityWrapper<>(oldWorksLevel));
        if (oldWorksLevel == null) {
            worksLevelService.insert(worksLevel);
        } else {
            worksLevel.setId(oldWorksLevel.getId());
            worksLevelService.updateById(oldWorksLevel);
        }


        if ("yes".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setStatus(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
            session.removeAttribute("registerWorksId");
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }

        return "modules/mobile/pawn2/worksRegister4";
    }

    /**
     * 作品注册页面5
     *
     * @return
     */
    @RequestMapping(value = "worksRegister5", method = RequestMethod.POST)
    @OAuthRequired
    public String worksRegister5(HttpSession session,
                                 Report report,
                                 @RequestParam(required = false) String draftYN,
                                 @RequestParam(required = false) String certImage,
                                 @RequestParam(required = false) String valueImages,
                                 @RequestParam(required = false) String valueTimeString) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        Integer worksId = (Integer) session.getAttribute("registerWorksId");
        report.setWorksId(worksId);
        if (valueTimeString != null && valueTimeString.trim().length() > 0) {
            Date valueTime = DateUtil.parseDate(valueTimeString, "yyyy-MM-dd");
            report.setValidTime(valueTime);
        }
        reportService.insert(report);

        insertImage(certImage, report.getId(), Const.IMAGES_REPORT_CERTIFICATE);
        insertImage(valueImages, report.getId(), Const.IMAGES_REPORT_DES);


        if ("yes".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setStatus(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
            session.removeAttribute("registerWorksId");
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        } else if ("confirm".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setStatus(Const.WORKS_STATUS_COMMIT);
            worksService.updateById(works);
            session.removeAttribute("registerWorksId");
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=now";
        }

        return "modules/mobile/pawn2/worksRegister5";
    }

    /**
     * 作品完成
     *
     * @return
     */
    @RequestMapping(value = "worksRegisterComplete", method = RequestMethod.POST)
    @OAuthRequired
    public String worksRegisterComplete(HttpSession session,
                                        @RequestParam(required = false) String draftYN,
                                        Consumer consumer,
                                        @RequestParam(required = false) String collecterDatetimeString,
                                        @RequestParam(required = false) String collecterPub) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Integer worksId = (Integer) session.getAttribute("registerWorksId");
        consumer.setWorksId(worksId);
        consumer.setType(Const.CONSUMER_TYPE_COLLECT);
        if (collecterDatetimeString != null && collecterDatetimeString.trim().length() > 0) {
            Date datetime = DateUtil.parseDate(collecterDatetimeString, "yyyy-MM-dd");
            consumer.setDatetime(datetime);
        }
        if (collecterPub != null) {
            consumer.setPub(Const.CONSUMER_PUB_YES);
        } else {
            consumer.setPub(Const.CONSUMER_PUB_NO);
        }
        consumerService.insert(consumer);
        Works works = (Works) session.getAttribute("registerWorks");
        if ("yes".equals(draftYN)) {
            works.setStatus(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }
        works.setStatus(Const.WORKS_STATUS_COMMIT);
        worksService.updateById(works);
        session.removeAttribute("registerWorksId");
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=now";
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


    /**
     * 作品编辑页面
     *
     * @return
     */
    @RequestMapping(value = "worksEdit", method = RequestMethod.GET)
    @OAuthRequired
    public String worksEdit(HttpSession session,
                            ModelMap map,
                            @RequestParam int worksId) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        //作品
        Works works = worksService.selectById(worksId);

        //作品等级
        WorksLevel worksLevel = new WorksLevel(worksId);
        worksLevel = worksLevelService.selectOne(new EntityWrapper<>(worksLevel));

        //提供者
        Consumer provider = new Consumer(Const.CONSUMER_TYPE_PROVIDER, worksId);
        provider = consumerService.selectOne(new EntityWrapper<>(provider));

        //收藏者
        Consumer collecter = new Consumer();
        collecter.setWorksId(worksId);
        collecter.setType(Const.CONSUMER_TYPE_COLLECT);
        collecter = consumerService.selectOne(new EntityWrapper<>(collecter));

        Images images = new Images();
        images.setTargetId(worksId);
        images.setType(Const.IMAGES_WORKS);
        //作品图片
        List<Images> worksImagesList = imagesService.selectList(new EntityWrapper<>(images));

        //价值报告
        Report report = new Report(worksId);
        report = reportService.selectOne(new EntityWrapper<>(report));
        if (report != null) {
            Images certImage = new Images();
            certImage.setTargetId(report.getId());
            certImage.setType(Const.IMAGES_REPORT_CERTIFICATE);
            //认证图片
            certImage = imagesService.selectOne(new EntityWrapper<>(certImage));
            //评估图片
            Images valueImage = new Images(report.getId(), Const.IMAGES_REPORT_DES);
            List<Images> valueImages = imagesService.selectList(new EntityWrapper<>(valueImage));
            map.put("certImage", certImage);
            map.put("valueImages", valueImages);
        }


        map.put("works", works);
        map.put("provider", provider);
        map.put("worksLevel", worksLevel);
        map.put("worksImagesList", worksImagesList);
        map.put("collecter", collecter);
        map.put("report", report);


        session.setAttribute("worksIdInSession", worksId);

        map.put("kqdy", dictService.getWorksLevelDicByType("dd_kqdy"));
        map.put("level", dictService.getWorksLevelDicByType("dd_level"));
        map.put("pinzhong", dictService.getWorksLevelDicByType("dd_pinzhong"));
        map.put("zuopinleixing", dictService.getWorksLevelDicByType("dd_zuopinleixing"));
        map.put("gyType", dictService.getWorksLevelDicByType("dd_level"));

        map.put("zhidi1", dictService.getWorksLevelDicByType("dd_zhidi"));
        map.put("zhidi2", dictService.getWorksLevelDicByType("dd_zhidi2"));
        map.put("ganguan", dictService.getWorksLevelDicByType("dd_ganguan"));
        map.put("moshidu", dictService.getWorksLevelDicByType("dd_moshidu"));
        map.put("xueliang", dictService.getWorksLevelDicByType("dd_xueliang"));
        map.put("xuese", dictService.getWorksLevelDicByType("dd_xuese"));
        map.put("xuexing", dictService.getWorksLevelDicByType("dd_xuexing"));
        map.put("nongyandu", dictService.getWorksLevelDicByType("dd_nongyandu"));
        map.put("chunjingdu", dictService.getWorksLevelDicByType("dd_jingdu"));
        map.put("dise", dictService.getWorksLevelDicByType("dd_dise"));
        map.put("liu", dictService.getWorksLevelDicByType("dd_liu"));
        map.put("lie", dictService.getWorksLevelDicByType("dd_lie"));
        map.put("mian", dictService.getWorksLevelDicByType("dd_mian"));
        map.put("hanxuefangshi", dictService.getWorksLevelDicByType("dd_hanxuefangshi"));

        return "modules/mobile/pawn2/worksEdit";
    }

    /**
     * 作品编辑完成
     *
     * @return
     */
    @RequestMapping(value = "worksEditComplete", method = RequestMethod.POST)
    @OAuthRequired
    public String worksEditComplete(HttpSession session,
                                    Works works,
                                    WorksLevel worksLevel,
                                    Consumer consumer,
                                    Report report,
                                    @RequestParam(required = false) String worksName,
                                    @RequestParam(required = false) String worksRemarks,
                                    @RequestParam(required = false) String worksType,
                                    @RequestParam(required = false) String worksImages,
                                    @RequestParam(required = false) String makeTimeString,
                                    @RequestParam(required = false) String createDateString,
                                    @RequestParam(required = false) String providerNo,
                                    @RequestParam(required = false) String providerName,
                                    @RequestParam(required = false) String collecterName,
                                    @RequestParam(required = false) String collecterNo,
                                    @RequestParam(required = false) String collecterAddress,
                                    @RequestParam(required = false) String collecterPhone,
                                    @RequestParam(required = false) String collecterDateTimeString,
                                    @RequestParam(required = false) String collecterPub,
                                    @RequestParam(required = false) String certImage,
                                    @RequestParam(required = false) String valueImages,
                                    @RequestParam(required = false) String valueTimeString) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Integer worksId = (Integer) session.getAttribute("worksIdInSession");

        Works oldWorks = worksService.selectById(worksId);

        works.setCreateBy(oldWorks.getCreateBy());
        works.setCreateDate(oldWorks.getCreateDate());
        works.setNo(oldWorks.getNo());
        works.setUpdateBy(appUser.getId());
        works.setUpdateDate(new Date());
        works.setId(worksId);
        works.setType(worksType);
        works.setName(worksName);
        works.setRemarks(worksRemarks);
        works.setStatus(Const.WORKS_STATUS_COMMIT);
        if (createDateString != null && createDateString.trim().length() > 0) {
            Date createDate = DateUtil.parseDate(createDateString, "yyyy-MM-dd");
            works.setCreateDate(createDate);
        }
        if (makeTimeString != null && makeTimeString.trim().length() > 0) {
            Date makeTime = DateUtil.parseDate(makeTimeString, "yyyy-MM-dd");
            works.setMakeTime(makeTime);
        }
        worksService.updateById(works);


        worksLevel.setWorksId(worksId);
        WorksLevel wl = new WorksLevel();
        wl.setWorksId(worksId);
        wl = worksLevelService.selectOne(new EntityWrapper<>(wl));
        if (wl == null) {
            worksLevelService.insert(worksLevel);
        } else {
            worksLevel.setId(wl.getId());
            worksLevelService.updateById(worksLevel);
        }


        consumer.setNo(providerNo);
        consumer.setName(providerName);
        consumer.setType(Const.CONSUMER_TYPE_PROVIDER);
        consumer.setWorksId(worksId);
        Consumer cs = new Consumer();
        cs.setWorksId(worksId);
        cs.setType(Const.CONSUMER_TYPE_PROVIDER);
        cs = consumerService.selectOne(new EntityWrapper<>(cs));
        if (cs == null) {
            consumerService.insert(consumer);
        } else {
            consumer.setId(cs.getId());
            consumerService.updateById(consumer);
        }


        Consumer collecter = new Consumer(Const.CONSUMER_TYPE_COLLECT, worksId);
        collecter.setName(collecterName);
        collecter.setNo(collecterNo);
        collecter.setAddress(collecterAddress);
        collecter.setNo(collecterNo);
        collecter.setPhone(collecterPhone);
        if (collecterPub != null) {
            collecter.setPub(Const.CONSUMER_PUB_YES);
        } else {
            collecter.setPub(Const.CONSUMER_PUB_NO);
        }
        if (collecterDateTimeString != null && collecterDateTimeString.trim().length() > 0) {
            Date collectDate = DateUtil.parseDate(collecterDateTimeString);
            collecter.setDatetime(collectDate);
        }
        Consumer oldConsumer = new Consumer(Const.CONSUMER_TYPE_COLLECT, worksId);
        oldConsumer = consumerService.selectOne(oldConsumer);
        if (oldConsumer == null) {
            consumerService.insert(collecter);
        } else {
            collecter.setId(oldConsumer.getId());
            consumerService.updateById(collecter);
        }

        if (valueTimeString != null && valueTimeString.trim().length() > 0) {
            Date valueTime = DateUtil.parseDate(valueTimeString, "yyyy-MM-dd");
            report.setValidTime(valueTime);
        }

        Report oldReport = new Report(worksId);
        oldReport = reportService.selectOne(oldReport);
        if (oldReport == null) {
            reportService.insert(report);
        } else {
            report.setId(oldReport.getId());
            reportService.updateById(report);
        }

        Images oldImg = new Images(worksId, Const.IMAGES_WORKS);
        List<Images> oldImgs = imagesService.selectList(new EntityWrapper<>(oldImg));
        oldImg.setTargetId(report.getId());
        oldImg.setType(Const.IMAGES_REPORT_CERTIFICATE);
        oldImgs.addAll(imagesService.selectList(new EntityWrapper<>(oldImg)));
        oldImg.setType(Const.IMAGES_REPORT_DES);
        oldImgs.addAll(imagesService.selectList(new EntityWrapper<>(oldImg)));
        if (oldImgs != null && oldImgs.size() > 0) {
            List<Integer> ids = new ArrayList<>();
            for (Images img : oldImgs) {
                ids.add(img.getId());
            }
            imagesService.deleteBatchIds(ids);
        }

        insertImage(worksImages, worksId, Const.IMAGES_WORKS);
        insertImage(certImage, report.getId(), Const.IMAGES_REPORT_CERTIFICATE);
        insertImage(valueImages, report.getId(), Const.IMAGES_REPORT_DES);

        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my";

    }

}
