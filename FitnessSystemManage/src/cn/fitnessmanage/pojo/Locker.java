package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 * ������
 * @author Administrator
 *
 */
public class Locker {
	private Integer lockerId;
	private String lockerType;
	private Integer employeesId;
	
	private String state;
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getLockerId() {
		return lockerId;
	}
	public void setLockerId(Integer lockerId) {
		this.lockerId = lockerId;
	}
	public String getLockerType() {
		return lockerType;
	}
	public void setLockerType(String lockerType) {
		this.lockerType = lockerType;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}

	

}
