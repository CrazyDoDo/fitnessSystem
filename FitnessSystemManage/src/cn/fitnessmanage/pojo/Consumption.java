package cn.fitnessmanage.pojo;

import java.util.Date;
  /**
   * ���
   */
public class Consumption {
	private Integer consumptionId;
	private Integer goodsId;
	private Integer employeesId;
	private Integer membersId;
	private Date date;
	public Integer getConsumptionId() {
		return consumptionId;
	}
	public void setConsumptionId(Integer consumptionId) {
		this.consumptionId = consumptionId;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	


}
