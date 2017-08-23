package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 * �����ͱ�
 * @author samsung
 *
 */

public class CurriculumType {
	
	private Integer curriculumId;
	private String CurriculumType;
	private Integer capacity;
	private Date date;
	public Integer getCurriculumId() {
		return curriculumId;
	}
	public void setCurriculumId(Integer curriculumId) {
		this.curriculumId = curriculumId;
	}
	public String getCurriculumType() {
		return CurriculumType;
	}
	public void setCurriculumType(String curriculumType) {
		CurriculumType = curriculumType;
	}
	public Integer getCapacity() {
		return capacity;
	}
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	

}
