/*
 * Copyright(c) 2015 xianyu.com.cn All rights reserved.
 * distributed with this file and available online at
 * http://www.xianyu.com.cn/
 */
package com.fish.idle.admin.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.stereotype.Service;

/**
 * @author tangqian
 * @version 1.0
 */
@Service
public class BeanFactoryUtils implements BeanFactoryAware {

    private static BeanFactory beanFactory;

    public static BeanFactory getFactory() {
        return beanFactory;
    }

    @SuppressWarnings("static-access")
    @Override
    public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
        this.beanFactory = beanFactory;
    }
}
