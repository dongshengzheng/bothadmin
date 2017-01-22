package com.fish.idle.weixin.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.BaseEntity;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.DateUtil;
import com.fish.idle.weixin.entity.WorksBo;
import com.fish.idle.weixin.interceptor.OAuthRequired;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.WxMpTemplateMsgService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
        AppUser appUser = getCurrentUser();
        map.put("appUser",appUser);
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
        AppUser currentUser = getCurrentUser();
        works.setCreateBy(currentUser.getId());
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
        consumer.setType(Const.CONSUMER_TYPE_PROVIDER);
        consumer.setName(providerName);
        consumer.setNo(providerNo);

        session.setAttribute("registerWorks", works);
        session.setAttribute("registerProvider", consumer);

        if ("yes".equals(draftYN)) {
            insertAll(session, Const.WORKS_STATUS_DRAFT);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }

        session.setAttribute("registerWorksName", works.getName());

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

        session.setAttribute("registerWorks", works);

        if ("yes".equals(draftYN)) {
            insertAll(session, Const.WORKS_STATUS_DRAFT);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }

        if (type != null && ("5".equals(type) || "6".equals(type))) {
            return "modules/mobile/pawn2/worksRegister4";
        }

        map.put("breed", breed);

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
                                 ModelMap map,
                                 @RequestParam(required = false) String draftYN) {

        session.setAttribute("registerWorksLevel", worksLevel);
        if ("yes".equals(draftYN)) {
            insertAll(session, Const.WORKS_STATUS_DRAFT);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }
        map.put("bucket", bucket);
        map.put("redirectUrl", redirectUrl);
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
        if (valueTimeString != null && valueTimeString.trim().length() > 0) {
            Date valueTime = DateUtil.parseDate(valueTimeString, "yyyy-MM-dd");
            report.setValidTime(valueTime);
        }


        session.setAttribute("registerReport", report);
        session.setAttribute("registerCertImage", certImage);
        session.setAttribute("registerValueImages", valueImages);

        if ("yes".equals(draftYN)) {
            insertAll(session, Const.WORKS_STATUS_DRAFT);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        } else if ("confirm".equals(draftYN)) {
            insertAll(session, Const.WORKS_STATUS_COMMIT);
            /*AppUser currentUser =getCurrentUser();
            List<AppUser> adminUsers = getAdminAppUsers();//管理员列表
            if(adminUsers != null){
                for (AppUser appUser:adminUsers){
                    int targetId = appUser.getId();
                    sendTemplateMsg(targetId,
                            "Jf8lvKgPo0WhdVf61Ny0JW3xybH8Y0BU4_fbfO3eHF4",
                            configStorage.getOauth2redirectUri() + "/mobile/appUserInfo?appUserId=" + currentUser.getId(),
                            "测试消息",
                            "申请人：小王\r\n用户名称 : " + currentUser.getLoginName(),
                            DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"),
                            "申请信息：登记作品「精心打造的鸡血石印章」\r\n请尽快审核！");
                }
            }*/
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=now";
        }

        return "modules/mobile/pawn2/worksRegister5";
    }

    /**
     * 获取管理员列表
     * @return
     */
    private List<AppUser> getAdminAppUsers() {
        EntityWrapper<AppUser> appUser = new EntityWrapper<>();
        AppUser user = new AppUser();
        user.setType(Const.APPUSER_TYPE_ADMIN);
        appUser.setEntity(user);
        List<AppUser> list = appUserService.selectList(appUser);
        return list;
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
        session.setAttribute("registerCollecter", consumer);

        if ("yes".equals(draftYN)) {
            insertAll(session, Const.WORKS_STATUS_DRAFT);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }
        insertAll(session, Const.WORKS_STATUS_COMMIT);
        /*AppUser currentUser =getCurrentUser();
        List<AppUser> adminUsers = getAdminAppUsers();//管理员列表
        if(adminUsers != null){
            for (AppUser appUser:adminUsers){
                int targetId = appUser.getId();
                sendTemplateMsg(targetId,
                        "Jf8lvKgPo0WhdVf61Ny0JW3xybH8Y0BU4_fbfO3eHF4",
                        configStorage.getOauth2redirectUri() + "/mobile/appUserInfo?appUserId=" + currentUser.getId(),
                        "测试消息",
                        "申请人：小王\r\n用户名称 : " + currentUser.getLoginName(),
                        DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"),
                        "申请信息：登记作品「精心打造的鸡血石印章」\r\n请尽快审核！");
            }
        }*/
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=now";
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
        //作品图片
        Images images = new Images();
        images.setTargetId(worksId);
        images.setType(Const.IMAGES_WORKS);
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

        map.put("kqdy", dictService.getWorksLevelDicByType("dd_kqdy"));
        map.put("level", dictService.getWorksLevelDicByType("dd_level"));
        map.put("pinzhong", dictService.getWorksLevelDicByType("dd_pinzhong"));
        map.put("zuopinleixing", dictService.getWorksLevelDicByType("dd_zuopinleixing"));
        map.put("gyType", dictService.getWorksLevelDicByType("dd_level"));


        String breed = works.getBreed();
        map.put("zhidi1", dictService.getWorksLevelDicByType("dd_zhidi", breed));
        map.put("zhidi2", dictService.getWorksLevelDicByType("dd_zhidi2", breed));
        map.put("ganguan", dictService.getWorksLevelDicByType("dd_ganguan", breed));
        map.put("moshidu", dictService.getWorksLevelDicByType("dd_moshidu", breed));
        map.put("xueliang", dictService.getWorksLevelDicByType("dd_xueliang", breed));
        map.put("xuese", dictService.getWorksLevelDicByType("dd_xuese", breed));
        map.put("xuexing", dictService.getWorksLevelDicByType("dd_xuexing", breed));
        map.put("nongyandu", dictService.getWorksLevelDicByType("dd_nongyandu", breed));
        map.put("jingdu", dictService.getWorksLevelDicByType("dd_jingdu", breed));
        map.put("dise", dictService.getWorksLevelDicByType("dd_dise", breed));
        map.put("liu", dictService.getWorksLevelDicByType("dd_liu", breed));
        map.put("lie", dictService.getWorksLevelDicByType("dd_lie", breed));
        map.put("mian", dictService.getWorksLevelDicByType("dd_mian", breed));
        map.put("hanxuefangshi", dictService.getWorksLevelDicByType("dd_hanxuefangshi", breed));
        map.put("ziranshipi", dictService.getWorksLevelDicByType("dd_ziranshipi", breed));

        map.put("bucket", bucket);
        map.put("redirectUrl", redirectUrl);

        session.setAttribute("oldWorks", works);
        session.setAttribute("oldWorksLevel", worksLevel);
        session.setAttribute("oldProvider", provider);
        session.setAttribute("oldCollecter", collecter);
        session.setAttribute("oldReport", report);


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
                                    WorksBo worksBo,
                                    WorksLevel worksLevel,
                                    @RequestParam(required = false) String worksLevelId,
                                    @RequestParam(required = false) String worksImages,
                                    @RequestParam(required = false) String makeTimeString,
                                    @RequestParam(required = false) String createDateString,
                                    @RequestParam(required = false) String collecterDateTimeString,
                                    @RequestParam(required = false) String collecterPub,
                                    @RequestParam(required = false) String certImage,
                                    @RequestParam(required = false) String valueImages,
                                    @RequestParam(required = false) String valueTimeString) {
        Works oldWorks = (Works) session.getAttribute("oldWorks");
        WorksLevel oldWorksLevel = (WorksLevel) session.getAttribute("oldWorksLevel");
        Consumer oldProvider = (Consumer) session.getAttribute("oldProvider");
        Consumer oldCollecter = (Consumer) session.getAttribute("oldCollecter");
        Report oldReport = (Report) session.getAttribute("oldReport");


        Works works = worksBo.getWorks();
        Integer worksId = works.getId();

        works.setStatus(Const.WORKS_STATUS_COMMIT);
        if (createDateString != null && createDateString.trim().length() > 0) {
            Date createDate = DateUtil.parseDate(createDateString, "yyyy-MM-dd");
            works.setCreateDate(createDate);
        }
        if (makeTimeString != null && makeTimeString.trim().length() > 0) {
            Date makeTime = DateUtil.parseDate(makeTimeString, "yyyy-MM-dd");
            works.setMakeTime(makeTime);
        }
        works.setCreateBy(oldWorks.getCreateBy());
        works.setNo(oldWorks.getNo());
        wrapUpdateEntity(works);
        worksService.updateById(works);

        worksLevel.setWorksId(worksId);
        if (worksLevelId != null && worksLevelId.trim().length() > 0) {
            worksLevel.setId(Integer.parseInt(worksLevelId));
            worksLevel.setCreateBy(oldWorksLevel.getCreateBy());
            worksLevel.setCreateDate(oldWorksLevel.getCreateDate());
            wrapUpdateEntity(worksLevel);
        } else {
            wrapInsertEntity(worksLevel);
        }
        worksLevelService.insertOrUpdate(worksLevel);


        Consumer provider = worksBo.getProvider();
        provider.setType(Const.CONSUMER_TYPE_PROVIDER);
        if (oldProvider != null) {
            provider.setCreateBy(oldProvider.getCreateBy());
            provider.setCreateDate(oldProvider.getCreateDate());
            wrapUpdateEntity(provider);
        } else {
            wrapInsertEntity(provider);
        }
        consumerService.insertOrUpdate(provider);


        Consumer collecter = worksBo.getCollecter();
        collecter.setType(Const.CONSUMER_TYPE_COLLECT);
        if (oldCollecter != null) {
            collecter.setCreateBy(oldCollecter.getCreateBy());
            collecter.setCreateDate(oldCollecter.getCreateDate());
            wrapUpdateEntity(collecter);
        } else {
            wrapInsertEntity(collecter);
        }
        if (collecterPub != null) {
            collecter.setPub(Const.CONSUMER_PUB_YES);
        } else {
            collecter.setPub(Const.CONSUMER_PUB_NO);
        }
        if (collecterDateTimeString != null && collecterDateTimeString.trim().length() > 0) {
            Date collectDate = DateUtil.parseDate(collecterDateTimeString);
            collecter.setDatetime(collectDate);
        }
        consumerService.insertOrUpdate(collecter);


        Report report = worksBo.getReport();
        if (oldReport != null) {
            report.setCreateBy(oldReport.getCreateBy());
            report.setCreateDate(oldReport.getCreateDate());
            wrapUpdateEntity(report);
        } else {
            wrapInsertEntity(report);
        }
        if (valueTimeString != null && valueTimeString.trim().length() > 0) {
            Date valueTime = DateUtil.parseDate(valueTimeString, "yyyy-MM-dd");
            report.setValidTime(valueTime);
        }
        reportService.insertOrUpdate(report);

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

        session.removeAttribute("oldWorks");
        session.removeAttribute("oldWorksLevel");
        session.removeAttribute("oldProvider");
        session.removeAttribute("oldCollecter");
        session.removeAttribute("oldReport");

        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=now";

    }


    //登记作品保存作品所有信息
    public void insertAll(HttpSession session, String worksStatus) {
        Works works = (Works) session.getAttribute("registerWorks");
        if (works != null) {
            works.setStatus(worksStatus);
            wrapUpdateEntity(works);
            worksService.insert(works);
            int worksId = works.getId();
            insertImage(works.getImages(), worksId, Const.IMAGES_WORKS);

            session.removeAttribute("registerWorks");
            session.removeAttribute("registerWorksName");

            Consumer provider = (Consumer) session.getAttribute("registerProvider");
            if (provider != null) {
                provider.setWorksId(worksId);
                wrapInsertEntity(provider);
                consumerService.insert(provider);
                session.removeAttribute("registerProvider");
            }
            WorksLevel worksLevel = (WorksLevel) session.getAttribute("registerWorksLevel");
            if (worksLevel != null) {
                worksLevel.setWorksId(worksId);
                wrapInsertEntity(worksLevel);
                worksLevelService.insert(worksLevel);
                session.removeAttribute("registerWorksLevel");
            }

            Report report = (Report) session.getAttribute("registerReport");
            if (report != null) {
                report.setWorksId(worksId);
                wrapInsertEntity(report);
                reportService.insert(report);
                String certImage = (String) session.getAttribute("registerCertImage");
                String valueImages = (String) session.getAttribute("registerValueImages");
                insertImage(certImage, report.getId(), Const.IMAGES_REPORT_CERTIFICATE);
                insertImage(valueImages, report.getId(), Const.IMAGES_REPORT_DES);
                session.removeAttribute("registerReport");
                session.removeAttribute("registerCertImage");
                session.removeAttribute("registerValueImages");
            }

            Consumer collecter = (Consumer) session.getAttribute("registerCollecter");
            if (collecter != null) {
                wrapInsertEntity(collecter);
                collecter.setWorksId(worksId);
                consumerService.insert(collecter);
                session.removeAttribute("registerCollecter");
            }
        }
    }


    //获取作品等级
    @RequestMapping(value = "getWorksLevel", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject getWorksLevel(@RequestParam(required = false) String breed) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("zhidi1", dictService.getWorksLevelDicByType("dd_zhidi", breed));
        jsonObject.put("zhidi2", dictService.getWorksLevelDicByType("dd_zhidi2", breed));
        jsonObject.put("ganguan", dictService.getWorksLevelDicByType("dd_ganguan", breed));
        jsonObject.put("moshidu", dictService.getWorksLevelDicByType("dd_moshidu", breed));
        jsonObject.put("xueliang", dictService.getWorksLevelDicByType("dd_xueliang", breed));
        jsonObject.put("xuese", dictService.getWorksLevelDicByType("dd_xuese", breed));
        jsonObject.put("xuexing", dictService.getWorksLevelDicByType("dd_xuexing", breed));
        jsonObject.put("nongyandu", dictService.getWorksLevelDicByType("dd_nongyandu", breed));
        jsonObject.put("jingdu", dictService.getWorksLevelDicByType("dd_jingdu", breed));
        jsonObject.put("dise", dictService.getWorksLevelDicByType("dd_dise", breed));
        jsonObject.put("liu", dictService.getWorksLevelDicByType("dd_liu", breed));
        jsonObject.put("lie", dictService.getWorksLevelDicByType("dd_lie", breed));
        jsonObject.put("mian", dictService.getWorksLevelDicByType("dd_mian", breed));
        jsonObject.put("hanxuefangshi", dictService.getWorksLevelDicByType("dd_hanxuefangshi", breed));
        jsonObject.put("ziranshipi", dictService.getWorksLevelDicByType("dd_ziranshipi", breed));
        return jsonObject;
    }


}
