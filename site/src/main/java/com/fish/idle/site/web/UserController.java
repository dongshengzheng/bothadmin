package com.fish.idle.site.web;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.City;
import com.fish.idle.service.modules.jsdd.entity.Images;
import com.fish.idle.service.modules.jsdd.entity.TransferHistory;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.*;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.IDictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
     * @return
     */
    @RequestMapping(value = "works", method = RequestMethod.GET)
    public String works() {
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
            Images images = imagesService.selectOne(new EntityWrapper<>(new Images(work.getId(), Const.IMAGES_WORKS)));
            if(images != null && !StringUtils.isEmpty(images.getUrl())){
                work.setImages(images.getUrl());
            }
        }
        map.put("worksTransferPassPage",worksPage);
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
     * @param status    状态--  1：转入转出已完成  2：正在进行
     * @param in 是否是转入
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
        ew.setSqlSelect("works_id");

        ew.addFilter("status = {0} ",status,userId);
        if(in){
            ew.addFilter("to_user_id = {1}",userId);
        }else {
            ew.addFilter("from_user_id = {1}",userId);
        }
        Page<TransferHistory> transferHistoryPage = transferHistoryService.selectPage(page,ew);
        for (TransferHistory t:transferHistoryPage.getRecords()){
            Works works = new Works();
            works.setId(t.getWorksId());
            works = worksService.selectOne(works);
            Images images = imagesService.selectOne(new EntityWrapper<>(new Images(works.getId(), Const.IMAGES_WORKS)));
            if(images != null && !StringUtils.isEmpty(images.getUrl())){
                works.setImages(images.getUrl());
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

    /**
     * 关注用户
     *
     * @return
     */
    @RequestMapping(value = "follow", method = RequestMethod.GET)
    public String follow() {
        return "user/user_follow";
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
     * 个人设置
     *
     * @return
     */
    @RequestMapping(value = "settings", method = RequestMethod.GET)
    public String settings(ModelMap map) {
        AppUser appUser = getCurrentUser();
        List<Dict> list = getWorksLevelDicByType("dd_preference");
        map.put("preference", list);
        map.put("user",appUser);
        map.put("pre",appUser.getPrefer() != null ? appUser.getPrefer().split(","):new String[0]);
        return "user/user_settings";
    }


    /**
     * 用户详情
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail() {
        return "user/user_detail";
    }

    /**
     * 搜索用户结果
     *
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(HttpServletRequest request) {
        return "search/search_user_result";
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
        if(type == 1){
            appUser.setName(user.getName());
            appUser.setPub(user.getPub());
            appUser.setAddress(user.getAddress());
            appUser.setIdentification(user.getIdentification());
            appUser.setEmail(user.getEmail());
            appUser.setPrefer(user.getPrefer());
            appUser.setPhone(user.getPhone());
        }else if(type == 2){
            String loginName = request.getParameter("loginName");
            String password = request.getParameter("password");
            String confirmPwd = request.getParameter("passwordConfirm");
            if(StringUtils.isEmpty(loginName)){
                map.put("suc",false);
                map.put("msg","请填写登录名");
                return map;
            }
            if(StringUtils.isEmpty(password)|| StringUtils.isEmpty(confirmPwd)){
                map.put("suc",false);
                map.put("msg","请填写密码");
                return map;
            }
            if(confirmPwd.compareTo(password) != 0){
                map.put("suc",false);
                map.put("msg","密码不一致");
                return map;
            }
            if(userService.isNameExist(user.getLoginName())){
                map.put("suc",false);
                map.put("msg","用户名重复，请修改");
                return map;
            }
            appUser.setLoginName(loginName);
            String passwd = new SimpleHash("SHA-1", loginName, password).toString(); // 密码加密
            appUser.setPassword(passwd);
        }
        boolean res = userService.updateById(appUser);
        if(res){
            map.put("suc",true);
        }else {
            map.put("suc",false);
            map.put("msg","更新失败");
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

    private EntityWrapper<Works> getMyWorksEw(String status){
        AppUser user = getCurrentUser();
        Works works = new Works();
        EntityWrapper<Works> ew = new EntityWrapper<>(works);
        ew.setSqlSelect("name,type,remarks");
        ew.orderBy("id", false);
        ew.where("status = " + status);
        ew.where("create_by = " + user.getId());
        return ew;
    }


}
