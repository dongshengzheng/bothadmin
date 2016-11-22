package com.fish.idle.admin.system.service;


import com.fish.idle.admin.util.Const;
import com.fish.idle.admin.util.PageData;
import com.fish.idle.service.mapper.DictMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/** 
 * 说明： 数据字典
 * 创建人：
 * 创建时间：2015-12-16
 * @version
 */
@Service
public class DictService {

	@Autowired
	private DictMapper dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	@Transactional(rollbackFor = {Throwable.class}, readOnly = false)
	public void add(PageData pd) throws Exception {
		dao.save( pd);
	}

	/**通过id获取数据
	 * @param id
	 * @throws Exception
	 */
	public PageData getById(Integer id) throws Exception {
		return (PageData) dao.getById( id);
	}


	/**修改
	 * @param pd
	 * @throws Exception
	 */
	@Transactional(rollbackFor = {Throwable.class}, readOnly = false)
	public void edit(PageData pd)throws Exception{
		dao.edit( pd);
	}

	/**删除
	 * @param id
	 * @throws Exception
	 */
	@Transactional(rollbackFor = {Throwable.class}, readOnly = false)
	public int delete(Integer id)throws Exception{
		return (int)dao.delete("DictionariesMapper.delete", id);
	}

	@Transactional(rollbackFor = {Throwable.class}, readOnly = false)
	public Integer batchDelete(PageData pd) throws Exception {
		List<Integer> idList = com.fish.idle.admin.base.util.StringUtils.split(pd.getString("ids"), Const.COMMA);
		if (null != idList && idList.size() > 0) {
			pd.put("idList", idList);
			return (Integer) dao.delete("DictionariesMapper.batchDelete", pd);
		}
		return 0;
	}

	/**列表
	 * @param pd
	 * @throws Exception
	 */
	public PageData list(PageData pd) throws Exception{
		PageData result = new PageData();
		int totalNum = (int) dao.findForObject("DictionariesMapper.count", pd);
		pd.put("from", pd.getInteger("start"));
		pd.put("size", pd.getInteger("length"));
		List<PageData> pds = dao.list( pd);
		result.put(Const.DRAW, pd.getString(Const.DRAW));
		result.put(Const.RECORDSTOTAL, totalNum);
		result.put(Const.RECORDSFILTERED, totalNum);
		result.put(Const.NDATA, pds);
		return result;
	}


	

}

