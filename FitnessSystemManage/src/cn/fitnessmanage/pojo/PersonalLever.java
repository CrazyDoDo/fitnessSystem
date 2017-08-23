package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author samsung
 *
 */

public class PersonalLever {
	
	private Integer leverId;
	private String personalLever;
	private Integer personalPrice;
	private Integer employeesId;
	
	private String  empName;//扩展属性,操作员姓名
	
	
	
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public Integer getLeverId() {
		return leverId;
	}
	public void setLeverId(Integer leverId) {
		this.leverId = leverId;
	}
	public String getPersonalLever() {
		return personalLever;
	}
	public void setPersonalLever(String personalLever) {
		this.personalLever = personalLever;
	}
	public Integer getPersonalPrice() {
		return personalPrice;
	}
	public void setPersonalPrice(Integer personalPrice) {
		this.personalPrice = personalPrice;
	}

	

}
