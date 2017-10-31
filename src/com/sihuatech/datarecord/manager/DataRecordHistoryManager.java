package com.sihuatech.datarecord.manager;

import java.util.List;

import com.onewaveinc.core.db.DefaultEntityManager;
import com.onewaveinc.mip.log.Logger;
import com.sihuatech.datarecord.entity.DataRecordHistory;


public class DataRecordHistoryManager extends DefaultEntityManager< DataRecordHistory,Long>{
	private static final Logger logger = Logger.getInstance(DataRecordHistoryManager.class);
	public void insertHistoty(List<DataRecordHistory> dhlist){
		logger.info("验证报文入T_MONITOR_HISTORY库：");
		for(DataRecordHistory dr:dhlist){
			   save(dr);
		}		
	}
	
}
