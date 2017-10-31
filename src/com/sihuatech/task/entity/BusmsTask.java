package com.sihuatech.task.entity;

public class BusmsTask {
	/** 中心发送任务 */
	public static final String TYPE_CENTERTASK = "CENTERTASK";
	public static final int RUNSTATUS_INIT = 0;
	public static final int RUNSTATUS_SUCCESS = 1;//完成，表示需要刷新缓存了
	
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRunStatus() {
		return runStatus;
	}
	public void setRunStatus(int runStatus) {
		this.runStatus = runStatus;
	}
	private String name;
	private String type;
	private int runStatus;
	

}
