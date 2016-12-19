package com.fish.idle.site.web;

import com.fish.idle.service.modules.jsdd.entity.City;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IAreaService;
import com.fish.idle.service.modules.jsdd.service.IScoreHistoryService;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUserInfo(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        map.put("success", false);
        map.put("errMsg", "todo");

        return map;
    }


    @RequestMapping(value = "/getCollectPage", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCollectPage(@RequestParam(required = false) Integer currentPage
                                                ,@RequestParam(required = false) Integer pageSize) {
        Map<String, Object> map = new HashMap<>();
        map.put("success", false);
        map.put("errMsg", "todo");
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


}
