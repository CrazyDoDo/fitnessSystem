package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 * ?
 * @author samsung
 *
 */


public class BookingTraining {
	private Integer orderid;
	private Integer personalId;
	private Integer membersId;
	private Integer employeesId;
	private String trainingType;
	private Date strattime;
	private String trainingState;
	private String comment;
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
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
	public String getTrainingType() {
		return trainingType;
	}
	public void setTrainingType(String trainingType) {
		this.trainingType = trainingType;
	}
	public Date getStrattime() {
		return strattime;
	}
	public void setStrattime(Date strattime) {
		this.strattime = strattime;
	}
	public String getTrainingState() {
		return trainingState;
	}
	public void setTrainingState(String trainingState) {
		this.trainingState = trainingState;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	

}
