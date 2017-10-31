package com.sihuatech.interfaceinfo.manager;

import java.util.List;

import com.onewaveinc.core.db.DefaultEntityManager;
import com.sihuatech.interfaceall.interfaceconfig.entity.InterfaceConfig;

public class InterfaceInfoManager extends DefaultEntityManager< InterfaceConfig,Long> {
	
	public List<InterfaceConfig> findByBelongCity(String belongCityCode){
		String hql="from  InterfaceConfig  where cityCode=? ";
		return this.search(hql, new Object[]{belongCityCode});
	}
	public List<InterfaceConfig> findByTaskId(long taskid){
		String hql="from  InterfaceConfig where taskid=? ";
		return this.search(hql, new Object[]{taskid});
	}
	
	public List<InterfaceConfig> findByInterfaceCode(String interfaceCode){
		String hql="from  InterfaceConfig  where code=? ";
		return this.search(hql, new Object[]{interfaceCode});
	}
}
