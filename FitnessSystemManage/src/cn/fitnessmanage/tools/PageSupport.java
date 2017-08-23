package cn.fitnessmanage.tools;

import java.util.List;

import cn.fitnessmanage.pojo.Curriculum;
import cn.fitnessmanage.pojo.Customer;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.EmployeesType;
import cn.fitnessmanage.pojo.Goods;
import cn.fitnessmanage.pojo.GoodsOrder;
import cn.fitnessmanage.pojo.GoodsType;
import cn.fitnessmanage.pojo.Locker;
import cn.fitnessmanage.pojo.LockerOrder;
import cn.fitnessmanage.pojo.MembersSwipingCount;
import cn.fitnessmanage.pojo.PersonalCurr;
import cn.fitnessmanage.pojo.PersonalDrop;
import cn.fitnessmanage.pojo.PersonalLever;
import cn.fitnessmanage.pojo.PersonalOrder;
import cn.fitnessmanage.pojo.SwipingRecord;
import cn.fitnessmanage.pojo.SystemLog;

public class PageSupport {
	//当前页码-来自于用户输入
	private int currentPageNo = 1;
	
	//总数量（表）
	private int totalCount = 0;
	
	//页面容量
	private int pageSize = 0;
	
	//总页数-totalCount/pageSize（+1）
	private int totalPageCount = 1;
	
	//员工信息集合
	private List<Employees> employeesList;
	
	//会员购买私教课详情集合
	private List<PersonalOrder> personalOrderList;
	
	//会员刷卡信息集合
	private List<SwipingRecord> swipingRecordList;
	
	//会员租柜信息集合
	private List<LockerOrder> lockerOrderList;
	
	//当天会员刷卡统计
	private List<MembersSwipingCount> membersSwipingCount;
	
	//返回所有客户信息类列表
	private List<Customer> customerList;
	
	//会员预约上课集合
	private List<PersonalDrop> personalDropList;
	
	private List<PersonalLever> personalLeverList;
	
	//课程表集合
	private List<Curriculum> curriculumList;
	
	//教练代课集合
	private List<PersonalCurr> personalCurrList;
	
	//储物柜集合
	private List<Locker> lokcerList;
	
	//商品订单集合
	private List<GoodsOrder> goodsOrderList;
	
	//商品集合
	private List<Goods> goodsList;
	
	//商品类型集合
	private List<GoodsType> goodsTypeList;
	
	//岗位集合
	private List<EmployeesType> employeesTypeList;
	
	//系统日志集合
	private List<SystemLog> systemLogList;
	

	public List<SystemLog> getSystemLogList() {
		return systemLogList;
	}

	public void setSystemLogList(List<SystemLog> systemLogList) {
		this.systemLogList = systemLogList;
	}

	public List<EmployeesType> getEmployeesTypeList() {
		return employeesTypeList;
	}

	public void setEmployeesTypeList(List<EmployeesType> employeesTypeList) {
		this.employeesTypeList = employeesTypeList;
	}

	public List<GoodsOrder> getGoodsOrderList() {
		return goodsOrderList;
	}

	public void setGoodsOrderList(List<GoodsOrder> goodsOrderList) {
		this.goodsOrderList = goodsOrderList;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	public List<GoodsType> getGoodsTypeList() {
		return goodsTypeList;
	}

	public void setGoodsTypeList(List<GoodsType> goodsTypeList) {
		this.goodsTypeList = goodsTypeList;
	}

	public List<Locker> getLokcerList() {
		return lokcerList;
	}

	public void setLokcerList(List<Locker> lokcerList) {
		this.lokcerList = lokcerList;
	}

	public List<PersonalCurr> getPersonalCurrList() {
		return personalCurrList;
	}

	public void setPersonalCurrList(List<PersonalCurr> personalCurrList) {
		this.personalCurrList = personalCurrList;
	}


	public List<Curriculum> getCurriculumList() {
		return curriculumList;
	}

	public void setCurriculumList(List<Curriculum> curriculumList) {
		this.curriculumList = curriculumList;
	}

	public List<PersonalLever> getPersonalLeverList() {
		return personalLeverList;
	}

	public void setPersonalLeverList(List<PersonalLever> personalLeverList) {
		this.personalLeverList = personalLeverList;
	}

	public List<PersonalDrop> getPersonalDropList() {
		return personalDropList;
	}

	public void setPersonalDropList(List<PersonalDrop> personalDropList) {
		this.personalDropList = personalDropList;
	}

	public List<Employees> getEmployeesList() {
		return employeesList;
	}

	public void setEmployeesList(List<Employees> employeesList) {
		this.employeesList = employeesList;
	}

	public List<Customer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}

	public List<MembersSwipingCount> getMembersSwipingCount() {
		return membersSwipingCount;
	}

	public void setMembersSwipingCount(List<MembersSwipingCount> membersSwipingCount) {
		this.membersSwipingCount = membersSwipingCount;
	}

	public List<LockerOrder> getLockerOrderList() {
		return this.lockerOrderList;
	}

	public void setLockerOrderList(List<LockerOrder> lockerOrderList) {
		this.lockerOrderList = lockerOrderList;
	}

	public List<SwipingRecord> getSwipingRecordList() {
		return this.swipingRecordList;
	}

	public void setSwipingRecordList(List<SwipingRecord> swipingRecordList) {
		this.swipingRecordList = swipingRecordList;
	}

	public List<PersonalOrder> getPersonalOrderList() {
		return this.personalOrderList;
	}

	public void setPersonalOrderList(List<PersonalOrder> personalOrderList) {
		this.personalOrderList = personalOrderList;
	}

	public int getCurrentPageNo() {
		return currentPageNo;
	}

	public void setCurrentPageNo(int currentPageNo) {
		if(currentPageNo > 0){
			this.currentPageNo = currentPageNo;
		}else if(currentPageNo>this.totalPageCount){
			this.currentPageNo=this.totalPageCount;
		}
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if(totalCount > 0){
			this.totalCount = totalCount;
			//设置总页数
			this.setTotalPageCountByRs();
		}
	}
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize > 0){
			this.pageSize = pageSize;
		}
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount() {
		if(this.totalCount % this.pageSize == 0){
			this.totalPageCount = this.totalCount / this.pageSize;
		}else if(this.totalCount % this.pageSize > 0){
			this.totalPageCount = this.totalCount / this.pageSize + 1;
		}else{
			this.totalPageCount = 0;
		}
	}
	
	public void setTotalPageCountByRs(){
		if(this.totalCount % this.pageSize == 0){
			this.totalPageCount = this.totalCount / this.pageSize;
		}else if(this.totalCount % this.pageSize > 0){
			this.totalPageCount = this.totalCount / this.pageSize + 1;
		}else{
			this.totalPageCount = 0;
		}
	}
	
}