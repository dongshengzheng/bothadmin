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
//        TransferHistory transferHistory = transferHistoryMapper.selectById(transferHistoryId);
//        transferHistory.setStatus(Const.TRANSFER_STATUS_HAVE);
//        transferHistory.setUpdateDate(new Date());
//        boolean result1 = transferHistoryService.updateById(transferHistory);
//
//        Works works = worksService.selectById(transferHistory.getWorksId());
//        works.setStatus(Const.WORKS_STATUS_PASS);
//        boolean result2 = worksService.updateById(works);
//
//
//        int minusUserId = transferHistory.getToUserId();
//        int plusUserId = transferHistory.getFromUserId();
//        AppUser minusUser = getCurrentUser();
//        AppUser plusUser = appUserService.selectById(plusUserId);
//
//        //转让完成  添加积分历史
//        //1.判断被转让方积分是否足够
//        int detailScore = transferHistory.getScore() != null ? transferHistory.getScore().intValue() : 0;
//        Integer minusUserScore = minusUser.getScore() != null ? minusUser.getScore() : 0;
//
//        Integer plusUserScore = plusUser.getScore() != null ? plusUser.getScore() : 0;
//        minusUser.setScore(minusUserScore - detailScore);
//        plusUser.setScore(plusUserScore - detailScore);
//        appUserService.updateById(minusUser);
//        appUserService.updateById(plusUser);
//
//
//        ScoreHistory scoreHistory = new ScoreHistory();
//        scoreHistory.setType(Const.SCORE_BE_FOCUSED);
//        scoreHistory.setToUserId(transferHistory.getFromUserId());
//        scoreHistory.setFromUserId(transferHistory.getToUserId());
//
//        scoreHistory.setValue(detailScore);
//        scoreHistory.setCreateDate(new Date());
//        scoreHistory.setUpdateDate(new Date());
//        scoreHistory.setCreateBy(minusUserId);
//        scoreHistory.setUpdateBy(minusUserId);
//        scoreHistoryService.insert(scoreHistory);


//        jsonObject.put("suc", result1 && result2);

        return jsonObject;
    }
}