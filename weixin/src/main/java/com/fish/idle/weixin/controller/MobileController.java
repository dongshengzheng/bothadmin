package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.toolkit.CollectionUtil;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.User;
import com.fish.idle.service.modules.sys.service.UserService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.DateUtil;
import com.fish.idle.service.util.StringUtils;
import com.fish.idle.weixin.interceptor.OAuthRequired;

import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.bean.result.WxMpUser;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
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
    private UserService userService;

    @Autowired
    private IConsumerService consumerService;

    @Autowired
    private IWorksService worksService;

    @Autowired
    private IWorksLevelService worksLevelService;

    @Autowired
    private IImagesService imagesService;

    @Autowired
    private IFollowHistoryService followHistoryService;

    @Autowired
    private IValueReportService valueReportService;
    @Autowired
    private WxMpConfigStorage configStorage;

    @Autowired
    private WxMpService wxMpService;

    @RequestMapping(method = RequestMethod.GET)
    @OAuthRequired
    public String toLogin(HttpSession session, ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            user = new User();
            user.setLoginName(wxMpUser.getNickname());
            user.setPassword("iLoveMoney");
            user.setName(wxMpUser.getNickname());
            user.setDelFlag(Const.DEL_FLAG_NORMAL);
            user.setOpenId(wxMpUser.getOpenId());
            user.setLastLogin(new Date());
            userService.insert(user);
        } else {
            user.setLastLogin(new Date());
            userService.updateSelectiveById(user);
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
                        Works works,
                        HttpServletRequest request,
                        HttpServletResponse response,
                        ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setStatus(Const.WORKS_STATUS_PASS);
        Page<Works> page = new Page<>(1, 4);
        page = worksService.selectPage(page, new EntityWrapper<>(works));
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
                                 Works works,
                                 HttpServletRequest request,
                                 HttpServletResponse response,
                                 ModelMap map,
                                 int pageNo) {
//        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
//        String openId = wxMpUser.getOpenId();
//        User u = new User();
//        u.setOpenId(openId);
//        User user = userService.selectOne(u);
//        if (user == null) {
//            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
//        }
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
                               HttpServletRequest request,
                               HttpServletResponse response,
                               ModelMap map,
                               int worksId) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(user.getId());
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
    public String search(HttpSession session,
                         HttpServletRequest request,
                         HttpServletResponse response,
                         ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
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
                               HttpServletRequest request,
                               HttpServletResponse response,
                               ModelMap map,
                               @RequestParam(required = false) String name) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }


        List<User> userList = userService.searchUsersByName(name, user.getId());

        Map<Integer, User> userMap = new HashMap<>();
        for (User uu : userList) {
            userMap.put(uu.getId(), uu);
        }

        List<User> haveFocusList = new ArrayList<>();

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(user.getId());
        followHistory.setType(1);
        followHistory.setDelFlag(0);
        List<FollowHistory> followHistoryList = followHistoryService.selectList(new EntityWrapper<>(followHistory));
        for (FollowHistory fw : followHistoryList) {
            Integer id = fw.getTargetId();
            if (userMap.containsKey(id)) {
                haveFocusList.add(userMap.get(id));
            }
        }

        userList.removeAll(haveFocusList);

        map.put("haveFocusList", haveFocusList);
        map.put("notFocusList", userList);


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
                            HttpServletRequest request,
                            HttpServletResponse response,
                            ModelMap map,
                            int targetId) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(user.getId());
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
                            HttpServletRequest request,
                            HttpServletResponse response,
                            ModelMap map,
                            int targetId) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(user.getId());
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
                              HttpServletRequest request,
                              HttpServletResponse response,
                              ModelMap map,
                              @RequestParam(required = false) String name) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
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
    @RequestMapping(value = "userInfo", method = RequestMethod.GET)
    @OAuthRequired
    public String userInfo(HttpSession session,
                           HttpServletRequest request,
                           HttpServletResponse response,
                           ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        return "modules/mobile/pawn2/userInfo";
    }

    /**
     * 跳往作品详情页面
     *
     * @return
     */
    @RequestMapping(value = "worksDetail", method = RequestMethod.GET)
    @OAuthRequired
    public String worksDetail(HttpSession session,
                              HttpServletRequest request,
                              HttpServletResponse response,
                              ModelMap map,
                              @RequestParam int id) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Works works = worksService.selectById(id);

        WorksLevel wl = new WorksLevel();
        wl.setWorksId(id);
        WorksLevel worksLevel = worksLevelService.selectOne(new EntityWrapper<>(wl));

        //收藏该作品的历史
        FollowHistory fh = new FollowHistory();
        fh.setType(1);
        fh.setTargetId(id);
        List<FollowHistory> fhList = followHistoryService.selectList(new EntityWrapper<>(fh));
        List<User> fhuserList = new ArrayList<>();
        for (int i = 0; i < (fhList.size() < 10 ? fhList.size() : 10); i++) {

        }

        //查看过该作品的历史
        FollowHistory bh = new FollowHistory();
        bh.setType(2);
        bh.setTargetId(id);
        List<FollowHistory> bhList = followHistoryService.selectList(new EntityWrapper<>(bh));
        List<User> bhuserList = new ArrayList<>();
        for (int i = 0; i < (bhList.size() < 10 ? bhList.size() : 10); i++) {

        }

        return "modules/mobile/pawn2/worksDetail";
    }

    /**
     * 跳往作品详情:诠释详情页面
     *
     * @return
     */
    @RequestMapping(value = "worksExplainDetail", method = RequestMethod.GET)
    @OAuthRequired
    public String worksExplainDetail(HttpSession session,
                                     Works works,
                                     HttpServletRequest request,
                                     HttpServletResponse response,
                                     ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setStatus(Const.WORKS_STATUS_PASS);
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
                     HttpServletRequest request,
                     HttpServletResponse response,
                     ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        map.put("user", userService.searchMyInfo(user.getId()));

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
                        HttpServletRequest request,
                        HttpServletResponse response,
                        ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        map.put("user", user);
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
                                HttpServletRequest request,
                                HttpServletResponse response,
                                ModelMap map,
                                @RequestParam(required = false) String name,
                                @RequestParam(required = false) String address,
                                @RequestParam(required = false) String phone,
                                @RequestParam(required = false) String email,
                                @RequestParam(required = false) String identification,
                                @RequestParam(required = false) String perfer,
                                @RequestParam(required = false) String ifpublic) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        user.setName(name);
        user.setPhone(phone);
        user.setEmail(email);

        userService.updateById(user);
        map.put("user", user);
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
                              HttpServletRequest request,
                              HttpServletResponse response,
                              ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        map.put("user", user);

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
                            Works works,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setStatus(Const.WORKS_STATUS_PASS);
        return "modules/mobile/pawn2/pointSave";
    }

    /**
     * 跳往个人信息积分提现页面
     *
     * @return
     */
    @RequestMapping(value = "my/pointWithdraw", method = RequestMethod.GET)
    @OAuthRequired
    public String pointWithdraw(HttpSession session,
                                Works works,
                                HttpServletRequest request,
                                HttpServletResponse response,
                                ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setStatus(Const.WORKS_STATUS_PASS);
        return "modules/mobile/pawn2/pointWithdraw";
    }

    /**
     * 跳往个人信息:我的作品页面
     *
     * @return
     */
    @RequestMapping(value = "my/myWorks", method = RequestMethod.GET)
    @OAuthRequired
    public String myWorks(HttpSession session,
                          Works works,
                          HttpServletRequest request,
                          HttpServletResponse response,
                          ModelMap map,
                          @RequestParam String showwhich) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setCreateBy(user.getId());
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
                                          HttpServletRequest request,
                                          HttpServletResponse response,
                                          ModelMap map,
                                          @RequestParam String showwhich) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        Works works1 = new Works();
        EntityWrapper ew1 = new EntityWrapper(works1);
        List<Integer> transferIds;


        //收藏作品集合
        FollowHistory fhWorks = new FollowHistory();
        fhWorks.setType(0);
        fhWorks.setUserId(user.getId());
        EntityWrapper ew2 = new EntityWrapper(fhWorks);
        List<FollowHistory> followHistoryList = followHistoryService.selectList(ew2);
        List<Integer> fhWorksIds = new ArrayList<>();
        for (FollowHistory fh : followHistoryList) {
            fhWorksIds.add(fh.getTargetId());
        }
        List<Works> fhWorksList = new ArrayList<>();
        if (fhWorksIds.size() > 0) {
            Works works2 = new Works();
            EntityWrapper ew3 = new EntityWrapper(works2);
            ew3.in("id", fhWorksIds);
            fhWorksList = worksService.selectList(ew3);
        }


        //        关注用户集合
        List<User> fhPeopleList = userService.searchFocusById(user.getId());

        map.put("showwhich", showwhich);
        map.put("fhWorksList", fhWorksList);
        map.put("fhPeopleList", fhPeopleList);

        return "modules/mobile/pawn2/transferCollectionFocus";
    }


    /**
     * 作品注册页面1
     *
     * @return
     */
    @RequestMapping(value = "worksRegister1", method = RequestMethod.GET)
    @OAuthRequired
    public String worksRegister1(HttpSession session,
                                 HttpServletRequest request,
                                 HttpServletResponse response,
                                 ModelMap map) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
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
                                 HttpServletRequest request,
                                 HttpServletResponse response,
                                 ModelMap map,
                                 Works works,
                                 Consumer consumer,
                                 @RequestParam(required = false) String createDateString,
                                 @RequestParam(required = false) String worksName,
                                 @RequestParam(required = false) String consumerNo,
                                 @RequestParam(required = false) String worksRemarks,
                                 @RequestParam(required = false) String imgUrls,
                                 @RequestParam(required = false) String draftYN) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        works.setCreateBy(user.getId());
        if (createDateString != null && createDateString.trim().length() > 0) {
            Date createDate = DateUtil.parseDate(createDateString, "yyyy-MM-dd");
            works.setCreateDate(createDate);
        }
        works.setName(worksName);
        works.setRemarks(worksRemarks);
        if ("yes".equals(draftYN)) {
            works.setType(Const.WORKS_STATUS_DRAFT);
        }
        worksService.insert(works);
        consumer.setName(works.getProvideBy());
        consumer.setType("1");
        consumer.setWorksId(works.getId());
        consumer.setNo(consumerNo);
        consumerService.insert(consumer);

        Integer worksId = works.getId();

        if (imgUrls != null && imgUrls.trim().length() > 0) {
            String[] urls = imgUrls.split("\\|");
            for (String url : urls) {
                Images images = new Images();
                images.setTargetId(worksId);
                images.setUrl(url);
                images.setType(Const.IMAGES_WORKS);
                imagesService.insert(images);
            }
        }
        if ("yes".equals(draftYN)) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/pawn2/my/myWorks?showwhich=draft";
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
                                 HttpServletRequest request,
                                 HttpServletResponse response,
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
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
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
        works.setWorksMeanning(worksMeanning);
        if ("yes".equals(draftYN)) {
            works.setType(Const.WORKS_STATUS_DRAFT);
        }
        worksService.updateById(works);
        if ("yes".equals(draftYN)) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/pawn2/my/myWorks?showwhich=draft";
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
                                 HttpServletRequest request,
                                 HttpServletResponse response,
                                 ModelMap map,
                                 WorksLevel worksLevel,
                                 @RequestParam(required = false) String certificateImgUrl,
                                 @RequestParam(required = false) String draftYN) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        int worksId = (int) session.getAttribute("registerWorksId");
        worksLevel.setWorksId(worksId);
        worksLevelService.insert(worksLevel);

        Images images = new Images();
        images.setUrl(certificateImgUrl);
        images.setType(Const.IMAGES_CERTIFICATE);
        images.setTargetId(worksId);

        if ("yes".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setType(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/pawn2/my/myWorks?showwhich=draft";
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
                                 HttpServletRequest request,
                                 HttpServletResponse response,
                                 ModelMap map,
                                 ValueReport valueReport,
                                 @RequestParam(required = false) String draftYN) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }
        Integer worksId = (Integer) session.getAttribute("registerWorksId");
        valueReport.setWorksId(worksId);
        valueReportService.insert(valueReport);

        if ("yes".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setType(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/pawn2/my/myWorks?showwhich=draft";
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
                                        HttpServletRequest request,
                                        HttpServletResponse response,
                                        ModelMap map,
                                        ValueReport valueReport,
                                        @RequestParam(required = false) String draftYN,
                                        Consumer consumer,
                                        @RequestParam(required = false) String dateTimeString) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Integer worksId = (Integer) session.getAttribute("registerWorksId");
        consumer.setWorksId(worksId);
        consumer.setType("2");
        if (dateTimeString != null && dateTimeString.trim().length() > 0) {
            Date datetime = DateUtil.parseDate(dateTimeString, "yyyy-MM-dd");
            consumer.setDatetime(datetime);
        }
        consumerService.insert(consumer);

        if ("yes".equals(draftYN)) {
            Works works = (Works) session.getAttribute("registerWorks");
            works.setType(Const.WORKS_STATUS_DRAFT);
            worksService.updateById(works);
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile/pawn2/my/myWorks?showwhich=draft";
        }

        return "modules/mobile/pawn2/my/myWorks?showwhich=now";
    }

    /**
     * 作品编辑页面
     *
     * @return
     */
    @RequestMapping(value = "worksEdit", method = RequestMethod.GET)
    @OAuthRequired
    public String worksEdit(HttpSession session,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            ModelMap map,
                            @RequestParam int id) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Works works = worksService.selectById(id);

        WorksLevel worksLevel = new WorksLevel();
        worksLevel.setWorksId(id);
        worksLevel = worksLevelService.selectOne(new EntityWrapper<>(worksLevel));

        Consumer consumer = new Consumer();
        consumer.setWorksId(id);
        consumer = consumerService.selectOne(new EntityWrapper<>(consumer));

        Images images = new Images();
        images.setTargetId(id);
        images.setType(Const.IMAGES_WORKS);
        List<Images> imagesList = imagesService.selectList(new EntityWrapper<>(images));

        images.setType(Const.IMAGES_CERTIFICATE);
        Images certificateImg = imagesService.selectOne(new EntityWrapper<>(images));

        map.put("works", works);
        map.put("consumer", consumer);
        map.put("worksLevel", worksLevel);
        map.put("imagesList", imagesList);
        map.put("certificateImg", certificateImg);

        session.setAttribute("worksIdInSession", id);

        return "modules/mobile/pawn2/worksEdit";
    }

    /**
     * 作品编辑页面
     *
     * @return
     */
    @RequestMapping(value = "worksEditComplete", method = RequestMethod.POST)
    @OAuthRequired
    public String worksEditComplete(HttpSession session,
                                    HttpServletRequest request,
                                    HttpServletResponse response,
                                    ModelMap map,
                                    Works works,
                                    WorksLevel worksLevel,
                                    Consumer consumer,
                                    @RequestParam(required = false) String worksName,
                                    @RequestParam(required = false) String worksRemarks,
                                    @RequestParam(required = false) String consumerNo) {
        WxMpUser wxMpUser = (WxMpUser) session.getAttribute("wxMpUser");
        String openId = wxMpUser.getOpenId();
        User u = new User();
        u.setOpenId(openId);
        User user = userService.selectOne(u);
        if (user == null) {
            return "redirect:" + configStorage.getOauth2redirectUri() + "/mobile";
        }

        Integer id = (Integer) session.getAttribute("worksIdInSession");

        works.setId(id);
        works.setName(worksName);
        works.setRemarks(worksRemarks);
        works.setStatus(Const.WORKS_STATUS_COMMIT);
        consumer.setNo(consumerNo);
        consumer.setName(works.getProvideBy());
        consumer.setType("1");
        consumer.setWorksId(id);
        worksLevel.setWorksId(id);

        WorksLevel wl = new WorksLevel();
        wl.setWorksId(id);
        wl = worksLevelService.selectOne(new EntityWrapper<>(wl));
        worksLevel.setId(wl.getId());

        Consumer cs = new Consumer();
        cs.setWorksId(id);
        cs = consumerService.selectOne(new EntityWrapper<>(cs));
        consumer.setId(cs.getId());

        worksService.updateById(works);
        worksLevelService.updateById(worksLevel);
        consumerService.updateById(consumer);


        return "modules/mobile/pawn2/my";
    }

}

