package com.fish.idle.site.web;

import com.fish.idle.service.modules.jsdd.entity.City;
import com.fish.idle.service.modules.jsdd.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
public class UserController {

    @Autowired
    private IAreaService areaService;

    /**
     * 用户详情
     * @return
     */
    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(){
        return "user/user_detail";
    }

    /**
     * 搜索用户结果
     * @return
     */
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String search(HttpServletRequest request){
        return "search/search_user_result";
    }

    /**
     * 用户中心
     * @param request
     * @return
     */
    @RequestMapping(value = "/center",method = RequestMethod.GET)
    public String center(HttpServletRequest request,ModelMap map){
//        获取所有的省份
        map.addAttribute("provinceList", areaService.getAllProvince());
        return "user/user_center";
    }

    /**
     * 根据省份获取城市
     * @param id
     * @return
     */
    @RequestMapping(value = "/getCityByProvinceId/{id}")
    @ResponseBody
    public Map<String,Object> getCityByProvinceId(@PathVariable("id") String id){
        List<City> cityList = areaService.getCityByProvinceId(id);
        Map<String,Object> map = new HashMap<String,Object>();
        if (cityList!=null){
            map.put("msg","success");
            map.put("status",true);
            map.put("cityList",cityList);
            return map;
        } else {
            map.put("msg","fail");
            map.put("status",false);
            return map;
        }
    }



}
