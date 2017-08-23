package cn.fitnessmanage.controller.employees;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.EmployeesType;
import cn.fitnessmanage.pojo.GoodsOrder;
import cn.fitnessmanage.pojo.Permissions;
import cn.fitnessmanage.pojo.SystemLog;
import cn.fitnessmanage.service.employees.EmployeesService;
import cn.fitnessmanage.service.login.LoginService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-8-18-下午1:59:16
 *@description
 */
@Controller
@RequestMapping("fitness/emoloyeesController")
public class employeesController {
	
	@Resource
	private EmployeesService employeesService;
	
	@Resource
	private LoginService loginService;
	
	private PageSupport page;
	
	private Integer result=0;
	
	private SystemLog syst=new SystemLog();
	

	/**
	 * 前往员工列表页面
	 * @return
	 */
	@RequestMapping("goEmployeesTable")
	public String goEmployeesTable(HttpServletRequest request){
		try {
			request.getSession().setAttribute("empTypeList", employeesService.getEmployeesTypeList(null,0, 100));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "systemManage/employeesTable";
	}
	
	/**
	 * 前往添加员工信息页面
	 * @return
	 */
	@RequestMapping("goAddEmployees")
	public String goAddEmployees(HttpServletRequest request){
		try {
			request.setAttribute("sum", "3");
			request.setAttribute("maxEmpId", employeesService.getMaxEmployeesId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "systemManage/addEmployees";
	}
	/**
	 * 前往修改员工信息页面
	 * @return
	 */
	@RequestMapping("goUpdateEmployees")
	public String goUpdateEmployees(@RequestParam("employeesId")Integer employeesId,HttpServletRequest request){
		try {
			request.setAttribute("emp", employeesService.getEmployeesList(employeesId, null, null, 0, 10).get(0));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "systemManage/updateEmployees";
	}
	
	
	/**
	 * 返回所有员工信息
	 */
	@RequestMapping("getEmployeesList.json")
	@ResponseBody
	public PageSupport getEmployeesList(@RequestParam("pageIndex")String pageIndex,Employees emp){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(employeesService.getEmployeesListCount(emp.getEmployeesId(), emp.getName(), emp.getTypeId()));
			List<Employees> employeesList=employeesService.getEmployeesList(emp.getEmployeesId(), emp.getName(), emp.getTypeId(),(page.getCurrentPageNo()-1)*page.getPageSize(),  page.getPageSize());
			page.setEmployeesList(employeesList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	/**
	 * 添加员工信息
	 */
	@RequestMapping("addEmployees")
	public String addEmployees(Employees employees,HttpServletRequest request,
			@RequestParam("address1")String address1,@RequestParam("address2")String address2,@RequestParam("address3")String address3){
		try {
			employees.setAddress(address1+address2+address3);
			employees.setStratDate(new Date());
			result=employeesService.addEmployees(employees);
			if(result>0){
				syst.setDate(new Date());
				syst.setEmployeesId(((Employees)request.getSession().getAttribute(Constants.USER_SESSION)).getEmployeesId());
				syst.setModule("系统管理");
				syst.setComment("添加员工,工号为"+employees.getEmployeesId());
				int sum=employeesService.addSystemLog(syst);
			}
			request.setAttribute("emp", employees);
			request.setAttribute("maxEmpId", employees.getEmployeesId());
			request.setAttribute("address3", address3);
		} catch (Exception e) {
			request.setAttribute("sum", "4");
			e.printStackTrace();
		}
		if(result>0)
			request.setAttribute("sum", "1");
		else
			request.setAttribute("sum", "2");
		
		return "systemManage/addEmployees";
	}
	
	/**
	 * 删除员工
	 */
	@RequestMapping("deleteEmployees")
	public String deleteEmployees(@RequestParam("employeesId")String employeesId,HttpServletRequest request){
		try {
			result=employeesService.deleteEmployees(employeesId);
			if(result>0){
				syst.setDate(new Date());
				syst.setEmployeesId(((Employees)request.getSession().getAttribute(Constants.USER_SESSION)).getEmployeesId());
				syst.setModule("系统管理");
				syst.setComment("删除员工,工号为"+employeesId);
				int sum=employeesService.addSystemLog(syst);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "systemManage/addEmployees";
	}
	
	/**
	 * 修改员工信息
	 */
	@RequestMapping("updateEmployees")
	public String updateEmployees(Employees employees,HttpServletRequest request){
		try {
			result=employeesService.updateEmployees(employees);
			request.setAttribute("emp", employees);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0)
			request.setAttribute("sum", "1");
		else
			request.setAttribute("sum", "2");
		
		return "systemManage/updateEmployees";
	}
	
	
	/**
	 * 前往岗位列表页面
	 * @return
	 */
	@RequestMapping("goStationTable")
	public String goStationTable(HttpServletRequest request){
		try {
			request.getSession().setAttribute("empTypeList", employeesService.getEmployeesTypeList(null,0, 100));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "systemManage/stationTable";
	}
	
	/**
	 * 前往添加岗位信息页面
	 * @return
	 */
	@RequestMapping("goAddStation")
	public String goAddStation(HttpServletRequest request){
		return "systemManage/addStation";
	}
	
	/**
	 * 前往修改岗位信息页面
	 * @return
	 */
	@RequestMapping("goUpdateStation")
	public String goUpdateStation(@RequestParam("employeesTypeId")String employeesTypeId,HttpServletRequest request){
		try {
			EmployeesType emp=employeesService.getEmployeesTypeInfo(employeesTypeId);
			request.setAttribute("empType",emp );
			request.setAttribute("permissions", loginService.getPersissions(emp.getEmployeesTypeId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "systemManage/updateStation";
	}
	
	/**
	 * 返回所有岗位信息
	 */
	@RequestMapping("getEmployeesTypeList.json")
	@ResponseBody
	public PageSupport getEmployeesTypeList(@RequestParam("pageIndex")String pageIndex,@RequestParam("typeName")String typeName){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(employeesService.getEmployeesTypeCount(typeName));
			List<EmployeesType> employeesTypeList=employeesService.getEmployeesTypeList(typeName,(page.getCurrentPageNo()-1)*page.getPageSize(),  page.getPageSize());
			page.setEmployeesTypeList(employeesTypeList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	/**
	 * 添加岗位信息
	 * @return
	 */
	@RequestMapping("addEmployeesType.json")
	@ResponseBody
	public Integer addEmployeesType(Permissions permissions ,EmployeesType employeesType,HttpServletRequest request){
		try {
			result=employeesService.addEmployeesType(employeesType);
			if(result>0){
				//添加岗位成功后,返回主键作为权限的类型Id;
				System.out.println("++++++++++++++++++++++++"+employeesType.getEmployeesTypeId());
				permissions.setEmployeesTypeId(employeesType.getEmployeesTypeId());
				result=employeesService.addPermissions(permissions);
				
				syst.setDate(new Date());
				syst.setEmployeesId(((Employees)request.getSession().getAttribute(Constants.USER_SESSION)).getEmployeesId());
				syst.setModule("系统管理");
				syst.setComment("删除"+employeesType.getTypeName()+"岗位");
				int sum=employeesService.addSystemLog(syst);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
		
	}
	
	/**
	 * 修改岗位信息
	 * @return
	 */
	@RequestMapping("updateEmployeesType.json")
	@ResponseBody
	public Integer updateEmployeesType(Permissions permissions ,EmployeesType employeesType){
		try {
			result=employeesService.updateEmployeesType(employeesType);
			if(result>0){
				Permissions permiss=loginService.getPersissions(permissions.getEmployeesTypeId());
				if(permiss==null)
					result=employeesService.addPermissions(permissions);
				else
					result=employeesService.updatePermissions(permissions);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
		
	}

	/**
	 * 删除岗位信息
	 * @return
	 */
	@RequestMapping("deleteEmployeesType.json")
	@ResponseBody
	public Integer deleteEmployeesType(@RequestParam("employeesTypeId")String employeesTypeId,@RequestParam("typeName")String typeName,
			HttpServletRequest request){
		try {
			result=employeesService.deleteEmployeesType(employeesTypeId);
			if(result>0){
					syst.setDate(new Date());
					syst.setEmployeesId(((Employees)request.getSession().getAttribute(Constants.USER_SESSION)).getEmployeesId());
					syst.setModule("系统管理");
					syst.setComment("删除"+typeName+"岗位");
					int sum=employeesService.addSystemLog(syst);
					result=employeesService.deletePermissions(employeesTypeId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
		
	}
	
	/**
	 * 前往系统日志页面
	 * @return
	 */
	@RequestMapping("goSystemLogTable")
	public String goSystemLogTable(HttpServletRequest request){
		return "systemManage/systemLogTable";
	}	
	
	
	/**
	 * 返回系统日志
	 */
	@RequestMapping("getSystemLogList.json")
	@ResponseBody
	public PageSupport getSystemLogList(@RequestParam("pageIndex")String pageIndex,@RequestParam("name")String name,
			@RequestParam("date1")String date1,@RequestParam("date2")String date2){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(employeesService.getSystemLogCount(name, date1, date2));
			List<SystemLog> systemLogList=employeesService.getSystemLogList(name, date1, date2,(page.getCurrentPageNo()-1)*page.getPageSize(),  page.getPageSize());
			page.setSystemLogList(systemLogList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}	
	
}
