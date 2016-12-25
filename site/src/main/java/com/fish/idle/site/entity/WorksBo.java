package com.fish.idle.site.entity;

import com.fish.idle.service.modules.jsdd.entity.Consumer;
import com.fish.idle.service.modules.jsdd.entity.Report;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.entity.WorksLevel;

/**
 * Created by sunhan on 25/12/2016.
 */
public class WorksBo {

    private Works works;

    private Consumer collect;

    private Consumer provider;

    private Report report;

    private WorksLevel level;

    private String worksImages;

    private String certifyImage;

    private String desImage;


    public Works getWorks() {
        return works;
    }

    public void setWorks(Works works) {
        this.works = works;
    }

    public Consumer getCollect() {
        return collect;
    }

    public void setCollect(Consumer collect) {
        this.collect = collect;
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

    public WorksLevel getLevel() {
        return level;
    }

    public void setLevel(WorksLevel level) {
        this.level = level;
    }

    public String getWorksImages() {
        return worksImages;
    }

    public void setWorksImages(String worksImages) {
        this.worksImages = worksImages;
    }

    public String getCertifyImage() {
        return certifyImage;
    }

    public void setCertifyImage(String certifyImage) {
        this.certifyImage = certifyImage;
    }

    public String getDesImage() {
        return desImage;
    }

    public void setDesImage(String desImage) {
        this.desImage = desImage;
    }
}
