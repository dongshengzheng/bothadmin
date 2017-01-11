package com.fish.idle.service.modules.jsdd.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.fish.idle.service.modules.jsdd.entity.ScoreHistory;
import com.fish.idle.service.modules.jsdd.entity.Works;
import com.fish.idle.service.modules.jsdd.mapper.ScoreHistoryMapper;
import com.fish.idle.service.modules.jsdd.mapper.WorksMapper;
import com.fish.idle.service.modules.sys.entity.AppUser;
import com.fish.idle.service.modules.sys.mapper.AppUserMapper;
import com.fish.idle.service.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fish.idle.service.modules.jsdd.mapper.TransferHistoryMapper;
import com.fish.idle.service.modules.jsdd.entity.TransferHistory;
import com.fish.idle.service.modules.jsdd.service.ITransferHistoryService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

import java.util.Date;
import java.util.List;

/**
 * TransferHistory 表数据服务层接口实现类
 */
@Service
public class TransferHistoryServiceImpl extends SuperServiceImpl<TransferHistoryMapper, TransferHistory> implements ITransferHistoryService {
    @Autowired
    TransferHistoryMapper transferHistoryMapper;

    @Autowired
    ScoreHistoryMapper scoreHistoryMapper;

    @Autowired
    AppUserMapper appUserMapper;

    @Autowired
    WorksMapper worksMapper;

    @Override
    public List<TransferHistory> thContainUsersInfo(Integer worksId) {
        return transferHistoryMapper.thContainUsersInfo(worksId);
    }

    @Override
    public List<TransferHistory> containWorks(Integer userId) {
        return transferHistoryMapper.containWorks(userId);
    }

    @Override
    public JSONObject transferComplete(Integer transferHistoryId) {
        JSONObject jsonObject = new JSONObject();
        TransferHistory transferHistory = transferHistoryMapper.selectById(transferHistoryId);

        int minusUserId = transferHistory.getToUserId();
        int plusUserId = transferHistory.getFromUserId();
        AppUser minusUser = appUserMapper.selectById(minusUserId);
        AppUser plusUser = appUserMapper.selectById(plusUserId);

        //判断被转让方积分是否足够
        int detailScore = transferHistory.getScore() != null ? transferHistory.getScore().intValue() : 0;
        int minusUserScore = minusUser.getScore();
        int plusUserScore = plusUser.getScore();
        if (detailScore > minusUserScore) {
            //被转让方积分不足
            jsonObject.put("suc", false);
            jsonObject.put("msg", "您的积分不足,本次转让需要" + detailScore + "积分...");
        } else {
            //被转让放积分足够
            //更新双方积分
            minusUser.setScore(minusUserScore - detailScore);
            plusUser.setScore(plusUserScore + detailScore);
            appUserMapper.updateById(minusUser);
            appUserMapper.updateById(plusUser);
            //插入积分记录
            ScoreHistory scoreHistory = new ScoreHistory(minusUserId, plusUserId, detailScore, Const.SCORE_WORKS_TRANSFER, new Date(), new Date(), minusUserId, minusUserId);
            scoreHistoryMapper.insert(scoreHistory);
            //更新转让历史状态
            transferHistory.setStatus(Const.TRANSFER_STATUS_HAVE);
            transferHistory.setUpdateDate(new Date());
            transferHistoryMapper.updateById(transferHistory);
            //更新作品状态
            Works works = worksMapper.selectById(transferHistory.getWorksId());
            works.setStatus(Const.WORKS_STATUS_PASS);
            worksMapper.updateById(works);
            jsonObject.put("suc", true);
        }
        return jsonObject;
    }
}