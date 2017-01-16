package com.fish.idle.weixin.entity;

import com.fish.idle.service.modules.jsdd.entity.Consumer;
import com.fish.idle.service.modules.jsdd.entity.Report;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.entity.WorksLevel;

/**
 * Created by sunhan on 25/12/2016.
 */
public class WorksBo {

    private Works works;

    private Consumer collecter;

    private Consumer provider;

    private Report report;


    public Works getWorks() {
        return works;
    }

    public void setWorks(Works works) {
        this.works = works;
    }

    public Consumer getCollecter() {
        return collecter;
    }

    public void setCollecter(Consumer collecter) {
        this.collecter = collecter;
    }

    public Consumer getProvider() {
        return provider;
    }

    public void setProvider(Consumer provider) {
        this.provider = provider;
    }

    public Report getReport() {
        return report;
    }

    public void setReport(Report report) {
        this.report = report;
    }

}
