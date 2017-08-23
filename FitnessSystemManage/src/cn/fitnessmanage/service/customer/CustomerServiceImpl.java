package cn.fitnessmanage.service.customer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.customer.CustomerMapper;
import cn.fitnessmanage.pojo.Customer;
import cn.fitnessmanage.pojo.Employees;

/**
 *@author唐凡
 *@time2017-7-25-上午9:49:45
 *@description
 */
@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Resource
	private CustomerMapper mapper;
	/**
	 * 添加访问客户
	 */
	public int addCustomer(Customer customer) throws Exception {
		return mapper.addCustomer(customer);
	}
	/**
	 * 分页返回返回客户信息-
	 */
	public List<Customer> getCustomerList(String emplName,String custName,
			String date1, String date2, Integer form, Integer pageSize)
			throws Exception {
		return mapper.getCustomerList(emplName,custName, date1, date2, form, pageSize);
	}
	/**
	 * 返回客户总记录数
	 */
	public int getCustomerCount(String emplName,String custName, 
			String date1, String date2) throws Exception {
		return mapper.getCustomerCount(emplName,custName, date1, date2);
	}
	/**
	 * 删除客户访问记录
	 */
	public int deleteCustomer(String customerId) throws Exception {
		return mapper.deleteCustomer(customerId);
	}
	/**
	 * 根据客户编号,查找客户信息
	 */
	public Customer getCustomerInfo(String customerId) throws Exception {
		return mapper.getCustomerInfo(customerId);
	}
	/**
	 * 修改客户信息
	 */
	public int updateCustomerInfo(Customer customer) throws Exception {
		return mapper.updateCustomerInfo(customer);
	}
	/**
	 * 分页返回,销售人员的销售信息
	 */
	public List<Employees> selectXiaoShouEmpl(String emplName,
			String employeesId, Integer form, Integer pageSize)
			throws Exception {
		return mapper.selectXiaoShouEmpl(emplName, employeesId, form, pageSize);
	}

}
