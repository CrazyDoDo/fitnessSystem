package cn.fitnessmanage.pojo;
/**
 * ȫ���γ̱�
 * @author samsung
 *
 */

public class Curriculum {
	
	private Integer courseId;
	private String courseName;
	private String courseEnglish;
	private Integer curriculumId;
	private String curriculumType;
	private String date;
	private String comment;
	private Integer count;
	
	
	
	public String getCurriculumType() {
		return curriculumType;
	}
	public void setCurriculumType(String curriculumType) {
		this.curriculumType = curriculumType;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
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
	public String getCourseEnglish() {
		return courseEnglish;
	}
	public void setCourseEnglish(String courseEnglish) {
		this.courseEnglish = courseEnglish;
	}
	public Integer getCurriculumId() {
		return curriculumId;
	}
	public void setCurriculumId(Integer curriculumId) {
		this.curriculumId = curriculumId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	

}
