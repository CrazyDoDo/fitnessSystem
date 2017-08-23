package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 * ?
 * @author samsung
 *
 */
public class PersonalCurr {
	
	private Integer personalCurrId;
	private Integer personalId;
	private Integer courseId;
	private Date date;
	
	private String personalName;//扩张属性,代课教练
	private String courseName;//扩展属性,课程名称
	private String personalPhone;//扩展属性,教练电话
	
	
	
	
	public String getPersonalPhone() {
		return personalPhone;
	}
	public void setPersonalPhone(String personalPhone) {
		this.personalPhone = personalPhone;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getPersonalName() {
		return personalName;
	}
	public void setPersonalName(String personalName) {
		this.personalName = personalName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Integer getPersonalCurrId() {
		return personalCurrId;
	}
	public void setPersonalCurrId(Integer personalCurrId) {
		this.personalCurrId = personalCurrId;
	}


	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	
	
}
