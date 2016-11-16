package com.fish.idle.site.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Sun.Han
 * @version 1.0
 * @Description:
 * @Date 2016年11月05日
 */
@Controller
public class DemoController {
    @RequestMapping("/helloWorld")
    public String helloWorld(Model model) {
        String word0 = "Hello ";
        String word1 = "World!";
        //将数据添加到视图数据容器中
        model.addAttribute("word0", word0);
        model.addAttribute("word1", word1);
        return "hello";
    }
}
