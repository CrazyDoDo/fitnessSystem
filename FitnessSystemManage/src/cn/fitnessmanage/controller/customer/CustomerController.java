package cn.fitnessmanage.controller.customer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.fitnessmanage.pojo.Customer;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.service.customer.CustomerService;
import cn.fitnessmanage.service.employees.EmployeesService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-7-24-下午12:22:04
 *@description
 */
@Controller
@RequestMapping("fitness/customerController")
public class CustomerController {
	@Resource
	private EmployeesService employeesService;
	
	@Resource
	private CustomerService customerService;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	private PageSupport page;
	/**
	 * 前往客户登记页面
	 * @return
	 */
	@RequestMapping("goCustomerDengji")
	public String goCustomerDengji(HttpServletRequest request,@ModelAttribute("customer")Customer customer){
		try {
			//加载销售人员信息
			List<Employees> salesList=employeesService.getXiaoshouList();
			request.getSession().setAttribute("selesList", salesList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/customerDengji";
	}
	
	/**
	 * 执行访问客户登记
	 * @return
	 */
	@RequestMapping("cusomerAdd")
	@ResponseBody
	public Object cusomerAdd(Customer customer,HttpServletRequest request,
			@RequestParam(value="address",required=false) String address){
		Map<String ,String> map=new HashMap<String, String>();
		try {
			customer.setAddress(address);
			customer.setStartDate(new Date());
			customer.setState("未回访");
			if(request.getParameter("birthday")!=null && ! request.getParameter("birthday").equals(""))
				customer.setBirthday(sdf.parse(request.getParameter("birthday")));
			int result=customerService.addCustomer(customer);
			if(result>0)
					map.put("retu","true");
			else
					map.put("retu", "false");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return JSON.toJSONString(map);
	}
	
	/**
	 * 前往客户资源管理页面
	 */
	@RequestMapping("goCustomerTable")
	public String goCustomerTable(){
		return "customer/customerTable";
	}
	
	/**
	 * 分页返回客户信息
	 */
	@RequestMapping("getCustomerList.json")
	@ResponseBody
	public PageSupport getCustomerList(@RequestParam(value="emplName",required=false)String emplName,
			@RequestParam(value="custName",required=false)String custName,@RequestParam(value="date1",required=false)String date1,
			@RequestParam(value="date2",required=false)String date2,@RequestParam(value="pageIndex",required=false)String pageIndex){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(customerService.getCustomerCount(emplName,custName, date1, date2));
			List<Customer> customerList=customerService.getCustomerList(emplName,custName, date1, date2,(page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setCustomerList(customerList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
	}
	/**
	 * 删除访问客户信息
	 * @param customerId
	 * @return
	 */
	@RequestMapping("deleteCustomer.json")
	@ResponseBody
	public Object deleteCustomer(@RequestParam(value="customerId",required=false)String customerId){
		Integer result=0;
		try {
			 result=customerService.deleteCustomer(customerId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 前往修改客户信息页面
	 * @return
	 */
	@RequestMapping("updateCustomer")
	public String updateCustomer(@RequestParam("customerId")String customerId,HttpServletRequest request,
			@ModelAttribute("updateCustomer") Customer updateCustomer){
		try {
			request.getSession().setAttribute("customer", customerService.getCustomerInfo(customerId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "customer/updateCustomer";
	}
	
	/**
	 * 修改客户信息
	 * @return
	 */
	@RequestMapping("updateCustomerInfo.json")
	@ResponseBody
	public  Object updateCustomerInfo(Customer updateCustomer){
		Integer result = 0;
		try {
			result = customerService.updateCustomerInfo(updateCustomer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 前往销售经理页面
	 * @return
	 */
	@RequestMapping("goCustomerFenpei")
	public String goCustomerFenpei(){
		return "customer/customerFenpei";
	}
	
	/**
	 * 更改客户的销售人员
	 * @return
	 */
	@RequestMapping("updateCustomerEmp.json")
	@ResponseBody
	public Object updateCustomerEmp(@RequestParam("employeesId")String employeesId,
			@RequestParam("customerId")String customerId){
		Integer result=0;
		try {
			Customer customer=customerService.getCustomerInfo(customerId);
			customer.setEmployeesId(Integer.parseInt(employeesId));
			result=customerService.updateCustomerInfo(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	/**
	 * 前往销售业绩报表
	 * @return
	 */
	@RequestMapping("goXiaoshouYeJi")
	public String goXiaoshouYeJi(){
		return "customer/xiaoshouYeJi";
	}
	
	/**
	 * 分页返回,销售人员的销售信息
	 * @return
	 */
	@RequestMapping("getXiaoShouEmpl.json")
	@ResponseBody
	public PageSupport getXiaoShouEmpl(@RequestParam("emplName")String emplName,
			@RequestParam("employeesId")String employeesId,@RequestParam(value="pageIndex",required=false)String pageIndex){
		page=new PageSupport();
		//获取当前页码
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			List<Employees> emplyeesList=customerService.selectXiaoShouEmpl(emplName, employeesId, (page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			int totalCount=customerService.selectXiaoShouEmpl(emplName, employeesId, 0, 1000).size();
			page.setTotalCount(totalCount);
			page.setEmployeesList(emplyeesList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
		
	}
	
	/**
	 * 个人销售列表
	 * @return
	 */
	@RequestMapping("goGeRenxiaoshou")
	public String goGeRenxiaoshou(HttpServletRequest request,@RequestParam("employeesName")String employeesName){
		request.setAttribute("employeesName", employeesName);
		return "customer/geRenXiaoShou";
	}
}
