package cn.fitnessmanage.pojo;

import java.util.Date;

/**
 *@author唐凡
 *@time2017-5-20-下午5:24:17
 *@description
 */
public class PersonalTuike {
	private Integer tuikeId;
	private Integer personalId;
	private Integer membersId;
	private Integer hour;
	private Integer money;
	private Date date;
	private Integer traniingId;
	
	private String memName;//扩展属性,会员姓名
	private String personalName;//扩展属性,教练姓名
	
	
	
	
	public Integer getTraniingId() {
		return traniingId;
	}
	public void setTraniingId(Integer traniingId) {
		this.traniingId = traniingId;
	}
	public Integer getTuikeId() {
		return tuikeId;
	}
	public void setTuikeId(Integer tuikeId) {
		this.tuikeId = tuikeId;
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
	public Integer getHour() {
		return hour;
	}
	public void setHour(Integer hour) {
		this.hour = hour;
	}
	public Integer getMoney() {
		return money;
	}
	public void setMoney(Integer money) {
		this.money = money;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getPersonalName() {
		return personalName;
	}
	public void setPersonalName(String personalName) {
		this.personalName = personalName;
	}
	

}
