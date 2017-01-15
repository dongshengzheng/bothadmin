package com.fish.idle.weixin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fish.idle.service.modules.jsdd.entity.ScoreHistory;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by lenovo on 2017/1/15.
 */
@Controller
@RequestMapping(value = "/mobile")
public class MobileUserController extends BaseController {
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
        List<Dict> list = getWorksLevelDicByType("dd_preference");
        map.put("preference", list);
        map.put("appUser", currentUser);
        map.put("prefer", currentUser.getPrefer() != null ? currentUser.getPrefer().split(",") : new String[0]);
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
     * 加载积分明细
     *
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


    //    获取作品登记字典表
    private List<Dict> getWorksLevelDicByType(String type) {
        EntityWrapper entityWrapper = new EntityWrapper();
        entityWrapper.addFilter("type={0}", type);
        List<Dict> list = dictService.selectList(entityWrapper);
        return list;
    }
}
