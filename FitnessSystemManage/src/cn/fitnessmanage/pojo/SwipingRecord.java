package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 * ?
 * @author samsung
 *
 */

public class SwipingRecord {
	private Integer swipingCardId;
	private Date date;
	private Date stratDate;
	private Date overDate;
	private String membersName;
	private String employeesName;
	private Integer membersId;
	private Integer employeesId;
	private String timeSum;
	private int memsum;//扩展属性,会员刷卡次数
	private int swipingSum;//扩展属性,会员刷卡
	
	
	public int getSwipingSum() {
		return swipingSum;
	}
	public void setSwipingSum(int swipingSum) {
		this.swipingSum = swipingSum;
	}
	public int getMemsum() {
		return memsum;
	}
	public void setMemsum(int memsum) {
		this.memsum = memsum;
	}
	public Integer getSwipingCardId() {
		return swipingCardId;
	}
	public void setSwipingCardId(Integer swipingCardId) {
		this.swipingCardId = swipingCardId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getStratDate() {
		return stratDate;
	}
	public void setStratDate(Date stratDate) {
		this.stratDate = stratDate;
	}
	public Date getOverDate() {
		return overDate;
	}
	public void setOverDate(Date overDate) {
		this.overDate = overDate;
	}
	public String getMembersName() {
		return membersName;
	}
	public void setMembersName(String membersName) {
		this.membersName = membersName;
	}
	public String getEmployeesName() {
		return employeesName;
	}
	public void setEmployeesName(String employeesName) {
		this.employeesName = employeesName;
	}
	public Integer getMembersId() {
		return membersId;
	}
	public void setMembersId(Integer membersId) {
		this.membersId = membersId;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public String getTimeSum() {
		return timeSum;
	}
	public void setTimeSum(String timeSum) {
		this.timeSum = timeSum;
	}
	
	
	

}
