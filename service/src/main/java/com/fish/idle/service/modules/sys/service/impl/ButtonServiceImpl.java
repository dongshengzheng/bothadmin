package com.fish.idle.service.modules.sys.service.impl;

import com.baomidou.framework.service.impl.SuperServiceImpl;
import com.fish.idle.service.modules.sys.entity.Button;
import com.fish.idle.service.modules.sys.entity.Office;
import com.fish.idle.service.modules.sys.mapper.ButtonMapper;
import com.fish.idle.service.modules.sys.mapper.OfficeMapper;
import com.fish.idle.service.modules.sys.service.ButtonService;
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
public class ButtonServiceImpl extends SuperServiceImpl<ButtonMapper, Button> implements ButtonService {
    @Autowired
    private ButtonMapper buttonMapper;

    public PageData list(PageData pd) {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
        int totalNum = buttonMapper.count(pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
        List<PageData> pds = buttonMapper.list(pd);
        AppUtil.nullToEmpty(pds, new String[]{"buttonId", "menuId", "buttonName", "buttonUrl"});

        result.put(Const.DRAW, pd.getString(Const.DRAW));
        result.put(Const.RECORDSTOTAL, totalNum);
        result.put(Const.RECORDSFILTERED, totalNum);
        result.put(Const.NDATA, pds);
        return result;
    }

    public void add(PageData pd) {
        buttonMapper.add(pd);
    }

    public PageData getById(Integer buttonId) {
        return buttonMapper.getById(buttonId);
    }

    public void edit(PageData pd)  {
        buttonMapper.edit(pd);
    }

    public void delete(Integer buttonId) {
        buttonMapper.delete(buttonId);
    }

    public void batchDelete(String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] idArr = ids.split(",");
            if (idArr.length > 0) {
                List<Integer> idList = new ArrayList<Integer>();
                for (String idStr : idArr) {
                    idList.add(Integer.valueOf(idStr));
                }
                for(int i = 0; i < idList.size(); i++) {
                    buttonMapper.delete(idList.get(i));
                }
            }
        }
    }

}
