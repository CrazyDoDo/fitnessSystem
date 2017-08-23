package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class Customer {
	/**
	 * �ͻ���
	 */
	private Integer customerId;//���
	private String custName;//����
	private String sex; //�Ա�
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;//����
	private String phone;//�ֻ��
	private String weChat; //΢��
	private String email;//����
	private String address; //��ַ
	private String professional;//
	private String souree;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	private String state;
	private Integer employeesId;
	private String emplName;
	private String comment;
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(birthday);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWeChat() {
		return weChat;
	}
	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
	}
	public String getSouree() {
		return souree;
	}
	public void setSouree(String souree) {
		this.souree = souree;
	}
	public String getStartDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(startDate);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public String getEmplName() {
		return emplName;
	}
	public void setEmplName(String emplName) {
		this.emplName = emplName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	

	
}
