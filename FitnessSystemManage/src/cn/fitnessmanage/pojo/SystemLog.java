package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 * 
 * @author samsung
 *
 */

public class SystemLog {
	
	private Integer systemLogId;
	private Integer employeesId;
	private String module;
	private String comment;
	private Date date;
	
	private String name;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSystemLogId() {
		return systemLogId;
	}
	public void setSystemLogId(Integer systemLogId) {
		this.systemLogId = systemLogId;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	
	

}
