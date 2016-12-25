package com.fish.idle.site.web;

import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IWorksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by sunhan on 24/12/2016.
 */
@Controller
@RequestMapping("/wizard.htm")
@SessionAttributes("works")
public class TestWizardController{

    @Autowired
    private IWorksService worksService;


    /**
     * The default handler (page=0)
     */
    @RequestMapping
    public String getInitialPage(final ModelMap modelMap) {
        // put your initial works
        modelMap.addAttribute("works", new Works());
        return "initialView";
    }

    /**
     * First step handler (if you want to map each step individually to a method). You should probably either use this
     * approach or the one below (mapping all pages to the same method and getting the page number as parameter).
     */
    @RequestMapping(params = "_step=1")
    public String processFirstStep(final @ModelAttribute("works") Works works,
                                   final Errors errors) {
        // do something with works, errors, request, response,
        // model map or whatever you include among the method
        // parameters. See the documentation for @RequestMapping
        // to get the full picture.
        return "firstStepView";
    }

    /**
     * Maybe you want to be provided with the _page parameter (in order to map the same method for all), as you have in
     * AbstractWizardFormController.
     */
    @RequestMapping(method = RequestMethod.POST)
    public String processPage(@RequestParam("_page") final int currentPage,
                              final @ModelAttribute("works") Works works,
                              final HttpServletResponse response) {
        // do something based on page number
        return "";
    }

    /**
     * The successful finish step ('_finish' request param must be present)
     */
    @RequestMapping(params = "_finish")
    public String processFinish(final @ModelAttribute("works") Works works,
                                final Errors errors,
                                final ModelMap modelMap,
                                final SessionStatus status) {
        // some stuff
        status.setComplete();
        return "successView";
    }

    @RequestMapping(params = "_cancel")
    public String processCancel(final HttpServletRequest request,
                                final HttpServletResponse response,
                                final SessionStatus status) {
        status.setComplete();
        return "canceledView";
    }
}