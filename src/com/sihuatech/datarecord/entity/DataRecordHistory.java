package com.sihuatech.datarecord.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
/**
 * 
 * @author lei.zhu
 *
 */
@Entity
@Table(name = "T_MONITOR_HISTORY")
public class DataRecordHistory {
	  private int id ;
	  private String cityCode;
	  private String interfaceType;
	  private Date   sentTime;
	  private long   delay;
	  private int respCorrect;
	  private String interfaceCode;
	  private String interfaceName;
	  @Column(name = "interfaceName") 
	  public String getInterfaceName() {
		return interfaceName;
	}
	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "native")
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
	@Column(name = "interfaceType")
	public String getInterfaceType() {
		return interfaceType;
	}
	public void setInterfaceType(String interfaceType) {
		this.interfaceType = interfaceType;
	}
	@Column(name = "sentTime")
	public Date getSentTime() {
		return sentTime;
	}
	public void setSentTime(Date sentTime) {
		this.sentTime = sentTime;
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
	public void setRespCorrect(int respCorrect) {
		this.respCorrect = respCorrect;
	}
	@Column(name = "interfaceCode")
	public String getInterfaceCode() {
		return interfaceCode;
	}
	public void setInterfaceCode(String interfaceCode) {
		this.interfaceCode = interfaceCode;
	}

}



