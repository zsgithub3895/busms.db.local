package com.sihuatech.interfaceall.check.entity;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Embeddable
@Table(name = "T_CHECK")
public class CheckEntity {	
	public static final String TYPE_ALL="ALL";
	public static final String TYPE_REG="REGX";
	@Id
	@GeneratedValue(generator = "id")
	@GenericGenerator(name = "id",strategy = "native")
	@Column(name = "id")
	private Long id;
	
	@Column(name = "strategyname")
	private String strategyName;
	
	@Column(name = "strategycode")
	private String strategyCode;
	
	@Column(name = "ckeckcode")
	private String checkCode;
	
	@Column(name = "interfacetype")
	private String interfaceType;
	
	@Column(name = "checkrule")
	private String checkRule;
	
	@Column(name = "rulevalue")
	private String ruleValue;

	public String getStrategyCode() {
		return strategyCode;
	}

	public void setStrategyCode(String strategyCode) {
		this.strategyCode = strategyCode;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getStrategyName() {
		return strategyName;
	}

	public void setStrategyName(String strategyName) {
		this.strategyName = strategyName;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}


	public String getInterfaceType() {
		return interfaceType;
	}

	public void setInterfaceType(String interfaceType) {
		this.interfaceType = interfaceType;
	}

	public String getCheckRule() {
		return checkRule;
	}

	public void setCheckRule(String checkRule) {
		this.checkRule = checkRule;
	}

	public String getRuleValue() {
		return ruleValue;
	}

	public void setRuleValue(String ruleValue) {
		this.ruleValue = ruleValue;
	}
}
