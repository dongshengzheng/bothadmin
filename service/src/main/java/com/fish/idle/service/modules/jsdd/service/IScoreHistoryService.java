package com.fish.idle.service.modules.jsdd.service;

import com.alibaba.fastjson.JSONObject;
import com.fish.idle.service.modules.jsdd.entity.ScoreHistory;
import com.baomidou.framework.service.ISuperService;

/**
 * ScoreHistory 表数据服务层接口
 */
public interface IScoreHistoryService extends ISuperService<ScoreHistory> {

    //积分历史插入数据
    JSONObject saveScoreHistory(Integer fromUserId, Integer toUserId, int detailScore, String scoreType, Integer createBy, Integer updateBy);


}