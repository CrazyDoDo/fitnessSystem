package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * ?
 * @author samsung
 *
 */
public class PersonalOrder {
	
	private Integer orderId;
	private String transactionType;
	private String price;
	private String obvious;
	private Integer employeesId;
	private Integer membersId;
	private Date date;
	private String employeesName;
	private String operatingPeriect;
	
	
	private Integer remainHour;//扩展属性,剩余课时
	private Integer personalId;
	private String personalName;
	private Integer keshi; //扩展属性,充值课时
	private String memName;//扩展属性,会员姓名
	
	
	
	public Integer getRemainHour() {
		return remainHour;
	}
	public void setRemainHour(Integer remainHour) {
		this.remainHour = remainHour;
	}
	public Integer getPersonalId() {
		return personalId;
	}
	public void setPersonalId(Integer personalId) {
		this.personalId = personalId;
	}
	public String getPersonalName() {
		return personalName;
	}
	public void setPersonalName(String personalName) {
		this.personalName = personalName;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getObvious() {
		return obvious;
	}
	public void setObvious(String obvious) {
		this.obvious = obvious;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public Integer getMembersId() {
		return membersId;
	}
	public void setMembersId(Integer membersId) {
		this.membersId = membersId;
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
	public String getEmployeesName() {
		return employeesName;
	}
	public void setEmployeesName(String employeesName) {
		this.employeesName = employeesName;
	}
	public String getOperatingPeriect() {
		return operatingPeriect;
	}
	public void setOperatingPeriect(String operatingPeriect) {
		this.operatingPeriect = operatingPeriect;
	}
	public Integer getKeshi() {
		return keshi;
	}
	public void setKeshi(Integer keshi) {
		this.keshi = keshi;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}

	
	
}
