package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.DateUtil;
import com.fish.idle.weixin.interceptor.OAuthRequired;

import org.springframework.beans.factory.annotation.Autowired;
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
    private WxMpService wxMpService;

    @RequestMapping(method = RequestMethod.GET)
    @OAuthRequired
    public String toLogin(HttpSession session, ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            appUser = new AppUser();
            appUser.setLoginName(wxMpUser.getNickname());
            appUser.setPassword("iLoveMoney");
            appUser.setName(wxMpUser.getNickname());
            appUser.setDelFlag(Const.DEL_FLAG_NORMAL);
            appUser.setOpenId(wxMpUser.getOpenId());
            appUser.setLastLogin(new Date());
            appUser.setHeadImgUrl(wxMpUser.getHeadImgUrl());
            appUserService.insert(appUser);
        } else {
            appUser.setLastLogin(new Date());
            appUserService.updateSelectiveById(appUser);
        }
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        Works works = new Works();
        works.setStatus(Const.WORKS_STATUS_PASS);
        EntityWrapper<Works> ew = new EntityWrapper(works);
        ew.setSqlSelect(" *,(select url from dd_images where target_id = dd_works.id and type = 0 limit 1) as images");
        Page<Works> page = new Page<>(1, 4);
        page = worksService.selectPage(page, ew);
        map.put("page", page);
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
//        if (appUser == null) {
//            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
//        }
        Works works = new Works();
        works.setStatus(Const.WORKS_STATUS_PASS);
        Page<Works> page = new Page<>(pageNo, 4);
        page = worksService.selectPage(page, new EntityWrapper<>(works));
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(appUser.getId());
        followHistory.setTargetId(worksId);
        followHistory.setType(0);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        if (fh == null) {
            followHistoryService.insert(followHistory);
            return "收藏成功!!!";
        }
        return "已在收藏中!";
    }


    /**
     * 跳往搜寻页面
     *
     * @return
     */
    @RequestMapping(value = "search", method = RequestMethod.GET)
    @OAuthRequired
    public String search(HttpSession session) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        return "modules/mobile/pawn2/search";
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        List<AppUser> appUserList = appUserService.searchUsersByName(name, appUser.getId());

        Map<Integer, AppUser> appUserMap = new HashMap<>();
        for (AppUser uu : appUserList) {
            appUserMap.put(uu.getId(), uu);
        }

        List<AppUser> haveFocusList = new ArrayList<>();

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(appUser.getId());
        followHistory.setType(1);
        followHistory.setDelFlag(0);
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(appUser.getId());
        followHistory.setTargetId(targetId);
        followHistory.setType(1);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        Boolean result;
        if (fh == null) {
            followHistory.setDelFlag(0);
            result = followHistoryService.insert(followHistory);
        } else {
            fh.setDelFlag(0);
            result = followHistoryService.updateById(fh);
        }
        if (result) {
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(appUser.getId());
        followHistory.setTargetId(targetId);
        followHistory.setType(1);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        Boolean result;
        if (fh == null) {
            followHistory.setDelFlag(1);
            result = followHistoryService.insert(followHistory);
        } else {
            fh.setDelFlag(1);
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Page<Works> page = new Page<>(1, 100);
        EntityWrapper<Works> ew = new EntityWrapper<>(new Works());
        ew.like("name", name);
        page = worksService.selectPage(page, ew);

        map.put("page", page);
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        AppUser appUser1 = appUserService.selectById(appUserId);

        Works works = new Works();
        works.setCreateBy(appUserId);
        List<Works> worksList = worksService.selectList(new EntityWrapper<>(works));
        appUser1.setWorksCount(worksList.size());

        List<AppUser> appUserList = appUserService.searchFollowUsersByUserId(appUserId);
        appUser1.setFollowCount(appUserList.size());

        List<AppUser> haveFocusList = new ArrayList<>();
        Map<Integer, AppUser> appUserMap = new HashMap<>();
        for (AppUser uu : appUserList) {
            appUserMap.put(uu.getId(), uu);
        }
        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(appUser.getId());
        followHistory.setType(1);
        followHistory.setDelFlag(0);
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        //增加浏览记录
        FollowHistory addBrowse = new FollowHistory();
        addBrowse.setTargetId(worksId);
        addBrowse.setUserId(appUser.getId());
        addBrowse.setType(Const.FOLLOW_HISTORY_TYPE_BROWSE);
        FollowHistory oldBrowse = followHistoryService.selectOne(new EntityWrapper<>(addBrowse));
        if (oldBrowse == null) {
            addBrowse.setCreateDate(new Date());
            followHistoryService.insert(addBrowse);
        } else {
            oldBrowse.setUpdateDate(new Date());
            followHistoryService.updateById(oldBrowse);
        }


        //作品
        Works works = worksService.selectById(worksId);
        //作品等级
        WorksLevel wl = new WorksLevel();
        wl.setWorksId(worksId);
        WorksLevel worksLevel = worksLevelService.selectOne(new EntityWrapper<>(wl));
        //作品用户
        AppUser appUser1 = appUserService.selectById(works.getCreateBy());
        //作品提供者
        Consumer provider = new Consumer();
        provider.setType(Const.CONSUMER_TYPE_PROVIDER);
        provider.setWorksId(worksId);
        provider = consumerService.selectOne(new EntityWrapper<>(provider));
        //作品收藏者
        Consumer collecter = new Consumer();
        collecter.setType(Const.CONSUMER_TYPE_COLLECT);
        collecter.setWorksId(worksId);
        collecter = consumerService.selectOne(new EntityWrapper<>(collecter));
        //作品图片
        Images images = new Images();
        images.setTargetId(worksId);
        images.setType(Const.IMAGES_WORKS);
        List<Images> imagesList = imagesService.selectList(new EntityWrapper<>(images));

        //收藏该作品的用户集合
        List<AppUser> collecterList = appUserService.searchFollowHistoryUsers(Const.FOLLOW_HISTORY_TYPE_COLLECT, worksId);
        if (collecterList.size() > 10) {
            collecterList = collecterList.subList(0, 9);
        }

        //查看过该作品的用户集合
        List<AppUser> browseList = appUserService.searchFollowHistoryUsers(Const.FOLLOW_HISTORY_TYPE_BROWSE, worksId);
        if (browseList.size() > 10) {
            browseList = browseList.subList(0, 9);
        }

        //评估报告及图片
        Report report = new Report();
        report.setWorksId(worksId);
        report = reportService.selectOne(new EntityWrapper<>(report));
        Images certImage = new Images();
        certImage.setTargetId(worksId);
        certImage.setType(Const.IMAGES_REPORT_CERTIFICATE);


        //诠释详情
        List<Interpretation> interpretationList = interpretationService.interpretationContainImages(worksId);

        map.put("appUser", appUser1);
        map.put("works", works);
        map.put("worksLevel", worksLevel);
        map.put("provider", provider);
        map.put("collecter", collecter);
        map.put("imagesList", imagesList);
        map.put("collecterList", collecterList);
        map.put("browseList", browseList);
        map.put("report", report);
        map.put("certImage", certImage);
        map.put("interpretationList", interpretationList);

        return "modules/mobile/pawn2/worksDetail";
    }

    /**
     * 跳往作品诠释页面
     *
     * @return
     */
    @RequestMapping(value = "interpretationPre", method = RequestMethod.GET)
    @OAuthRequired
    public String interpretationPre(HttpSession session,
                                    @RequestParam(required = false) int worksId,
                                    ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        map.put("worksId", worksId);
        return "modules/mobile/pawn2/interpretation";
    }

    /**
     * 完成作品诠释
     *
     * @return
     */
    @RequestMapping(value = "interpretationComplete", method = RequestMethod.GET)
    @OAuthRequired
    public String interpretationComplete(HttpSession session,
                                         @RequestParam(required = false) int worksId,
                                         ModelMap map,
                                         Interpretation interpretation,
                                         @RequestParam(required = false) String imgUrls) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        interpretation.setUserId(appUser.getId());
        interpretation.setWorksId(worksId);
        interpretationService.insert(interpretation);
        int interId = interpretation.getId();
        if (imgUrls != null && imgUrls.trim().length() > 0) {
            String[] urls = imgUrls.split(",");
            for (String url : urls) {
                Images images = new Images();
                images.setTargetId(interId);
                images.setUrl(url);
                images.setType(Const.IMAGES_INTERPRETATION);
                imagesService.insert(images);
            }
        }

        map.put("worksId", worksId);
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/worksDetail?worksId=" + worksId;
    }


    /**
     * 跳往作品详情:诠释详情页面
     *
     * @return
     */
    @RequestMapping(value = "worksExplainDetail", method = RequestMethod.GET)
    @OAuthRequired
    public String worksExplainDetail(HttpSession session) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        return "modules/mobile/pawn2/worksExplainDetail";
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        map.put("appUser", appUserService.searchMyInfo(appUser.getId()));

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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        map.put("appUser", appUser);
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        appUser.setName(name);
        appUser.setPhone(phone);
        appUser.setEmail(email);
        appUser.setAddress(address);
        appUser.setIdentification(identification);
        appUser.setPrefer(prefer);
        appUserService.updateById(appUser);
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my";
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        map.put("appUser", appUser);

        return "modules/mobile/pawn2/pointCenter";
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        Works works = new Works();
        works.setCreateBy(appUser.getId());
        EntityWrapper ew = new EntityWrapper(works);
        List<Works> worksList = worksService.selectList(ew);

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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Integer appUserId = appUser.getId();

        //转让作品集合
        List<Works> transferWorksList = worksService.transferWorksList(appUserId);

        //收藏作品集合
        List<Works> fhWorksList = worksService.collectionWorksList(appUserId);

        //关注用户集合
        List<AppUser> fhPeopleList = appUserService.searchFocusById(appUserId);

        map.put("showwhich", showwhich);
        map.put("transferWorksList", transferWorksList);
        map.put("fhWorksList", fhWorksList);
        map.put("fhPeopleList", fhPeopleList);

        return "modules/mobile/pawn2/transferCollectionFocus";
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
//        if (appUser == null) {
//            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
//        }
        List<AppUser> appUsers = new ArrayList<>();
        if (info != null && info.trim().length() > 0) {
            appUsers = appUserService.searchUserByNameAndId(info, appUser.getId());
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Works works = worksService.selectById(transferHistory.getWorksId());
        works.setStatus(Const.WORKS_STATUS_TRANSFER);
        worksService.updateById(works);

        transferHistory.setFromUserId(appUser.getId());
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
     * 作品注册页面1
     *
     * @return
     */
    @RequestMapping(value = "worksRegister1", method = RequestMethod.GET)
    @OAuthRequired
    public String worksRegister1(HttpSession session) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

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
                                 @RequestParam(required = false) String createDateString,
                                 @RequestParam(required = false) String worksName,
                                 @RequestParam(required = false) String providerName,
                                 @RequestParam(required = false) String providerNo,
                                 @RequestParam(required = false) String worksRemarks,
                                 @RequestParam(required = false) String imgUrls,
                                 @RequestParam(required = false) String draftYN) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
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
        consumer.setName(providerName);
        consumer.setType(Const.CONSUMER_TYPE_PROVIDER);
        consumer.setWorksId(works.getId());
        consumer.setNo(providerNo);
        consumerService.insert(consumer);

        Integer worksId = works.getId();

        if (imgUrls != null && imgUrls.trim().length() > 0) {
            String[] urls = imgUrls.split(",");
            for (String url : urls) {
                Images images = new Images();
                images.setTargetId(worksId);
                images.setUrl(url);
                images.setType(Const.IMAGES_WORKS);
                imagesService.insert(images);
            }
        }
        if ("yes".equals(draftYN)) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }
        session.setAttribute("registerWorksName", works.getName());
        session.setAttribute("registerWorksId", worksId);
        session.setAttribute("registerWorks", works);
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
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
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
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        }
        session.setAttribute("registerWorks", works);
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
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        int worksId = (int) session.getAttribute("registerWorksId");
        worksLevel.setWorksId(worksId);
        worksLevelService.insert(worksLevel);


        if ("yes".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setStatus(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
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
                                 @RequestParam(required = false) String zpxxImge) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        Integer worksId = (Integer) session.getAttribute("registerWorksId");
        report.setWorksId(worksId);
        reportService.insert(report);

        if (zpxxImge != null && zpxxImge.length() > 0) {
            Images images = new Images();
            images.setUrl(zpxxImge);
            images.setType(Const.IMAGES_REPORT_CERTIFICATE);
            images.setTargetId(worksId);
        }


        if ("yes".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setStatus(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=draft";
        } else if ("confirm".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setStatus(Const.WORKS_STATUS_COMMIT);
            worksService.updateById(works);
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
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
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
        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my/myWorks?showwhich=now";
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
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        List<TransferHistory> transferHistoryList = transferHistoryService.thContainUsersInfo(worksId);

        map.put("transferHistoryList", transferHistoryList);
        return "modules/mobile/pawn2/transferHistory";
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
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
        AppUser appUser = appUserService.selectOne(u);
        if (appUser == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Works works = worksService.selectById(worksId);

        WorksLevel worksLevel = new WorksLevel();
        worksLevel.setWorksId(worksId);
        worksLevel = worksLevelService.selectOne(new EntityWrapper<>(worksLevel));

        Consumer provider = new Consumer();
        provider.setWorksId(worksId);
        provider.setType(Const.CONSUMER_TYPE_PROVIDER);
        provider = consumerService.selectOne(new EntityWrapper<>(provider));

        Consumer collecter = new Consumer();
        collecter.setWorksId(worksId);
        collecter.setType(Const.CONSUMER_TYPE_COLLECT);
        collecter = consumerService.selectOne(new EntityWrapper<>(collecter));

        Images images = new Images();
        images.setTargetId(worksId);
        images.setType(Const.IMAGES_WORKS);
        List<Images> worksImagesList = imagesService.selectList(new EntityWrapper<>(images));

        Report report = new Report();
        report.setWorksId(worksId);
        report = reportService.selectOne(new EntityWrapper<>(report));
        Images certImage = new Images();
        certImage.setTargetId(worksId);
        certImage.setType(Const.IMAGES_REPORT_CERTIFICATE);
        certImage = imagesService.selectOne(new EntityWrapper<>(certImage));


        map.put("works", works);
        map.put("provider", provider);
        map.put("worksLevel", worksLevel);
        map.put("worksImagesList", worksImagesList);
        map.put("collecter", collecter);
        map.put("report", report);
        map.put("certImage", certImage);

        session.setAttribute("worksIdInSession", worksId);

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
                                    @RequestParam(required = false) String worksName,
                                    @RequestParam(required = false) String worksRemarks,
                                    @RequestParam(required = false) String worksType,
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
                                    @RequestParam(required = false) String imgUrls,
                                    @RequestParam(required = false) String zpxxImge) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        AppUser u = new AppUser();
        u.setOpenId(openId);
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

        Images oldImg = new Images();
        oldImg.setTargetId(worksId);
        oldImg.setType(Const.IMAGES_WORKS);
        List<Images> oldImgs = imagesService.selectList(new EntityWrapper<>(oldImg));
        List<Integer> ids = new ArrayList<>();
        for (Images img : oldImgs) {
            ids.add(img.getId());
        }
        imagesService.deleteBatchIds(ids);

        if (imgUrls != null && imgUrls.trim().length() > 0) {
            String[] urls = imgUrls.split(",");
            for (String url : urls) {
                Images images = new Images();
                images.setTargetId(worksId);
                images.setUrl(url);
                images.setType(Const.IMAGES_WORKS);
                imagesService.insert(images);
            }
        }

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


        Consumer collecter = new Consumer();
        collecter.setWorksId(worksId);
        collecter.setName(collecterName);
        collecter.setType(Const.CONSUMER_TYPE_COLLECT);
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
        Consumer oldConsumer = new Consumer();
        oldConsumer.setWorksId(worksId);
        oldConsumer.setType(Const.CONSUMER_TYPE_COLLECT);
        oldConsumer = consumerService.selectOne(new EntityWrapper<>(cs));
        if (oldConsumer == null) {
            consumerService.insert(collecter);
        } else {
            collecter.setId(oldConsumer.getId());
            consumerService.updateById(collecter);
        }

        if (zpxxImge != null && zpxxImge.length() > 0) {
            Images images = new Images();
            images.setType(Const.IMAGES_REPORT_CERTIFICATE);
            images.setTargetId(worksId);
            images = imagesService.selectOne(new EntityWrapper<>(images));
            if (images != null) {
                images.setUrl(zpxxImge);
                imagesService.updateById(images);
            } else {
                imagesService.insert(images);
            }
        }

        return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/my";

    }
}