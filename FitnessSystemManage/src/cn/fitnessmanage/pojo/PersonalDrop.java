package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * ?
 * @author samsung
 *
 */

public class PersonalDrop {
	
	private Integer dropId;
	private Integer membersId;
	private Integer personalId;
	private Integer sumHour;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	private String state;
	private String common;
	private Integer orderId;
	
	private String memName;//扩展属性,会员姓名
	private String emplName;//扩展属性,员工姓名
	private String memSex;//扩展属性,会员性别
	private String memPhone;//扩展属性,会员电话
	private int  price;//扩展属性,价格
	
	
	
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getCommon() {
		return common;
	}
	public void setCommon(String common) {
		this.common = common;
	}
	public Integer getDropId() {
		return dropId;
	}
	public void setDropId(Integer dropId) {
		this.dropId = dropId;
	}
	public Integer getMembersId() {
		return membersId;
	}
	public void setMembersId(Integer membersId) {
		this.membersId = membersId;
	}
	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}
	public Integer getSumHour() {
		return sumHour;
	}
	public void setSumHour(Integer sumHour) {
		this.sumHour = sumHour;
	}
	public String getDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(date);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getEmplName() {
		return emplName;
	}
	public void setEmplName(String emplName) {
		this.emplName = emplName;
	}
	public String getMemSex() {
		return memSex;
	}
	public void setMemSex(String memSex) {
		this.memSex = memSex;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	

	
	
}
