package cn.fitnessmanage.pojo;
/**
 * 
 * @author samsung
 *
 */

public class PersonalTraniing {
	
	private Integer trainingId;
	private Integer personalId;
	private Integer membersId;
	private String traniingType;
	private Integer sumHour;
	private Integer remainHour;
	private String comment;
	private Integer orderId;
	
	
	
	public Integer getTrainingId() {
		return trainingId;
	}
	public void setTrainingId(Integer trainingId) {
		this.trainingId = trainingId;
	}


	public String getTraniingType() {
		return traniingType;
	}
	public void setTraniingType(String traniingType) {
		this.traniingType = traniingType;
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
	public Integer getSumHour() {
		return sumHour;
	}
	public void setSumHour(Integer sumHour) {
		this.sumHour = sumHour;
	}
	public Integer getRemainHour() {
		return remainHour;
	}
	public void setRemainHour(Integer remainHour) {
		this.remainHour = remainHour;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	

}
