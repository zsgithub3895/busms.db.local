package com.sihuatech.basicdata.area.manage;

import java.util.List;

import com.onewaveinc.core.db.DefaultEntityManager;
import com.sihuatech.basicdata.area.entity.AreaBean;
public class AreaManager extends DefaultEntityManager<AreaBean, Long>{

	public AreaBean findByProperty(String name,String code){
		List<AreaBean> list = entityDao.findBy(name, code);
		return (null != list && list.size()>0)?list.get(0):null;
	}
	/**
	 * 查询除本身外是否存在相同的code
	 * @param code
	 * @param id
	 * @return
	 */
	public List<AreaBean> findByCode(String code,Long id){
		String hql="from AreaBean  where code=? and id!=?";
		return this.search(hql, new Object[]{code,id});
	}
	
	/**
	 * 查询是否存在相同的code
	 * @param code
	 * @param id
	 * @return
	 */
	public List<AreaBean> findByCode(String code){
		String hql="from AreaBean where code=? ";
		return this.search(hql, code);
	}
	
	public List<AreaBean> findByBelongCity(String belongCityCode){
		String hql="from  AreaBean  where code=? ";
		return this.search(hql, new Object[]{belongCityCode});
	}
}
