package com.sihuatech.datastatus.manager;

import java.util.List;

import com.onewaveinc.core.db.DefaultEntityManager;
import com.sihuatech.datastatus.entity.DataRecordStatus;

public class DataRecordStatusManager extends
		DefaultEntityManager<DataRecordStatus, Long> {
	public void updateAndSave(List<DataRecordStatus> statuslist) {
		logger.info("验证报文入T_MONITOR_STATUS库：");
		for (DataRecordStatus drs : statuslist) {
			String interfaceCode = drs.getInterfaceCode();
			String hql = "from DataRecordStatus  where interfaceCode=?";
			List<DataRecordStatus> list = this.search(hql, new Object[] {
					interfaceCode });
			if (null != list && list.size() > 0) {
				drs.setId(list.get(0).getId());
				update(drs);
			} else {
				save(drs);
			}
		}

	}

	public DataRecordStatus findByCodeAndType(String cityCode,
			String interfaceType) {
		String hql = "from DataRecordStatus  where cityCode=? and interfaceType=?";
		List<DataRecordStatus> statusList = this.search(hql, new Object[] {
				cityCode, interfaceType });
		DataRecordStatus dr = null;
		if (statusList.size() > 0) {
			dr = statusList.get(0);
		}
		return dr;
	}
	
	
	public DataRecordStatus getDataRecordStatusByCode(String code){
		String hql = "from DataRecordStatus  where interfaceCode=?";
		List<DataRecordStatus> statusList = this.search(hql, new Object[] {code});
		DataRecordStatus dr = null;
		if (statusList.size() > 0) {
			dr = statusList.get(0);
		}
		return dr;
	}
	
	public void update(List<DataRecordStatus> statuslist) {
		logger.info("更新接口数据的同时，更新T_MONITOR_STATUS：");
		for (DataRecordStatus drs : statuslist) {
			String interfaceCode = drs.getInterfaceCode();
			String hql = "from DataRecordStatus  where interfaceCode=?";
			List<DataRecordStatus> list = this.search(hql, new Object[] {
					interfaceCode });
			if (null != list && list.size() > 0) {
				drs.setId(list.get(0).getId());
				update(drs);
			} else {
				save(drs);
			}
		}

	}
	
}
