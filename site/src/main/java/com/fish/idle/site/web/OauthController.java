package com.fish.idle.site.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * Created by szy on 06/12/2016.
 */
@Controller
@RequestMapping("")
public class OauthController {

    @RequestMapping("/oauthLogin")
    public void oauthLogin(HttpServletRequest request){

        System.out.print(request);
        System.out.print("wx-----login");

//        return "index";
    }


}
