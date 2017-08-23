package cn.fitnessmanage.service.customer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Customer;
import cn.fitnessmanage.pojo.Employees;

/**
 *@author唐凡
 *@time2017-7-25-上午9:49:20
 *@description
 */
public interface CustomerService {
	public int addCustomer(Customer customer )throws Exception;
	
	public List<Customer> getCustomerList(
			String emplName,
			String custName,
			String date1,String date2,
			Integer form,Integer pageSize)throws Exception;
	
	public int getCustomerCount(
			String emplName,
			String custName,
			String date1,String date2)throws Exception;
	
	public int deleteCustomer(String customerId)throws Exception;
	
	public Customer getCustomerInfo(String customerId)throws Exception;
	
	public int updateCustomerInfo(Customer customer) throws Exception;
	
	public List<Employees> selectXiaoShouEmpl(
			String emplName, String employeesId,
			 Integer form, Integer pageSize)throws Exception;
}
