package com.fish.idle.site.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.fish.idle.service.modules.jsdd.entity.Images;
import com.fish.idle.service.modules.jsdd.entity.Interpretation;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.service.IImagesService;
import com.fish.idle.service.modules.jsdd.service.IInterpretationService;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.service.IAppUserService;
import com.fish.idle.service.modules.sys.service.impl.AppUserServiceImpl;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Interpretation 控制层
 */
@Controller
@RequestMapping(value = "/interpretation")
public class InterpretationController extends BaseController {

    @Autowired
    private IInterpretationService interpretationService;

    @Autowired
    private IImagesService imagesService;

    @Autowired
    private IAppUserService appUserService;

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Page<Interpretation> list(@RequestParam(required = false, defaultValue = "0") Integer pageIndex,
                                     @RequestParam(required = false, defaultValue = "6") Integer pageSize,
                                     Interpretation interpretation) {
        Page<Interpretation> page = new Page<>(pageIndex, pageSize);

        EntityWrapper<Interpretation> ew = new EntityWrapper<>(interpretation);
        ew.orderBy("id", false);
        Page<Interpretation> interpretationPage = interpretationService.selectPage(page, ew);
        for (Interpretation inter : interpretationPage.getRecords()) {

            List<Images> images = imagesService.selectList(new EntityWrapper<>(new Images(inter.getId(), Const.IMAGES_INTERPRETATION)));

            inter.setImagesList(images);

            AppUser appUser = appUserService.selectById(inter.getUserId());
            inter.setAppUser(appUser);
        }
        return interpretationPage;
    }

    /**
     * 新增诠释
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Boolean saveInterpretation(Interpretation interpretation) {
        interpretation.setUserId(getCurrentUser().getId());
        wrapInsertEntity(interpretation);


        Boolean result = interpretationService.insert(interpretation);
        if (result) {
            // 保存评估报告
            imagesService.insertImage(interpretation.getPicture(), interpretation.getId(), Const.IMAGES_INTERPRETATION);
        }

        return result;
    }
}