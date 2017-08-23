package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 *�Ͽ�ʱ��
 */
public class CurriculumTime {

	private Integer curriculumId;
	private Integer currTypeId;
	private String startDate;
	private String overDate;
	private Integer orderCurrId;
	private Date date;
	public Integer getCurriculumId() {
		return curriculumId;
	}
	public void setCurriculumId(Integer curriculumId) {
		this.curriculumId = curriculumId;
	}
	public Integer getCurrTypeId() {
		return currTypeId;
	}
	public void setCurrTypeId(Integer currTypeId) {
		this.currTypeId = currTypeId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getOverDate() {
		return overDate;
	}
	public void setOverDate(String overDate) {
		this.overDate = overDate;
	}
	public Integer getOrderCurrId() {
		return orderCurrId;
	}
	public void setOrderCurrId(Integer orderCurrId) {
		this.orderCurrId = orderCurrId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

}
