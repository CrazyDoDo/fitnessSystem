package cn.fitnessmanage.dao.customer;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Customer;
import cn.fitnessmanage.pojo.Employees;

/**
 *@author唐凡
 *@time2017-7-25-上午9:40:26
 *@description
 */
public interface CustomerMapper {

		public int addCustomer(Customer customer )throws Exception;
		
		public List<Customer> getCustomerList(@Param("emplName") String emplName,
				@Param("custName") String custName,@Param("date1") String date1,@Param("date2") String date2,
				@Param("form") Integer form,@Param("pageSize") Integer pageSize)throws Exception;
		
		public int getCustomerCount(
				@Param("emplName") String emplName,
				@Param("custName") String custName,
				@Param("date1") String date1,
				@Param("date2") String date2)throws Exception;
		
		public int deleteCustomer(@Param("customerId")String customerId)throws Exception;
		
		public Customer getCustomerInfo(@Param("customerId")String customerId)throws Exception;
		
		public int updateCustomerInfo(Customer customer)throws Exception;
		
		public List<Employees> selectXiaoShouEmpl(
				@Param("emplName") String emplName,@Param("employeesId") String employeesId,
				@Param("form") Integer form,@Param("pageSize") Integer pageSize)throws Exception;

}
