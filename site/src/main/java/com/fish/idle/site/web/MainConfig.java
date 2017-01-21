package com.fish.idle.site.web;

import me.chanjar.weixin.mp.api.WxMpConfigStorage;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.WxMpTemplateMsgService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import me.chanjar.weixin.mp.api.impl.WxMpTemplateMsgServiceImpl;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by FirenzesEagle on 2016/5/30 0030.
 * Email:liumingbo2008@gmail.com
 *
 * @author FirenzesEagle
 * @author BinaryWang
 */
@Configuration
public class MainConfig {

    @Bean
    public WxMpConfigStorage wxMpConfigStorage() {
        WxMpInMemoryConfigStorage configStorage = new WxMpInMemoryConfigStorage();
        configStorage.setAppId("wx91ad0b554aceca98");
        configStorage.setSecret("9fbc68385d729ffd298bff89794a232c");
        configStorage.setOauth2redirectUri("www.mschuangyi.com");
        return configStorage;
    }

//    @Value("${appid}")
//    private String appid;
//
//    @Value("${appsecret}")
//    private String appsecret;
//
//    @Value("${token}")
//    private String token;
//
//    @Value("${aeskey}")
//    private String aesKey;
//
//    @Value("${partener_id}")
//    private String partenerId;
//
//    @Value("${partener_key}")
//    private String partenerKey;
//
//    @Value("${redirect_url}")
//    private String url;
//
//    @Bean
//    public WxMpConfigStorage wxMpConfigStorage() {
//        WxMpInMemoryConfigStorage configStorage = new WxMpInMemoryConfigStorage();
//        configStorage.setAppId(this.appid);
//        configStorage.setSecret(this.appsecret);
//        configStorage.setToken(this.token);
//        configStorage.setAesKey(this.aesKey);
//        configStorage.setPartnerId(this.partenerId);
//        configStorage.setPartnerKey(this.partenerKey);
//        configStorage.setOauth2redirectUri(this.url);
//        return configStorage;
//    }

    @Bean
    public WxMpService wxMpService() {
        WxMpService wxMpService = new WxMpServiceImpl();
        wxMpService.setWxMpConfigStorage(wxMpConfigStorage());
        return wxMpService;
    }

    @Bean
    public WxMpTemplateMsgService wxMpTemplateMsgService() {
        WxMpTemplateMsgService wxMpTemplateMsgService = new WxMpTemplateMsgServiceImpl(wxMpService());
        return wxMpTemplateMsgService;
    }

}
