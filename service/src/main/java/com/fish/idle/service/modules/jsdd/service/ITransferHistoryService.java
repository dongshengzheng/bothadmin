package com.fish.idle.service.modules.jsdd.service;

import com.alibaba.fastjson.JSONObject;
import com.fish.idle.service.modules.jsdd.entity.TransferHistory;
import com.baomidou.framework.service.ISuperService;

import java.util.List;

/**
 * TransferHistory 表数据服务层接口
 */
public interface ITransferHistoryService extends ISuperService<TransferHistory> {

    //    根据作品id查询转让历史(包含页面显示的用户信息:双方昵称及头像)
    List<TransferHistory> thContainUsersInfo(Integer worksId);

    //根据用户id查找转让历史(含有Works信息),包括转入和转出
    List<TransferHistory> containWorks(Integer userId);

    //完成转让
    JSONObject transferComplete(Integer transferHistoryId);


}