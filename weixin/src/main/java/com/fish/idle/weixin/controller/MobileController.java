package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.DateUtil;
import com.fish.idle.weixin.interceptor.OAuthRequired;

import me.chanjar.weixin.common.exception.WxErrorException;
import me.chanjar.weixin.mp.api.WxMpTemplateMsgService;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Sun.Han
 * @version 1.0
 * @Description:
 * @Date 2016年11月12日
 */
@Controller
@RequestMapping(value = "/mobile")
public class MobileController extends BaseController {
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


    @RequestMapping(method = RequestMethod.GET)
    @OAuthRequired
    public String toLogin(HttpSession session) {
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/works";
    }


    /**
     * 作品列表
     *
     * @return
     */
    @RequestMapping(value = "works", method = RequestMethod.GET)
    @OAuthRequired
    public String works(HttpSession session,
                        ModelMap map) {
        Works works = new Works();
        works.setStatus(Const.WORKS_STATUS_PASS);
        EntityWrapper<Works> ew = new EntityWrapper(works);
        Page<Works> page = new Page<>(1, 4);
        page = worksService.selectPage(page, ew);

        for (int i = 0; i < page.getRecords().size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(page.getRecords().get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                page.getRecords().get(i).setImages(images.get(0).getUrl());
            }

            if (!StringUtils.isEmpty(page.getRecords().get(i).getBreed())) {
                page.getRecords().get(i).setBreed(dictService.getLabelByValue(page.getRecords().get(i).getBreed(), "dd_pinzhong"));
            }

        }

        works.setSlide(1);
        List<Works> slideList = worksService.selectList(new EntityWrapper<>(works));
        if (slideList.size() > 3) {
            slideList = slideList.subList(0, 3);
        }

        for (int i = 0; i < slideList.size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(slideList.get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                slideList.get(i).setImages(images.get(0).getUrl());
            }
            if (!StringUtils.isEmpty(slideList.get(i).getBreed())) {
                slideList.get(i).setBreed(dictService.getLabelByValue(slideList.get(i).getBreed(), "dd_pinzhong"));
            }
        }

        map.put("page", page);
        map.put("slideList", slideList);
        return "modules/mobile/pawn2/works";
    }

    /**
     * 作品列表滚动加载
     *
     * @return
     */
    @RequestMapping(value = "worksPage", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public Page<Works> worksPage(HttpSession session,
                                 int pageNo) {
        Works works = new Works();
        works.setStatus(Const.WORKS_STATUS_PASS);
        Page<Works> page = new Page<>(pageNo, 4);
        page = worksService.selectPage(page, new EntityWrapper<>(works));

        for (int i = 0; i < page.getRecords().size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(page.getRecords().get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                page.getRecords().get(i).setImages(images.get(0).getUrl());
            }
            if (!StringUtils.isEmpty(page.getRecords().get(i).getBreed())) {
                page.getRecords().get(i).setBreed(dictService.getLabelByValue(page.getRecords().get(i).getBreed(), "dd_pinzhong"));
            }
        }

        return page;
    }

    /**
     * 点击收藏按钮,收藏作品
     *
     * @return
     */
    @RequestMapping(value = "collectWorks", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String collectWorks(HttpSession session,
                               int worksId) {
        AppUser currentUser = getCurrentUser();
        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(currentUser.getId());
        followHistory.setTargetId(worksId);
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_COLLECT);
        followHistory.setDelFlag(null);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        if (fh == null) {
            followHistory.setDelFlag(Const.DEL_FLAG_NORMAL);
            followHistoryService.insert(followHistory);
            return "收藏成功!!!";
        } else {
            if (fh.getDelFlag() == Const.DEL_FLAG_NORMAL) {
                return "已在收藏中!";
            } else {
                fh.setDelFlag(Const.DEL_FLAG_NORMAL);
                followHistoryService.updateById(fh);
                return "收藏成功!!!";
            }
        }
    }

    /**
     * 取消收藏
     *
     * @return
     */
    @RequestMapping(value = "cancelCollect", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String cancelCollect(HttpSession session,
                                int targetId) {
        AppUser currentUser = getCurrentUser();
        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(currentUser.getId());
        followHistory.setTargetId(targetId);
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_COLLECT);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        Boolean result;
        if (fh == null) {
            followHistory.setDelFlag(Const.DEL_FLAG_DELETE);
            result = followHistoryService.insert(followHistory);
        } else {
            fh.setDelFlag(Const.DEL_FLAG_DELETE);
            result = followHistoryService.updateById(fh);
        }
        if (result) {
            return "取消收藏成功!";
        }
        return "取消收藏失败!请稍后再试";
    }


    /**
     * 跳往搜寻页面
     *
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.GET)
    @OAuthRequired
    public String search(HttpSession session,
                         ModelMap map) {
        List<String> searchPerson = (List<String>) session.getAttribute("searchPerson");
        List<String> searchWorks = (List<String>) session.getAttribute("searchWorks");
        map.put("searchPerson", searchPerson);
        map.put("searchWorks", searchWorks);
        return "modules/mobile/pawn2/search";
    }

    /**
     * 删除历史搜寻记录
     *
     * @return
     */
    @RequestMapping(value = "delSearch", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String delSearch(HttpSession session) {
        session.removeAttribute("searchPerson");
        session.removeAttribute("searchWorks");

        return "成功删除";
    }


    /**
     * 跳往搜寻用户页面
     *
     * @return
     */
    @RequestMapping(value = "searchPerson", method = RequestMethod.GET)
    @OAuthRequired
    public String searchPerson(HttpSession session,
                               ModelMap map,
                               @RequestParam(required = false) String name) {
        AppUser currentUser = getCurrentUser();
        List<String> searchPerson = (List<String>) session.getAttribute("searchPerson");
        if (searchPerson == null) {
            searchPerson = new ArrayList<>();
        }
        if (!searchPerson.contains(name)) {
            searchPerson.add(name);
        }
        session.setAttribute("searchPerson", searchPerson);

        List<AppUser> appUserList = appUserService.searchUsersByName(name, currentUser.getId());

        Map<Integer, AppUser> appUserMap = new HashMap<>();
        for (AppUser uu : appUserList) {
            appUserMap.put(uu.getId(), uu);
        }

        List<AppUser> haveFocusList = new ArrayList<>();

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(currentUser.getId());
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_FOCUS);
        followHistory.setDelFlag(Const.DEL_FLAG_NORMAL);
        List<FollowHistory> followHistoryList = followHistoryService.selectList(new EntityWrapper<>(followHistory));
        for (FollowHistory fw : followHistoryList) {
            Integer id = fw.getTargetId();
            if (appUserMap.containsKey(id)) {
                haveFocusList.add(appUserMap.get(id));
            }
        }

        appUserList.removeAll(haveFocusList);

        map.put("haveFocusList", haveFocusList);
        map.put("notFocusList", appUserList);


        return "modules/mobile/pawn2/searchPerson";
    }


    /**
     * 未关注--关注
     *
     * @return
     */
    @RequestMapping(value = "notToHave", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String notToHave(HttpSession session,
                            int targetId) {
        AppUser currentUser = getCurrentUser();
        if (targetId == currentUser.getId()) {
            return "自己不要关注自己哟";
        }

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(currentUser.getId());
        followHistory.setTargetId(targetId);
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_FOCUS);
        followHistory.setDelFlag(null);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        Boolean result;
        if (fh == null) {
            followHistory.setDelFlag(Const.DEL_FLAG_NORMAL);
            result = followHistoryService.insert(followHistory);
        } else {
            fh.setDelFlag(Const.DEL_FLAG_NORMAL);
            result = followHistoryService.updateById(fh);
        }
        if (result) {
            sendTemplateMsg(targetId,
                    "PxVoRl3uWH5ph927H_Qg9DM0B3HKNMYF_IBo48WrJ9c",
                    configStorage.getOauth2redirectUri() + "/mobile/appUserInfo?appUserId=" + currentUser.getId(),
                    "测试消息",
                    "您被其他用户关注了\r\n用户名称 : " + currentUser.getLoginName(),
                    DateUtil.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"),
                    "点击查看用户详情");
            return "关注成功!";
        }
        return "关注失败!请稍后再试";
    }

    /**
     * 关注--取关
     *
     * @return
     */
    @RequestMapping(value = "haveToNot", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String haveToNot(HttpSession session,
                            int targetId) {
        AppUser currentUser = getCurrentUser();
        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(currentUser.getId());
        followHistory.setTargetId(targetId);
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_FOCUS);
        followHistory.setDelFlag(null);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        Boolean result;
        if (fh == null) {
            followHistory.setDelFlag(Const.DEL_FLAG_DELETE);
            result = followHistoryService.insert(followHistory);
        } else {
            fh.setDelFlag(Const.DEL_FLAG_DELETE);
            result = followHistoryService.updateById(fh);
        }
        if (result) {
            return "取关成功!";
        }
        return "取关失败!请稍后再试";
    }


    /**
     * 跳往搜寻作品页面
     *
     * @return
     */
    @RequestMapping(value = "searchWorks", method = RequestMethod.GET)
    @OAuthRequired
    public String searchWorks(HttpSession session,
                              ModelMap map,
                              @RequestParam(required = false) String name) {

        List<String> searchWorks = (List<String>) session.getAttribute("searchWorks");
        if (searchWorks == null) {
            searchWorks = new ArrayList<>();
        }
        if (!searchWorks.contains(name)) {
            searchWorks.add(name);
        }
        session.setAttribute("searchWorks", searchWorks);

        EntityWrapper<Works> ew = new EntityWrapper<>(new Works());
        ew.like("name", name);
        List<Works> defaultList = worksService.selectList(ew);
        ew.orderBy("createDate", false);
        List<Works> timeList = worksService.selectList(ew);

        for (int i = 0; i < defaultList.size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(defaultList.get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                defaultList.get(i).setImages(images.get(0).getUrl());
            }
            if (!StringUtils.isEmpty(defaultList.get(i).getBreed())) {
                defaultList.get(i).setBreed(dictService.getLabelByValue(defaultList.get(i).getBreed(), "dd_pinzhong"));
            }

        }
        for (int i = 0; i < timeList.size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(timeList.get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                timeList.get(i).setImages(images.get(0).getUrl());
            }
            if (!StringUtils.isEmpty(timeList.get(i).getBreed())) {
                timeList.get(i).setBreed(dictService.getLabelByValue(timeList.get(i).getBreed(), "dd_pinzhong"));
            }
        }

        map.put("defaultList", defaultList);
        map.put("timeList", timeList);
        return "modules/mobile/pawn2/searchWorks";
    }

    /**
     * 跳往用户详情页面
     *
     * @return
     */
    @RequestMapping(value = "appUserInfo", method = RequestMethod.GET)
    @OAuthRequired
    public String appUserInfo(HttpSession session,
                              ModelMap map,
                              @RequestParam(required = false) int appUserId) {
        AppUser currentUser = getCurrentUser();
        AppUser appUser1 = appUserService.selectById(appUserId);
        String identification = appUser1.getIdentification();
        if (identification != null && identification.length() > 8) {
            identification = identification.substring(0, 4) + "**********" + identification.substring(identification.length() - 4);
        }
        appUser1.setIdentification(identification);

        Works works = new Works();
        works.setCreateBy(appUserId);
        List<Works> worksList = worksService.selectList(new EntityWrapper<>(works));
        appUser1.setWorksCount(worksList.size());

        for (int i = 0; i < worksList.size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(worksList.get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                worksList.get(i).setImages(images.get(0).getUrl());
            }
            if (!StringUtils.isEmpty(worksList.get(i).getBreed())) {
                worksList.get(i).setBreed(dictService.getLabelByValue(worksList.get(i).getBreed(), "dd_pinzhong"));
            }
        }

        List<AppUser> appUserList = appUserService.searchFollowUsersByUserId(appUserId);
        appUser1.setFollowCount(appUserList.size());

        List<AppUser> haveFocusList = new ArrayList<>();
        Map<Integer, AppUser> appUserMap = new HashMap<>();
        for (AppUser uu : appUserList) {
            appUserMap.put(uu.getId(), uu);
        }
        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(currentUser.getId());
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_FOCUS);
        followHistory.setDelFlag(Const.DEL_FLAG_NORMAL);
        List<FollowHistory> followHistoryList = followHistoryService.selectList(new EntityWrapper<>(followHistory));
        for (FollowHistory fw : followHistoryList) {
            Integer id = fw.getTargetId();
            if (appUserMap.containsKey(id)) {
                haveFocusList.add(appUserMap.get(id));
            }
        }

        appUserList.removeAll(haveFocusList);
        map.put("appUser", appUser1);
        map.put("worksList", worksList);
        map.put("haveFocusList", haveFocusList);
        map.put("notFocusList", appUserList);

        return "modules/mobile/pawn2/appUserInfo";
    }

    /**
     * 跳往作品详情页面
     *
     * @return
     */
    @RequestMapping(value = "worksDetail", method = RequestMethod.GET)
    @OAuthRequired
    public String worksDetail(HttpSession session,
                              ModelMap map,
                              @RequestParam int worksId) {
        AppUser currentUser = getCurrentUser();
        //增加浏览记录
        FollowHistory addBrowse = new FollowHistory();
        addBrowse.setTargetId(worksId);
        addBrowse.setUserId(currentUser.getId());
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

        //作品
        Works works = worksService.selectById(worksId);
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


        //作品等级
        WorksLevel wl = new WorksLevel(worksId);
        WorksLevel worksLevel = worksLevelService.selectOne(new EntityWrapper<>(wl));

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


        //作品用户
        AppUser appUser1 = appUserService.selectById(works.getCreateBy());
        //作品提供者
        Consumer provider = new Consumer(Const.CONSUMER_TYPE_PROVIDER, worksId);
        provider = consumerService.selectOne(new EntityWrapper<>(provider));
        if (provider != null) {
            String identification = provider.getNo();
            if (identification != null && identification.length() > 8) {
                identification = identification.substring(0, 4) + "**********" + identification.substring(identification.length() - 4);
            }
            provider.setNo(identification);
        }
        //作品收藏者
        Consumer collecter = new Consumer(Const.CONSUMER_TYPE_COLLECT, worksId);
        collecter = consumerService.selectOne(new EntityWrapper<>(collecter));
        if (collecter != null) {
            String identification = collecter.getNo();
            if (identification != null && identification.length() > 8) {
                identification = identification.substring(0, 4) + "**********" + identification.substring(identification.length() - 4);
            }
            collecter.setNo(identification);
        }
        //作品图片
        Images images = new Images(worksId, Const.IMAGES_WORKS);
        List<Images> imagesList = imagesService.selectList(new EntityWrapper<>(images));

        //收藏该作品的用户集合
        List<AppUser> collecterList = appUserService.searchFollowHistoryUsers(Const.FOLLOW_HISTORY_TYPE_COLLECT, worksId);
        if (collecterList.size() > 10) {
            collecterList = collecterList.subList(0, 9);
        }

        //查看过该作品的用户集合
        List<FollowHistory> browserPeopleList = followHistoryService.browserPeopleList(worksId);
        if (collecterList.size() > 9) {
            browserPeopleList = browserPeopleList.subList(0, 9);
        }

        //评估报告及图片
        Report report = new Report(worksId);
        report = reportService.selectOne(new EntityWrapper<>(report));
        Images certImage = new Images();
        List<Images> valueImages = new ArrayList<>();
        if (report != null) {
            certImage.setTargetId(report.getId());
            certImage.setType(Const.IMAGES_REPORT_CERTIFICATE);
            certImage = imagesService.selectOne(certImage);

            Images valueImage = new Images(report.getId(), Const.IMAGES_REPORT_DES);
            valueImages = imagesService.selectList(new EntityWrapper<>(valueImage));
        }


        //诠释详情
        List<Interpretation> interpretationList = interpretationService.interpretationContainImages(worksId);

        map.put("appUser", appUser1);
        map.put("works", works);
        map.put("worksLevel", worksLevel);
        map.put("provider", provider);
        map.put("collecter", collecter);
        map.put("imagesList", imagesList);
        map.put("collecterList", collecterList);
        map.put("browserPeopleList", browserPeopleList);
        map.put("report", report);
        map.put("certImage", certImage);
        map.put("valueImages", valueImages);
        map.put("interpretationList", interpretationList);

        return "modules/mobile/pawn2/worksDetail";
    }

    /**
     * 添加作品诠释页面
     *
     * @return
     */
    @RequestMapping(value = "interpretationPre", method = RequestMethod.GET)
    @OAuthRequired
    public String interpretationPre(HttpSession session,
                                    @RequestParam(required = false) int worksId,
                                    ModelMap map) {
        map.put("worksId", worksId);
        return "modules/mobile/pawn2/interpretation";
    }

    /**
     * 完成作品诠释
     *
     * @return
     */
    @RequestMapping(value = "interpretationComplete", method = RequestMethod.POST)
    @OAuthRequired
    public String interpretationComplete(HttpSession session,
                                         ModelMap map,
                                         Interpretation interpretation,
                                         @RequestParam(required = false) String interImages) {
        AppUser currentUser = getCurrentUser();
        interpretation.setUserId(currentUser.getId());
        interpretationService.insert(interpretation);
        int interId = interpretation.getId();
        insertImage(interImages, interId, Const.IMAGES_INTERPRETATION);
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/worksDetail?worksId=" + interpretation.getWorksId();
    }


    /**
     * 跳往作品详情:诠释详情页面
     *
     * @return
     */
    @RequestMapping(value = "interpretationDetail", method = RequestMethod.GET)
    @OAuthRequired
    public String worksExplainDetail(HttpSession session,
                                     @RequestParam(required = false) int interId,
                                     ModelMap map) {
        Interpretation interpretation = interpretationService.byIdContainImages(interId);

        map.put("interpretation", interpretation);
        return "modules/mobile/pawn2/interpretationDetail";
    }

    /**
     * 跳往个人信息页面
     *
     * @return
     */
    @RequestMapping(value = "my", method = RequestMethod.GET)
    @OAuthRequired
    public String my(HttpSession session,
                     ModelMap map) {
        AppUser currentUser = getCurrentUser();
        map.put("appUser", appUserService.searchMyInfo(currentUser.getId()));
        return "modules/mobile/pawn2/my";
    }

    /**
     * 跳往个人信息编辑页面
     *
     * @return
     */
    @RequestMapping(value = "my/mySet", method = RequestMethod.GET)
    @OAuthRequired
    public String mySet(HttpSession session,
                        ModelMap map) {
        AppUser currentUser = getCurrentUser();
        map.put("appUser", currentUser);
        return "modules/mobile/pawn2/mySet";
    }

    /**
     * 完成个人信息编辑更新
     *
     * @return
     */
    @RequestMapping(value = "my/mySetComplete", method = RequestMethod.POST)
    @OAuthRequired
    public String mySetComplete(HttpSession session,
                                @RequestParam(required = false) String name,
                                @RequestParam(required = false) String address,
                                @RequestParam(required = false) String phone,
                                @RequestParam(required = false) String email,
                                @RequestParam(required = false) String identification,
                                @RequestParam(required = false) String prefer,
                                @RequestParam(required = false) String ifpublic) {
        AppUser currentUser = getCurrentUser();
        currentUser.setName(name);
        currentUser.setPhone(phone);
        currentUser.setEmail(email);
        currentUser.setAddress(address);
        currentUser.setIdentification(identification);
        currentUser.setPrefer(prefer);
        if (ifpublic == null) {
            currentUser.setPub(false);
        } else {
            currentUser.setPub(true);
        }
        appUserService.updateById(currentUser);
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my";
    }


    /**
     * 更新头像及昵称
     *
     * @return
     */
    @RequestMapping(value = "updateHeadImgLoginName", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String updateHeadImgLoginName(HttpSession session) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String unionId = wxMpUser.getUnionId();
        AppUser u = new AppUser();
        u.setUnionId(unionId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        appUser.setLoginName(wxMpUser.getNickname());
        appUser.setHeadImgUrl(wxMpUser.getHeadImgUrl());
        boolean result = appUserService.updateById(appUser);
        if (result) {
            return "完成更新,刷新页面后可看到改变!";
        }

        return "更新失败,请稍后再试...";
    }


    /**
     * 跳往个人信息积分中心页面
     *
     * @return
     */
    @RequestMapping(value = "my/pointCenter", method = RequestMethod.GET)
    @OAuthRequired
    public String pointCenter(HttpSession session,
                              ModelMap map) {
        AppUser currentUser = getCurrentUser();
        map.put("appUser", currentUser);

        return "modules/mobile/pawn2/pointCenter";
    }

    /**
     * @return
     */
    @RequestMapping(value = "my/pointCenter/point_load", method = RequestMethod.GET)
    @ResponseBody
    public List<ScoreHistory> loadIntegral(HttpSession session, ModelMap map) {
        AppUser currentUser = getCurrentUser();
        EntityWrapper<ScoreHistory> ew = new EntityWrapper<>(new ScoreHistory());
        ew.setSqlSelect("value,update_date,from_user_id,to_user_id,type");
        ew.addFilter("from_user_id = {0} or to_user_id = {0}", currentUser.getId());
        ew.orderBy("update_date", false);
        List<ScoreHistory> scoreHistoryList = scoreHistoryService.selectList(ew);
        for (ScoreHistory s : scoreHistoryList) {
            if (s.getType() != null && s.getType().trim().length() > 0) {
                s.setType(dictService.getLabelByValue(s.getType(), "score_type"));
            }
        }
        map.put("myId", currentUser.getId());
        return scoreHistoryList;
    }

    /**
     * 跳往个人信息积分充值页面
     *
     * @return
     */
    @RequestMapping(value = "my/pointSave", method = RequestMethod.GET)
    @OAuthRequired
    public String pointSave(HttpSession session,
                            ModelMap map) {
        return "modules/mobile/pawn2/pointSave";
    }

    /**
     * 积分充值完成
     *
     * @return
     */
    @RequestMapping(value = "my/pointSaveComplete", method = RequestMethod.GET)
    @OAuthRequired
    public String pointSaveComplete(HttpSession session,
                                    ModelMap map,
                                    @RequestParam(required = false) int score) {
        return "modules/mobile/pawn2/my";
    }

    /**
     * 跳往个人信息积分提现页面
     *
     * @return
     */
    @RequestMapping(value = "my/pointWithdraw", method = RequestMethod.GET)
    @OAuthRequired
    public String pointWithdraw(HttpSession session,
                                ModelMap map) {
        return "modules/mobile/pawn2/pointWithdraw";
    }

    /**
     * 积分提现完成
     *
     * @return
     */
    @RequestMapping(value = "my/pointWithdrawComplete", method = RequestMethod.GET)
    @OAuthRequired
    public String pointWithdrawComplete(HttpSession session,
                                        ModelMap map,
                                        @RequestParam(required = false) int score) {
        return "modules/mobile/pawn2/my";
    }

    /**
     * 跳往个人信息:我的作品页面
     *
     * @return
     */
    @RequestMapping(value = "my/myWorks", method = RequestMethod.GET)
    @OAuthRequired
    public String myWorks(HttpSession session,
                          ModelMap map,
                          @RequestParam String showwhich) {
        AppUser currentUser = getCurrentUser();
        Works works = new Works();
        works.setCreateBy(currentUser.getId());
        EntityWrapper ew = new EntityWrapper(works);
        List<Works> worksList = worksService.selectList(ew);

        for (int i = 0; i < worksList.size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(worksList.get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                worksList.get(i).setImages(images.get(0).getUrl());
            }
        }

        List<Works> worksSuccessList = new ArrayList<>();
        List<Works> worksFailureList = new ArrayList<>();
        List<Works> worksNowList = new ArrayList<>();
        List<Works> worksDraftList = new ArrayList<>();
        for (Works w : worksList) {
            if (Const.WORKS_STATUS_PASS.equals(w.getStatus())) {
                worksSuccessList.add(w);
            } else if (Const.WORKS_STATUS_UNPASS.equals(w.getStatus())) {
                worksFailureList.add(w);
            } else if (Const.WORKS_STATUS_COMMIT.equals(w.getStatus())) {
                worksNowList.add(w);
            } else if (Const.WORKS_STATUS_DRAFT.equals(w.getStatus())) {
                worksDraftList.add(w);
            }
        }

        map.put("showwhich", showwhich);
        map.put("worksSuccessList", worksSuccessList);
        map.put("worksFailureList", worksFailureList);
        map.put("worksNowList", worksNowList);
        map.put("worksDraftList", worksDraftList);
        return "modules/mobile/pawn2/myWorks";
    }


    /**
     * 跳往个人信息:转让-收藏-关注页面
     *
     * @return
     */
    @RequestMapping(value = "my/transferCollectionFocus", method = RequestMethod.GET)
    @OAuthRequired
    public String transferCollectionFocus(HttpSession session,
                                          ModelMap map,
                                          @RequestParam String showwhich) {
        AppUser currentUser = getCurrentUser();
        Integer appUserId = currentUser.getId();

        //转让历史集合
        List<TransferHistory> transferHistoryList = transferHistoryService.containWorks(appUserId);

        //收藏作品集合
        List<Works> fhWorksList = worksService.collectionWorksList(appUserId);

        //关注用户集合
        List<AppUser> fhPeopleList = appUserService.searchFocusById(appUserId);

        for (int i = 0; i < transferHistoryList.size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(transferHistoryList.get(i).getWorksId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                transferHistoryList.get(i).getWorks().setImages(images.get(0).getUrl());
            }
            if (!StringUtils.isEmpty(transferHistoryList.get(i).getWorks().getBreed())) {
                transferHistoryList.get(i).getWorks().setBreed(dictService.getLabelByValue(transferHistoryList.get(i).getWorks().getBreed(), "dd_pinzhong"));
            }

        }
        for (int i = 0; i < fhWorksList.size(); i++) {
            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(fhWorksList.get(i).getId(), Const.IMAGES_WORKS)));
            if (images != null && images.size() > 0) {
                fhWorksList.get(i).setImages(images.get(0).getUrl());
            }
            if (!StringUtils.isEmpty(fhWorksList.get(i).getBreed())) {
                fhWorksList.get(i).setBreed(dictService.getLabelByValue(fhWorksList.get(i).getBreed(), "dd_pinzhong"));
            }
        }


        map.put("showwhich", showwhich);
        map.put("transferHistoryList", transferHistoryList);
        map.put("fhWorksList", fhWorksList);
        map.put("fhPeopleList", fhPeopleList);
        map.put("appUserId", appUserId);

        return "modules/mobile/pawn2/transferCollectionFocus";
    }

    /**
     * 删除作品
     *
     * @return
     */
    @RequestMapping(value = "delWorks", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String delWorks(HttpSession session,
                           @RequestParam(required = false) int worksId) {
        Boolean result = false;

        Works works = worksService.selectById(worksId);
        if (works != null) {
            works.setDelFlag(Const.DEL_FLAG_DELETE);
            result = worksService.updateById(works);
        }

        if (result) {
            return "删除成功!";
        }

        return "删除失败,请稍后再试...";
    }


    /**
     * 跳往转让页面
     *
     * @return
     */
    @RequestMapping(value = "transfer", method = RequestMethod.GET)
    @OAuthRequired
    public String transfer(HttpSession session,
                           ModelMap map,
                           @RequestParam(required = false) int worksId) {
        Works works = worksService.selectById(worksId);
        map.put("worksId", worksId);
        map.put("works", works);
        return "modules/mobile/pawn2/transfer";
    }

    /**
     * 转让页面ajax查找用户
     *
     * @return
     */
    @RequestMapping(value = "selectTransferPerson", method = RequestMethod.GET,
            produces = "application/json;charset=utf-8")
    @OAuthRequired
    @ResponseBody
    public List<AppUser> selectTransferPerson(HttpSession session,
                                              @RequestParam(required = false) String info) {
        AppUser currentUser = getCurrentUser();
        List<AppUser> appUsers = new ArrayList<>();
        if (info != null && info.trim().length() > 0) {
            appUsers = appUserService.searchUserByNameAndId(info, currentUser.getId());
        }

        return appUsers;
    }


    /**
     * 转让完成
     *
     * @return
     */
    @RequestMapping(value = "transferComplete", method = RequestMethod.POST)
    @OAuthRequired
    public String transferComplete(HttpSession session,
                                   ModelMap map,
                                   TransferHistory transferHistory,
                                   @RequestParam(required = false) String transferTypeString) {
        AppUser currentUser = getCurrentUser();
        Works works = worksService.selectById(transferHistory.getWorksId());
        works.setStatus(Const.WORKS_STATUS_TRANSFER);
        worksService.updateById(works);

        transferHistory.setFromUserId(currentUser.getId());
        transferHistory.setStatus(Const.TRANSFER_STATUS_WAIT);
        if ("售卖".equals(transferTypeString)) {
            transferHistory.setTransferType(Const.TRANSFER_TYPE_SELL);
        } else if ("赠送".equals(transferTypeString)) {
            transferHistory.setTransferType(Const.TRANSFER_TYPE_GIVE);
        }
        transferHistory.setCreateDate(new Date());
        transferHistoryService.insert(transferHistory);

        return "redirect:" + configStorage.getOauth2redirectUri()
                + "/mobile/my/transferCollectionFocus?showwhich=transfer";
    }


    /**
     * 确认转入
     *
     * @return
     */
    @RequestMapping(value = "confirmTransfer", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    @OAuthRequired
    public String confirmTransfer(HttpSession session,
                                  @RequestParam(required = false) int thId) {
        AppUser currentUser = getCurrentUser();
        TransferHistory transferHistory = transferHistoryService.selectById(thId);
        Works works = worksService.selectById(transferHistory.getWorksId());
        works.setStatus(Const.WORKS_STATUS_PASS);
        works.setCreateBy(currentUser.getId());
        worksService.updateById(works);
        transferHistory.setStatus(Const.TRANSFER_STATUS_HAVE);
        boolean result = transferHistoryService.updateById(transferHistory);
        if (result) {
            return "已转入!";
        }
        return "转入失败!请稍后再试";
    }


    /**
     * 跳往转让历史页面
     *
     * @return
     */
    @RequestMapping(value = "transferHistory", method = RequestMethod.GET)
    @OAuthRequired
    public String transferHistory(HttpSession session,
                                  ModelMap map,
                                  @RequestParam(required = false) Integer worksId) {

        List<TransferHistory> transferHistoryList = transferHistoryService.thContainUsersInfo(worksId);

        map.put("transferHistoryList", transferHistoryList);
        return "modules/mobile/pawn2/transferHistory";
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

    //去除emoji
    public static String filterEmoji(String source) {
        if (StringUtils.isNotBlank(source)) {
            return source.replaceAll("[\\ud800\\udc00-\\udbff\\udfff\\ud800-\\udfff]", "*");
        } else {
            return source;
        }
    }

    //发送模板消息
    public void sendTemplateMsg(int targetId, String templateId, String url, String first, String keyword1, String keyword2, String remark) {
        AppUser targetUser = appUserService.selectById(targetId);
        WxMpTemplateMessage templateMessage = new WxMpTemplateMessage();
        templateMessage.setToUser(targetUser.getOpenId());
        templateMessage.setTemplateId(templateId);
        templateMessage.setUrl(url);
        templateMessage.setTopColor("#000000");
        templateMessage.getData().add(new WxMpTemplateData("first", first, "#000000"));
        templateMessage.getData().add(new WxMpTemplateData("keyword1", keyword1));
        templateMessage.getData().add(new WxMpTemplateData("keyword2", keyword2));
        templateMessage.getData().add(new WxMpTemplateData("remark", remark, "#000000"));
        try {
            wxMpTemplateMsgService.sendTemplateMsg(templateMessage);
        } catch (WxErrorException e) {
            e.printStackTrace();
        }
    }
}