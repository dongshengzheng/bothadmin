package com.fish.idle.service.service.impl;

import com.fish.idle.service.mapper.ButtonMapper;
import com.fish.idle.service.service.ButtonService;
import com.fish.idle.service.util.AppUtil;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName ButtonServiceImpl.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service
public class ButtonServiceImpl implements ButtonService {
    @Autowired
    private ButtonMapper buttonMapper;

    public PageData list(PageData pd) {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
//        int totalNum = (int) dao.findForObject("ButtonMapper.count", pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
//        List<PageData> pds = dao.findForList("ButtonMapper.list", pd);
//        AppUtil.nullToEmpty(pds, new String[]{"buttonId", "menuId", "buttonName", "buttonUrl"});
//
//        result.put(Const.DRAW, pd.getString(Const.DRAW));
//        result.put(Const.RECORDSTOTAL, totalNum);
//        result.put(Const.RECORDSFILTERED, totalNum);
//        result.put(Const.NDATA, pds);
        return result;
    }

    public void add(PageData pd) {
//        dao.save("ButtonMapper.add", pd);
    }

    public PageData getById(Integer buttonId) {
//        return (PageData) dao.findForObject("ButtonMapper.getById", buttonId);
        return null;
    }

    public void edit(PageData pd)  {
//        dao.update("ButtonMapper.edit", pd);
    }

    public void delete(Integer buttonId) {
//        dao.delete("ButtonMapper.delete", buttonId);
    }

    public void batchDelete(String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] idArr = ids.split(",");
            if (idArr.length > 0) {
                List<Integer> idList = new ArrayList<Integer>();
                for (String idStr : idArr) {
                    idList.add(Integer.valueOf(idStr));
                }
//                dao.delete("ButtonMapper.batchDelete", idList);
            }
        }
    }

}
