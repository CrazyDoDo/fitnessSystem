package cn.fitnessmanage.pojo;
/**
 *@author 唐凡
 *@time2017-5-2-下午12:09:53
 *@description
 */
public class EmployeesType {
	private Integer employeesTypeId;
	private String typeName;
	private Integer price;
	private String common;
	private Integer fatheyTypeId;
	private String fatheyName;//扩展属性,父级职位名称
	
	
	public Integer getFatheyTypeId() {
		return fatheyTypeId;
	}
	public void setFatheyTypeId(Integer fatheyTypeId) {
		this.fatheyTypeId = fatheyTypeId;
	}
	public String getFatheyName() {
		return fatheyName;
	}
	public void setFatheyName(String fatheyName) {
		this.fatheyName = fatheyName;
	}
	public String getCommon() {
		return common;
	}
	public void setCommon(String common) {
		this.common = common;
	}
	public Integer getEmployeesTypeId() {
		return employeesTypeId;
	}
	public void setEmployeesTypeId(Integer employeesTypeId) {
		this.employeesTypeId = employeesTypeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	

}
