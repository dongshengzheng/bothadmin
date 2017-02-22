package com.fish.idle.service.modules.sys.service.impl;

import com.fish.idle.service.modules.sys.entity.Theme;
import com.fish.idle.service.modules.sys.service.IThemeService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by xhj224 on 2017/2/22.
 */
// @RunWith(SpringJUnit4ClassRunner.class)
// @ContextConfiguration("classpath:spring/spring-mybatis.xml")
public class ThemeServiceImplTest {

    // @Resource
    private IThemeService themeService;

    // @Test
    public void addTheme() {
        Theme theme;
        List<String> themes = new ArrayList<>();
        themes.add("blue.min.css");
        themes.add("darkblue.min.css");
        themes.add("default.min.css");
        themes.add("grey.min.css");
        themes.add("light.min.css");
        themes.add("light2.min.css");
        for (String themeStr : themes) {
            theme = new Theme(themeStr);
            themeService.insert(theme);
        }
    }
}