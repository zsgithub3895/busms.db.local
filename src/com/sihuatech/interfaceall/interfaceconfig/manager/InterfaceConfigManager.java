package com.sihuatech.interfaceall.interfaceconfig.manager;

import java.util.List;

import com.onewaveinc.core.db.DefaultEntityManager;
import com.sihuatech.interfaceall.check.entity.CheckEntity;
import com.sihuatech.interfaceall.interfaceconfig.entity.InterfaceConfig;

public class InterfaceConfigManager extends
		DefaultEntityManager<InterfaceConfig, Long> {
	public List<InterfaceConfig> getByType(String type) {
		String hql = "from InterfaceConfig i where i.type=? ";
		return this.search(hql, type);
	}
	
	public List<InterfaceConfig> getByBussinessPlatForm(String type) {
		String hql = "from InterfaceConfig i where i.businessPlatform=? ";
		return this.search(hql, type);
	}
	
	public List<InterfaceConfig> getByGroup(String group) {
		String hql = "from InterfaceConfig i where i.monitorGroup=? ";
		return this.search(hql, group);
	}
	

	public boolean isByCitycode(String code) {
		String hql = "from InterfaceConfig  where cityCode = ?";
		List<InterfaceConfig> list = this.search(hql, new Object[] { code });
		if (list.size() > 0) {
			return true;
		}
		return false;
	}

	public List<InterfaceConfig> getByCityCode(String cityCode) {
		String hql = "from InterfaceConfig i where i.cityCode=? ";
		return this.search(hql, cityCode);
	}
	
	public List<InterfaceConfig> getByCityCodeAndType(String cityCode,String type) {
		String hql = "from InterfaceConfig i where i.cityCode=? and i.type=? ";
		return this.search(hql, new Object[]{cityCode,type});
	}
	
	public List<InterfaceConfig> findByCode(String code,Long id){
		String hql="from InterfaceConfig  where code=? and id!=?";
		return this.search(hql, new Object[]{code,id});
	}

	public boolean getByTaskId(long id) {
		String hql = "from InterfaceConfig  where taskId = ?";
		List<InterfaceConfig> list = this.search(hql, new Object[] { id });
		if (list.size() > 0) {
			return true;
		}
		return false;
	}
	
	public boolean isBindCheckStrategy(String code) {
		String hql = "from InterfaceConfig  where strategyCode = ?";
		List<InterfaceConfig> list = this.search(hql, code);
		if (list.size() > 0) {
			return true;
		}
		return false;
	}

	public boolean indentyCode(String code) {
		String hql ="from InterfaceConfig where code =? ";
	  List<InterfaceConfig> list=search(hql, code);
	  if(null!=list  && list.size()>0){
		  return false;
	  }
		return true;	
	}
	
	public List<InterfaceConfig> getAllByGroup() {
		String hql = "from InterfaceConfig i ";
		List<InterfaceConfig> list=search(hql);
		return list;
	}
	
	public InterfaceConfig getByCode(String code) {
		 String hql = "from InterfaceConfig i where code =?";
		 List<InterfaceConfig> list=search(hql, code);
		 InterfaceConfig con = null;
		  if(null!=list  && list.size()>0){
			  con=list.get(0);
		  }	
		  return con;
		}

}
