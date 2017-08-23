package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Employees {
     private Integer employeesId;
     private String name;
     private String username;
     private String password;
     private String address;
     private String phone;
     private String sex;
     private String iD;
     @DateTimeFormat(pattern="yyyy-MM-dd")
     private Date dirthday;
     @DateTimeFormat(pattern="yyyy-MM-dd")
     private Date stratDate;
     private Integer leverId;
     private Integer typeId;
     private Integer fatherTypeId;
     
     private Integer sum;//扩展属性,记录手下的客户资源总数
     private Integer price;//扩展属性,健身教练课时单价
     private String leverName;//扩展属性,教练等级
     private String typeName;//扩展属性,员工职位
     
     
     
     
	public String getiD() {
		return iD;
	}
	public void setiD(String iD) {
		this.iD = iD;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDirthday() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(dirthday);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	public void setDirthday(Date dirthday) {
		this.dirthday = dirthday;
	}
	public String getStratDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(stratDate);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
	public void setStratDate(Date stratDate) {
		this.stratDate = stratDate;
	}
	public Integer getLeverId() {
		return leverId;
	}
	public void setLeverId(Integer leverId) {
		this.leverId = leverId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getFatherTypeId() {
		return fatherTypeId;
	}
	public void setFatherTypeId(Integer fatherTypeId) {
		this.fatherTypeId = fatherTypeId;
	}
	public Integer getSum() {
		return sum;
	}
	public void setSum(Integer sum) {
		this.sum = sum;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getLeverName() {
		return leverName;
	}
	public void setLeverName(String leverName) {
		this.leverName = leverName;
	}
 
     
	
}
