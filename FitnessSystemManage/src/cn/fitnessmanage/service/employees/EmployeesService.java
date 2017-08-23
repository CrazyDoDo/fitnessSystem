package cn.fitnessmanage.service.employees;

import java.util.List;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.EmployeesType;
import cn.fitnessmanage.pojo.Permissions;
import cn.fitnessmanage.pojo.SystemLog;

/**
 *@author唐凡
 *@time2017-6-11-下午1:21:07
 *@description
 */
public interface EmployeesService {
	public List<Employees> getXiaoshouList() throws Exception;
	
	public List<Employees> getPersonalList() throws Exception;
	
	public int updateEmployees(Employees emloyees)throws Exception;
	
	public int deleteEmployees(String employeesId)throws Exception;
	
	public List<Employees> getEmployeesList(Integer employeesId,String name,
			Integer typeId,Integer form,Integer pageSize)throws Exception;
	
	public int getEmployeesListCount(Integer employeesId,String name,
			Integer typeId)throws Exception;;
			
	public int addEmployees(Employees employees)throws Exception;
	
	public List<EmployeesType> getEmployeesTypeList(String typeName,Integer form,Integer pageSize)throws  Exception;
	
	public int getEmployeesTypeCount(String typeName)throws Exception;
	
	public Integer getMaxEmployeesId()throws Exception;
	
	public int addSystemLog(SystemLog systemlog)throws Exception;
	
	public int deleteEmployeesType(String employeesTypeId)throws Exception;
	
	public int addEmployeesType(EmployeesType employeesType)throws Exception;
	
	public int updateEmployeesType(EmployeesType employeesType)throws Exception;
	
	public int addPermissions(Permissions persission)throws Exception;
	
	public int updatePermissions(Permissions persission)throws Exception;
	
	public int deletePermissions(String employeesTypeId)throws Exception;
	
	public EmployeesType getEmployeesTypeInfo(String employeesTypeId)throws Exception;
	
	public List<SystemLog> getSystemLogList(String name,String date1,String date2,
			Integer form,Integer pageSize)throws Exception;
	
	public int getSystemLogCount(String name,String date1,String date2)throws Exception;

}
