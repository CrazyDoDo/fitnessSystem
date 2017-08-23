package cn.fitnessmanage.pojo;
/**
 *@author唐凡
 *@time2017-8-8-下午10:43:07
 *@description
 *会员预约操课类
 */
public class MembersOrderCurr {

	private Integer membersOrderId;
	private Integer membersId;
	private Integer orderCurrId;
	
	private String membersName;
	private String phone;
	
	
	public String getMembersName() {
		return membersName;
	}
	public void setMembersName(String membersName) {
		this.membersName = membersName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getMembersOrderId() {
		return membersOrderId;
	}
	public void setMembersOrderId(Integer membersOrderId) {
		this.membersOrderId = membersOrderId;
	}
	public Integer getMembersId() {
		return membersId;
	}
	public void setMembersId(Integer membersId) {
		this.membersId = membersId;
	}
	public Integer getOrderCurrId() {
		return orderCurrId;
	}
	public void setOrderCurrId(Integer orderCurrId) {
		this.orderCurrId = orderCurrId;
	}
	
	
	
}
