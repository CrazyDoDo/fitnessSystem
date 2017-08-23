package cn.fitnessmanage.pojo;
/**
 * ��������Ͽα�
 * @author samsung
 *
 */
public class OrderCurriculum {
	
	private Integer orderCurrID;
	private Integer courseId;
	private Integer personalId;
	private String stratdate;
	private Integer whatDay;
	private Integer state;
	
	
	private String personalName;//扩展属性,教练名称
	private String courseName;//扩展属性,课程名称
	private Integer count;//扩展属性,容纳人数
	
	
	
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
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
	public Integer getOrderCurrID() {
		return orderCurrID;
	}
	public void setOrderCurrID(Integer orderCurrID) {
		this.orderCurrID = orderCurrID;
	}
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}
	public String getStratdate() {
		return stratdate;
	}
	public void setStratdate(String stratdate) {
		this.stratdate = stratdate;
	}
	public Integer getWhatDay() {
		return whatDay;
	}
	public void setWhatDay(Integer whatDay) {
		this.whatDay = whatDay;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	

}
