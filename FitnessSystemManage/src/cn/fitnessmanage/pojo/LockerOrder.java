package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class LockerOrder {
	private Integer lockerOrderId;
	private  String lockerId;
	private  String lockerway;
	private  String lockerType;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private  Date startDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private  Date overDate;
	private  Integer employeesId;
	private  Integer membersId;
	private String employeesName;
	
	private String membersName;
	
	
	
	
	public Integer getLockerOrderId() {
		return lockerOrderId;
	}
	public void setLockerOrderId(Integer lockerOrderId) {
		this.lockerOrderId = lockerOrderId;
	}
	public String getMembersName() {
		return membersName;
	}
	public void setMembersName(String membersName) {
		this.membersName = membersName;
	}
	public String getLockerId() {
		return lockerId;
	}
	public void setLockerId(String lockerId) {
		this.lockerId = lockerId;
	}
	public String getLockerway() {
		return lockerway;
	}
	public void setLockerway(String lockerway) {
		this.lockerway = lockerway;
	}
	public String getLockerType() {
		return lockerType;
	}
	public void setLockerType(String lockerType) {
		this.lockerType = lockerType;
	}
	public String getStartDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(startDate);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getOverDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(overDate);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	public void setOverDate(Date overDate) {
		this.overDate = overDate;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public Integer getMembersId() {
		return membersId;
	}
	public void setMembersId(Integer membersId) {
		this.membersId = membersId;
	}
	public String getEmployeesName() {
		return employeesName;
	}
	public void setEmployeesName(String employeesName) {
		this.employeesName = employeesName;
	}
		
	
	
}
