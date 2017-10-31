package com.sihuatech.interfaceall.check.manage;

import java.util.List;

import com.onewaveinc.core.db.DefaultEntityManager;
import com.sihuatech.interfaceall.check.entity.CheckEntity;


public class CheckManage extends DefaultEntityManager<CheckEntity, Long>{

	public CheckEntity findByProperty(String name,String code){
		List<CheckEntity> list = entityDao.findBy(name, code);
		return (null != list && list.size()>0)?list.get(0):null;
	}
	/**
	 * 查询除本身外是否存在相同的code
	 * @param code
	 * @param id
	 * @return
	 */
	public List<CheckEntity> findByCode(String code,Long id){
		String hql="from CheckEntity  where strategyCode=? and id!=?";
		return this.search(hql, new Object[]{code,id});
	}
	
	/**
	 * 查询是否存在相同的code
	 * @param code
	 * @param id
	 * @return
	 */
	public List<CheckEntity> findByCode(String strategyCode){
		String hql="from CheckEntity where strategyCode=? ";
		return this.search(hql, strategyCode);
	}
}
