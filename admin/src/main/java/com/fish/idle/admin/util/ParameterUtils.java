/*
 * Copyright(c) 2015 xianyu.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.xianyu.com.cn/
 */
package com.fish.idle.admin.util;

import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Sun.Han
 * @version 1.0
 * @Description:请求参数处理类
 */
public class ParameterUtils {

    public static String valueOf(String val) {
        return valueOf(val, null);
    }

    /**
     * @param val
     * @param defualt
     * @return
     * @Description:字符处理，把null替换为默认值
     * @author Sun.Han
     * @date 2015年5月7日
     */
    public static String valueOf(String val, String defualt) {
        if (StringUtils.isBlank(val)) {
            val = defualt != null ? defualt : "";
        }
        return val;
    }

    /**
     * @param paramStr
     * @return
     * @Description:请示参数解析
     * @author Sun.Han
     * @date 2015年5月7日
     */
    public static Map<String, String> analyParam(String paramStr) {
        Map<String, String> paramMap = new HashMap<String, String>();
        String[] paramArray = paramStr.split("&");
        for (String pa : paramArray) {
            String[] param = pa.split("=");
            if (param.length == 2) {
                paramMap.put(param[0], param[1]);
            }
        }
        return paramMap;
    }
}
