package cn.fitnessmanage.pojo;

/**
 * ?
 *�γ̱�
 */
public class Course {
	private Integer courseId;
	private String courseName;
	private Integer courseCount;
	private Integer courseCoachId;
	private Integer time;
	private String describe;
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public Integer getCourseCount() {
		return courseCount;
	}
	public void setCourseCount(Integer courseCount) {
		this.courseCount = courseCount;
	}
	public Integer getCourseCoachId() {
		return courseCoachId;
	}
	public void setCourseCoachId(Integer courseCoachId) {
		this.courseCoachId = courseCoachId;
	}
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}

}
