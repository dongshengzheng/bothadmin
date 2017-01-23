package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.*;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.DateUtil;
import com.fish.idle.service.util.StringUtils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by szy on 29/11/2016.
 * 用户
 */

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

    @Autowired
    private IAreaService areaService;

    @Autowired
    private IScoreHistoryService scoreHistoryService;

    @Autowired
    private IWorksService worksService;

    @Autowired
    private IDictService dictService;

    @Autowired
    private IAppUserService userService;

    @Autowired
    private IImagesService imagesService;

    @Autowired
    private ITransferHistoryService transferHistoryService;

    @Autowired
    private IFollowHistoryService followHistoryService;

    @Autowired
    private IAppUserService appUserService;

    /**
     * 用户详情
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String dash() {
        return "user/user";
    }

    /**
     * 我的作品
     * 草稿 审核中 未通过 已通过
     *
     * @return
     */
    @RequestMapping(value = "works", method = RequestMethod.GET)
    public String works(ModelMap map) {
        map.put("type","0");
        return "user/user_works";
    }

    /**
     * 我的作品/审核中或者草稿
     * 草稿 审核中 未通过 已通过
     *
     * @return
     */
    @RequestMapping(value = "works/{type}", method = RequestMethod.GET)
    public String worksHap(@PathVariable String type, ModelMap map) {
        map.put("type",type);
        return "user/user_works";
    }

    //我的作品加载更多
    @RequestMapping(value = "works_load/{type}", method = RequestMethod.GET)
    @ResponseBody
    public Page<Works> worksLoad(@PathVariable String type, @RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                                 @RequestParam(required = false, defaultValue = "6") Integer pageSize, ModelMap map) {
        Page<Works> page = new Page<>(pageIndex, pageSize);
        Page<Works> worksPage = worksService.selectPage(page, getMyWorksEw(type));
        for (Works work : worksPage.getRecords()) {
            //品种
            if (StringUtils.isNotEmpty(work.getBreed())) {
                work.setBreed(dictService.getLabelByValue(work.getBreed(), "dd_pinzhong"));
            }
            Images images = imagesService.selectOne(new EntityWrapper<>(new Images(work.getId(), Const.IMAGES_WORKS)));
            if (images != null && !StringUtils.isEmpty(images.getUrl())) {
                work.setImages(images.getUrl());
            }
        }
        map.put("worksTransferPassPage", worksPage);
        return worksPage;
    }


    /**
     * 转让作品
     *
     * @return
     */
    @RequestMapping(value = "transfer", method = RequestMethod.GET)
    public String transfer(ModelMap map) {
        return "user/user_works_transfer";
    }


    /**
     * 转让作品列表
     *
     * @param status    状态--  1：转入转出已完成  2：正在进行
     * @param in        是否是转入  参数传 true/false  比如：transfer_load/false/1
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "transfer_load/{in}/{status}", method = RequestMethod.GET)
    @ResponseBody
    public Page<TransferHistory> transferLoad(@PathVariable Integer status,
                                              @PathVariable Boolean in,
                                              @RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                                              @RequestParam(required = false, defaultValue = "6") Integer pageSize) {
        Page<TransferHistory> page = new Page<>(pageIndex, pageSize);
        Integer userId = getCurrentUser().getId();
        EntityWrapper<TransferHistory> ew = new EntityWrapper<>(new TransferHistory());

        ew.addFilter("status = {0} ", status);
        if (in) {
            ew.addFilter("to_user_id = {0}", userId);
        } else {
            ew.addFilter("from_user_id = {0}", userId);
        }
        Page<TransferHistory> transferHistoryPage = transferHistoryService.selectPage(page, ew);
        for (TransferHistory t : transferHistoryPage.getRecords()) {
            Works works = new Works();
            works.setId(t.getWorksId());
            works = worksService.selectOne(works);
            Images images = imagesService.selectOne(new EntityWrapper<>(new Images(works.getId(), Const.IMAGES_WORKS)));
            if (images != null && !StringUtils.isEmpty(images.getUrl())) {
                works.setImages(images.getUrl());
            }
            if (StringUtils.isNotEmpty(works.getBreed())) {
                works.setBreed(dictService.getLabelByValue(works.getBreed(), "dd_pinzhong"));
            }
            t.setWorks(works);
        }
        return transferHistoryPage;
    }


    /**
     * 收藏作品
     *
     * @return
     */
    @RequestMapping(value = "collect", method = RequestMethod.GET)
    public String collect() {
        return "user/user_works_collect";
    }

    @RequestMapping(value = "collect_load", method = RequestMethod.GET)
    @ResponseBody
    public Page<FollowHistory> loadCollect(@RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                                           @RequestParam(required = false, defaultValue = "6") Integer pageSize) {

        Page<FollowHistory> page = new Page<>(pageIndex, pageSize);
        EntityWrapper<FollowHistory> ew = new EntityWrapper<>(new FollowHistory());
        ew.setSqlSelect("target_id");
        ew.addFilter("type = 0 and user_id = {0}", getCurrentUser().getId());
        Page<FollowHistory> followHistoryPage = followHistoryService.selectPage(page, ew);
        for (FollowHistory f : followHistoryPage.getRecords()) {
            Works works = new Works();
            works.setId(f.getTargetId());
            works = worksService.selectOne(works);
            Images images = imagesService.selectOne(new EntityWrapper<>(new Images(works.getId(), Const.IMAGES_WORKS)));
            if (images != null && !StringUtils.isEmpty(images.getUrl())) {
                works.setImages(images.getUrl());
            }
            if (StringUtils.isNotEmpty(works.getBreed())) {
                works.setBreed(dictService.getLabelByValue(works.getBreed(), "dd_pinzhong"));
            }
            f.setWorks(works);
        }
        return followHistoryPage;
    }

    /**
     * 关注用户
     *
     * @return
     */
    @RequestMapping(value = "follow", method = RequestMethod.GET)
    public String follow() {
        return "user/user_follow";
    }

    @RequestMapping(value = "follow_load", method = RequestMethod.GET)
    @ResponseBody
    public Page<FollowHistory> loadFollow(@RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                                          @RequestParam(required = false, defaultValue = "6") Integer pageSize) {
        Page<FollowHistory> page = new Page<>(pageIndex, pageSize);
        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(getCurrentUser().getId());
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_FOCUS);
        EntityWrapper<FollowHistory> ew = new EntityWrapper<>(followHistory);
        Page<FollowHistory> followHistoryPage = followHistoryService.selectPage(page, ew);
        for (FollowHistory f : followHistoryPage.getRecords()) {
            AppUser user = new AppUser();
            user.setId(f.getTargetId());
            user = userService.selectOne(user);
            EntityWrapper<FollowHistory> followEw = new EntityWrapper<>(new FollowHistory());
            followEw.addFilter("type = 1 and target_id = {0}", user.getId());
            user.setFollowCount(followHistoryService.selectCount(followEw));
            EntityWrapper<Works> worksEw = new EntityWrapper<>(new Works());
            worksEw.addFilter("create_by={0}", user.getId());
            user.setWorksCount(worksService.selectCount(worksEw));
            f.setAppUser(user);
        }
        return followHistoryPage;
    }

    /**
     * 积分中心
     *
     * @return
     */
    @RequestMapping(value = "integral", method = RequestMethod.GET)
    public String integral() {
        return "user/user_integral";
    }

    /**
     * @return
     */
    @RequestMapping(value = "integral_load", method = RequestMethod.GET)
    @ResponseBody
    public List<ScoreHistory> loadIntegral() {
        EntityWrapper<ScoreHistory> ew = new EntityWrapper<>(new ScoreHistory());
        ew.setSqlSelect("value,update_date,from_user_id,to_user_id,type");
        ew.addFilter("from_user_id = {0} or to_user_id = {0}", getCurrentUser().getId());
        ew.orderBy("update_date", false);
        List<ScoreHistory> scoreHistoryList = scoreHistoryService.selectList(ew);
        for (ScoreHistory s : scoreHistoryList) {
            if (s.getType() != null && s.getType().trim().length() > 0) {
                s.setType(dictService.getLabelByValue(s.getType(), "score_type"));
            }
        }
        return scoreHistoryList;
    }


    /**
     * 个人设置
     *
     * @return
     */
    @RequestMapping(value = "settings", method = RequestMethod.GET)
    public String settings(ModelMap map) {
        AppUser appUser = getCurrentUser();
        List<Dict> list = getWorksLevelDicByType("dd_preference");
        map.put("preference", list);
        map.put("user", appUser);
        map.put("pre", appUser.getPrefer() != null ? appUser.getPrefer().split(",") : new String[0]);
        return "user/user_settings";
    }


    /**
     * 用户详情
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(ModelMap map, @RequestParam(required = false) int userId) {
        AppUser appUser = appUserService.siteByIdContainWorksFocusCount(userId);
        map.put("appUser", appUser);
        return "user/user_detail";
    }

    /**
     * 用户详情:Ta的资料
     *
     * @return
     */
    @RequestMapping(value = "/detail/info", method = RequestMethod.GET)
    public String detailInfo(ModelMap map, @RequestParam(required = false) int userId) {
        AppUser appUser = appUserService.siteByIdContainWorksFocusCount(userId);
        String identification = appUser.getIdentification();
        if (identification != null && identification.length() > 8) {
            identification = identification.substring(0, 4) + "**********" + identification.substring(identification.length() - 4);
        }
        appUser.setIdentification(identification);
        map.put("appUser", appUser);
        List<Dict> list = getWorksLevelDicByType("dd_preference");
        map.put("preference", list);
        map.put("pre", appUser.getPrefer() != null ? appUser.getPrefer().split(",") : new String[0]);
        return "user/user_detail_info";
    }

    /**
     * 用户详情:Ta的作品
     *
     * @return
     */
    @RequestMapping(value = "/detail/works", method = RequestMethod.GET)
    public String detailWorks(ModelMap map, @RequestParam(required = false) int userId) {
        AppUser appUser = appUserService.siteByIdContainWorksFocusCount(userId);
        map.put("appUser", appUser);
        return "user/user_detail_works";
    }

    /**
     * 用户详情:Ta的作品 load
     *
     * @return
     */
    @RequestMapping(value = "/detail/works_load", method = RequestMethod.GET)
    @ResponseBody
    public Page<Works> detailWorksLoad(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                                       @RequestParam(required = false, defaultValue = "6") Integer pageSize,
                                       @RequestParam(required = false) Integer userId) {

        Page<Works> page = new Page<>(pageIndex, pageSize);
        Works works = new Works();
        works.setCreateBy(userId);
        works.setStatus(Const.WORKS_STATUS_PASS);
        EntityWrapper<Works> ew = new EntityWrapper<>(works);
        Page<Works> worksPage = worksService.selectPage(page, ew);
        for (Works work : worksPage.getRecords()) {
            //品种
            if (StringUtils.isNotEmpty(work.getBreed())) {
                work.setBreed(dictService.getLabelByValue(work.getBreed(), "dd_pinzhong"));
            }
            Images images = imagesService.selectOne(new EntityWrapper<>(new Images(work.getId(), Const.IMAGES_WORKS)));
            if (images != null && !StringUtils.isEmpty(images.getUrl())) {
                work.setImages(images.getUrl());
            }
        }
        return worksPage;
    }

    /**
     * 用户详情:Ta的粉丝
     *
     * @return
     */
    @RequestMapping(value = "/detail/fans", method = RequestMethod.GET)
    public String detailFans(ModelMap map, @RequestParam(required = false) int userId) {
        AppUser appUser = appUserService.siteByIdContainWorksFocusCount(userId);
        map.put("appUser", appUser);
        return "user/user_detail_fans";
    }

    /**
     * 用户详情:Ta的粉丝 load
     *
     * @return
     */
    @RequestMapping(value = "/detail/fans_load", method = RequestMethod.GET)
    @ResponseBody
    public List<AppUser> detailFansLoad(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                                        @RequestParam(required = false, defaultValue = "6") Integer pageSize,
                                        @RequestParam(required = false) Integer userId) {
        List<AppUser> focusList = appUserService.siteSearchFansByUserId(userId, pageSize, (pageIndex - 1) * pageSize, getCurrentUser().getId());
        return focusList;
    }

    /**
     * 搜索用户结果
     *
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(required = false) String keywords,
                         ModelMap map) {

        return "search/search_user_result";
    }

    /**
     * 搜索用户分页
     *
     * @return
     */
    @RequestMapping(value = "/userPage", method = RequestMethod.POST)
    @ResponseBody
    public List<AppUser> userPage(@RequestParam(required = false, defaultValue = "1") Integer pageIndex,
                                  @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                  @RequestParam(required = false) String keywords) {
        List<AppUser> appUserList = appUserService.siteSearchUsersByName(keywords, pageSize, (pageIndex - 1) * pageSize, getCurrentUser().getId());
        return appUserList;
    }

    /**
     * 未关注--关注
     *
     * @return
     */
    @RequestMapping(value = "/notToHave", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String notToHave(HttpSession session,
                            @RequestParam(required = false) int targetId) {
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

            //用户被关注时增加积分(第一次被该用户关注)
            Integer detailScore = dictService.getPointsByValue(Const.SCORE_BE_FOCUSED, "score_type");
            scoreHistoryService.saveScoreHistory(null, targetId, detailScore, Const.SCORE_BE_FOCUSED, currentUser.getId(), currentUser.getId());

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
    public String haveToNot(@RequestParam(required = false) int targetId) {
        AppUser appUser = getCurrentUser();
        FollowHistory followHistory = new FollowHistory();
        followHistory.setUserId(appUser.getId());
        followHistory.setTargetId(targetId);
        followHistory.setType(Const.FOLLOW_HISTORY_TYPE_FOCUS);
        FollowHistory fh = followHistoryService.selectOne(new EntityWrapper<>(followHistory));
        followHistory.setDelFlag(null);
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
     * 用户中心
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/center", method = RequestMethod.GET)
    public String center(HttpServletRequest request, ModelMap map) {
//        获取所有的省份
        map.addAttribute("provinceList", areaService.getAllProvince());
        return "user/user_center";
        //我的作品


        //获取积分列表


    }


    @RequestMapping(value = "/header", method = RequestMethod.POST)
    @ResponseBody
    public Boolean updateHeader(String headerUrl) {
        Integer userId = getCurrentUser().getId();
        AppUser appUser = new AppUser(userId, headerUrl);
        getCurrentUser().setHeadImgUrl(headerUrl);
        return userService.updateSelectiveById(appUser);
    }


    /**
     * 根据省份获取城市
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/getCityByProvinceId/{id}")
    @ResponseBody
    public Map<String, Object> getCityByProvinceId(@PathVariable("id") String id) {
        List<City> cityList = areaService.getCityByProvinceId(id);
        Map<String, Object> map = new HashMap<String, Object>();
        if (cityList != null) {
            map.put("msg", "success");
            map.put("status", true);
            map.put("cityList", cityList);
            return map;
        } else {
            map.put("msg", "fail");
            map.put("status", false);
            return map;
        }
    }

    //更新个人资料
    @RequestMapping(value = "/updateUserInfo/{type}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUserInfo(@PathVariable Integer type, AppUser user, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        AppUser appUser = getCurrentUser();
        if (type == 1) {
            appUser.setName(user.getName());
            appUser.setPub(user.getPub());
            appUser.setAddress(user.getAddress());
            appUser.setIdentification(user.getIdentification());
            appUser.setEmail(user.getEmail());
            appUser.setPrefer(user.getPrefer());
            appUser.setPhone(user.getPhone());
        } else if (type == 2) {
            String loginName = request.getParameter("loginName");
            String password = request.getParameter("password");
            String confirmPwd = request.getParameter("passwordConfirm");
            if (StringUtils.isEmpty(loginName)) {
                map.put("suc", false);
                map.put("msg", "请填写登录名");
                return map;
            }
            if (StringUtils.isEmpty(password) || StringUtils.isEmpty(confirmPwd)) {
                map.put("suc", false);
                map.put("msg", "请填写密码");
                return map;
            }
            if (confirmPwd.compareTo(password) != 0) {
                map.put("suc", false);
                map.put("msg", "密码不一致");
                return map;
            }
            if (userService.isNameExist(user.getLoginName())) {
                map.put("suc", false);
                map.put("msg", "用户名重复，请修改");
                return map;
            }
            appUser.setLoginName(loginName);
            String passwd = new SimpleHash("SHA-1", loginName, password).toString(); // 密码加密
            appUser.setPassword(passwd);
        }
        boolean res = userService.updateById(appUser);
        if (res) {
            map.put("suc", true);
        } else {
            map.put("suc", false);
            map.put("msg", "更新失败");
        }
        return map;
    }


    @RequestMapping(value = "/getCollectPage", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCollectPage(@RequestParam(required = false) Integer currentPage
            , @RequestParam(required = false) Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("suc", false);
        map.put("msg", "todo");
        return map;
    }


    //取消收藏
    @RequestMapping(value = "/cancelCollect", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> cancelCollect(HttpServletRequest request, @RequestParam(required = true) Integer worksId) {
        Map<String, Object> map = new HashMap<>();

        Works works = worksService.selectById(worksId);
        if (null != works) {
            works.setStatus("1");
            worksService.updateById(works);
            map.put("success", true);
        } else {
            map.put("success", false);
            map.put("errMsg", "todo");
        }
        return map;
    }

    //    获取作品登记字典表
    private List<Dict> getWorksLevelDicByType(String type) {
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.addFilter("type={0}", type);
        List<Dict> list = dictService.selectList(entityWrapper);
        return list;
    }

    private EntityWrapper<Works> getMyWorksEw(String status) {
        AppUser user = getCurrentUser();
        Works works = new Works();
        EntityWrapper<Works> ew = new EntityWrapper<>(works);
        ew.setSqlSelect("id,name,type,remarks,breed");
        ew.orderBy("id", false);
        ew.where("status = " + status);
        ew.where("create_by = " + user.getId());
        return ew;
    }


}
