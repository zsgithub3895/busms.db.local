package com.sihuatech.datastatus.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author lei.zhu
 * 
 */
@Entity
@Table(name = "T_MONITOR_STATUS")
public class DataRecordStatus {
	private int id;
	private String cityCode;
	private long delay;
	private int respCorrect;
	private String interfaceType;
	private String interfaceName;
	private String monitorGroup;
	private String interfaceCode;
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false, precision = 18, scale = 0)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "cityCode")
	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	@Column(name = "delay")
	public long getDelay() {
		return delay;
	}

	public void setDelay(long delay) {
		this.delay = delay;
	}

	@Column(name = "respCorrect")
	public int getRespCorrect() {
		return respCorrect;
	}

	@Column(name = "interfaceName")
	public String getInterfaceName() {
		return interfaceName;
	}

	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}

	public void setRespCorrect(int respCorrect) {
		this.respCorrect = respCorrect;
	}

	@Column(name = "interfaceType")
	public String getInterfaceType() {
		return interfaceType;
	}

	public void setInterfaceType(String interfaceType) {
		this.interfaceType = interfaceType;
	}

	@Column(name = "monitorGroup")
	public String getMonitorGroup() {
		return monitorGroup;
	}

	public void setMonitorGroup(String monitorGroup) {
		this.monitorGroup = monitorGroup;
	}

	@Column(name = "interfaceCode")
	public String getInterfaceCode() {
		return interfaceCode;
	}

	public void setInterfaceCode(String interfaceCode) {
		this.interfaceCode = interfaceCode;
	}

}
