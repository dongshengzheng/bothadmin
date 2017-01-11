package com.fish.idle.service.modules.jsdd.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.mapper.AppUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.ScoreHistoryMapper;
import com.fish.idle.service.modules.jsdd.entity.ScoreHistory;
import com.fish.idle.service.modules.jsdd.service.IScoreHistoryService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.Date;

/**
 * ScoreHistory 表数据服务层接口实现类
 */
@Service
public class ScoreHistoryServiceImpl extends SuperServiceImpl<ScoreHistoryMapper, ScoreHistory> implements IScoreHistoryService {
    @Autowired
    AppUserMapper appUserMapper;

    @Autowired
    ScoreHistoryMapper scoreHistoryMapper;

    @Override
    public JSONObject saveScoreHistory(Integer fromUserId, Integer toUserId, int detailScore, String scoreType, Integer createBy, Integer updateBy) {
        JSONObject jsonObject = new JSONObject();
        if (fromUserId != null) {
            AppUser fromUser = appUserMapper.selectById(fromUserId);
            int fromUserScore = fromUser.getScore();
            if (fromUserScore < detailScore) {
                jsonObject.put("suc", false);
                jsonObject.put("msg", "积分不足");
                return jsonObject;
            }
            fromUser.setScore(fromUserScore - detailScore);
            appUserMapper.updateById(fromUser);
        }
        if (toUserId != null) {
            AppUser toUser = appUserMapper.selectById(toUserId);
            toUser.setScore(toUser.getScore() + detailScore);
            appUserMapper.updateById(toUser);
        }
        ScoreHistory scoreHistory = new ScoreHistory(fromUserId, toUserId, detailScore, scoreType, new Date(), new Date(), createBy, updateBy);
        scoreHistoryMapper.insert(scoreHistory);
        jsonObject.put("suc", true);
        return jsonObject;
    }
}