package com.fish.idle.service.modules.sys.service.impl;

import com.fish.idle.service.modules.sys.entity.Dict;
import com.fish.idle.service.modules.sys.mapper.DictMapper;
import com.fish.idle.service.modules.sys.service.DictService;
import com.fish.idle.service.util.Const;
import com.fish.idle.service.util.PageData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dongs on 2016/11/20.
 */
@Transactional(readOnly = false)
@Service
public class DictServiceImpl implements DictService {

    @Autowired
    private DictMapper dictMapper;

    /**
     * 新增
     *
     * @param pd
     * @throws Exception
     */
    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public int add(PageData pd) throws Exception {
        return dictMapper.save(pd);
    }

    /**
     * 通过id获取数据
     *
     * @param pd
     * @throws Exception
     */
    public PageData getById(PageData pd) throws Exception {
        return dictMapper.getById(pd);
    }


    /**
     * 修改
     *
     * @param pd
     * @throws Exception
     */
    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public void updateDicById(PageData pd) throws Exception {
        dictMapper.updateDicById(pd);
    }

    /**
     * 删除
     *
     * @param id
     * @throws Exception
     */
    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
    public int deleteById(Integer id) throws Exception {
        return dictMapper.deleteById(id);
    }

//    @Transactional(rollbackFor = {Throwable.class}, readOnly = false)
//    public Integer batchDelete(PageData pd) throws Exception {
//        List<Integer> idList = com.fish.idle.service.util.StringUtils.split(pd.getString("ids"), Const.COMMA);
//        if (null != idList && idList.size() > 0) {
//            pd.put("idList", idList);
//            return (Integer) dictMapper.delete(pd);
//        }
//        return 0;
//    }

    /**
     * 列表
     *
     * @param pd
     * @throws Exception
     */
    public PageData list(PageData pd) {
        PageData result = new PageData();
        int totalNum = dictMapper.getDictCount(pd);
        pd.put("from", pd.getInteger("start"));
        pd.put("size", pd.getInteger("length"));
        List<Dict> pds = dictMapper.getDicList(pd);
        result.put(Const.DRAW, pd.getString(Const.DRAW));
        result.put(Const.RECORDSTOTAL, totalNum);
        result.put(Const.RECORDSFILTERED, totalNum);
        result.put(Const.NDATA, pds);
        return result;
    }
}

