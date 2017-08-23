package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class GoodsOrder {
	private Integer goodsOrderId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	private Integer goodsSum;
	private Integer goodsId;
	private Integer membersId;
	private Integer employeesId;
	private Double goodsPrice;
	
	private String membersName;
	private String  employeesName;
	private String goodsName;
	private Double money;

	
	
	public Double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getMembersName() {
		return membersName;
	}
	public void setMembersName(String membersName) {
		this.membersName = membersName;
	}
	public String getEmployeesName() {
		return employeesName;
	}
	public void setEmployeesName(String employeesName) {
		this.employeesName = employeesName;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getGoodsOrderId() {
		return goodsOrderId;
	}
	public void setGoodsOrderId(Integer goodsOrderId) {
		this.goodsOrderId = goodsOrderId;
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
	public Integer getGoodsSum() {
		return goodsSum;
	}
	public void setGoodsSum(Integer goodsSum) {
		this.goodsSum = goodsSum;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getMembersId() {
		return membersId;
	}
	public void setMembersId(Integer membersId) {
		this.membersId = membersId;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	


}
