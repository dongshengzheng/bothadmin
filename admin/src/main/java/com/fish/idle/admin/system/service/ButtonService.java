package com.fish.idle.admin.system.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.fish.idle.admin.base.dao.BaseDao;
import com.fish.idle.admin.base.util.AppUtil;
import com.fish.idle.admin.base.util.Const;
import com.fish.idle.admin.base.util.PageData;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author Sun.Han
 * @version 1.0
 * @FileName ButtonService.java
 * @Description:
 * @Date 2015年5月9日
 */
@Transactional(readOnly = true)
@Service("buttonService")
public class ButtonService {

    @Resource(name = "BaseDao")
    private BaseDao dao;

    public PageData list(PageData pd) throws Exception {
        PageData result = new PageData();
        String search = pd.getString("keyword");
        if (StringUtils.isNotBlank(search)) {
            pd.put("keyword", "%" + search + "%");
        }
        int totalNum = (int) dao.findForObject("ButtonMapper.count", pd);

        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
        List<PageData> pds = dao.findForList("ButtonMapper.list", pd);
        AppUtil.nullToEmpty(pds, new String[]{"buttonId", "menuId", "buttonName", "buttonUrl"});

        result.put(Const.DRAW, pd.getString(Const.DRAW));
        result.put(Const.RECORDSTOTAL, totalNum);
        result.put(Const.RECORDSFILTERED, totalNum);
        result.put(Const.NDATA, pds);
        return result;
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public void add(PageData pd) throws Exception {
        dao.save("ButtonMapper.add", pd);
    }

    public PageData getById(Integer buttonId) throws Exception {
        return (PageData) dao.findForObject("ButtonMapper.getById", buttonId);
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public void edit(PageData pd) throws Exception {
        dao.update("ButtonMapper.edit", pd);
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public void delete(Integer buttonId) throws Exception {
        dao.delete("ButtonMapper.delete", buttonId);
    }

    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public void batchDelete(String ids) throws Exception {
        if (StringUtils.isNotBlank(ids)) {
            String[] idArr = ids.split(",");
            if (idArr.length > 0) {
                List<Integer> idList = new ArrayList<Integer>();
                for (String idStr : idArr) {
                    idList.add(Integer.valueOf(idStr));
                }
                dao.delete("ButtonMapper.batchDelete", idList);
            }
        }
    }

}
