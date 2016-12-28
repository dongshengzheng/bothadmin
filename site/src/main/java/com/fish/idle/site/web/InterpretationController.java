package com.fish.idle.site.web;

import com.fish.idle.service.modules.jsdd.entity.Interpretation;
import com.fish.idle.service.modules.jsdd.service.IInterpretationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Interpretation 控制层
 */
@Controller
@RequestMapping(value = "/interpretation")
public class InterpretationController extends BaseController {

    @Autowired
    private IInterpretationService interpretationService;

    /**
     * 新增诠释
     *
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Boolean saveInterpretation(Interpretation interpretation) {
        interpretation.setUserId(getCurrentUser().getId());
        wrapInsertEntity(interpretation);
        return interpretationService.insert(interpretation);
    }
}