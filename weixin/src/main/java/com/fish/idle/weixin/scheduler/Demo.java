package com.fish.idle.weixin.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author Sun.Han
 * @version 1.0
 * @Description:
 * @Date 2016年11月12日
 */
@Component
public class Demo {

    @Scheduled(fixedDelay = 1000)
    void run() {
        System.out.println("a");
    }
}
