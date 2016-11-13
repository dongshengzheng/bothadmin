/*
 *
 * ALL RIGHTS RESERVED.
 *
 * No part of this publication may be reproduced, stored in a retrieval system, or transmitted,
 * on any form or by any means, electronic, mechanical, photocopying, recording, 
 * or otherwise, without the prior written permission of ShenZhen GreatVision Network Technology Co., Ltd.
 *
 * Amendment History:
 * 
 * Date                   By              Description
 * -------------------    -----------     -------------------------------------------
 * Apr 17, 2015    Sun.Han         Create the class
 */

package com.xianyu.manage.base.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName MyExceptionResolver.java
 * @Description:
 * @Date Apr 17, 2015
 */
public class MyExceptionResolver implements HandlerExceptionResolver {

    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        System.out.println("==============异常开始=============");// TODO: 切换到logger
        ex.printStackTrace();
        System.out.println("==============异常结束=============");
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("exception", ex.toString().replaceAll("\n", "<br/>"));// TODO:release的时候，注释掉（不用暴露具体错误信息给用户）
        return mv;
    }

}
