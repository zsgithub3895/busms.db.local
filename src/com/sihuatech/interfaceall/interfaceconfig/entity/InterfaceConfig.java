package com.sihuatech.interfaceall.interfaceconfig.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
/**
 * 实体
 * @author lei.zhu
 *
 */
@Entity
@Table(name = "T_INTERFACE")
public class InterfaceConfig {
   //访问接口的方式
   private String protocol;
   //访问接口的url
   private String url;
   //id
   private long id;
   //接口名称
   private String name;
   //接口代码
   private String code;
   //业务平台
   private String businessPlatform;
   //接口类型
   private String type;
   //所属城市
   private String cityCode;
//接口请求样例
   private String requestExam;
   //接口绑定验证策略
   private String strategyCode;
   //接口绑定定时任务
   private long taskId;
   //延迟阈值
   private int delayThreshold;
   
   //监控分组
   private String monitorGroup;
  
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false, precision = 18, scale = 0)
    public long getId() {
    	return id;
    }
    public void setId(long id) {
    	this.id = id;
    }
   
    @Column(name = "protocol")  
	public String getProtocol() {
		return protocol;
	}
	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}
	 @Column(name = "citycode")  
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	 @Column(name = "url") 
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Column(name = "businessPlatform")
	public String getBusinessPlatform() {
		return businessPlatform;
	}
	public void setBusinessPlatform(String businessPlatform) {
		this.businessPlatform = businessPlatform;
	}
	@Column(name = "type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name = "requestexam")
	public String getRequestExam() {
		return requestExam;
	}
	public void setRequestExam(String requestExam) {
		this.requestExam = requestExam;
	}
	@Column(name = "strategycode")
	public String getStrategyCode() {
		return strategyCode;
	}
	public void setStrategyCode(String strategyCode) {
		this.strategyCode = strategyCode;
	}
	@Column(name = "taskId")
	public long getTaskId() {
		return taskId;
	}
	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}
	@Column(name = "monitorGroup")
	public String getMonitorGroup() {
		return monitorGroup;
	}
	public void setMonitorGroup(String monitorGroup) {
		this.monitorGroup = monitorGroup;
	}
	@Column(name = "delayThreshold")
	public int getDelayThreshold() {
		return delayThreshold;
	}
	public void setDelayThreshold(int delayThreshold) {
		this.delayThreshold = delayThreshold;
	}
}
