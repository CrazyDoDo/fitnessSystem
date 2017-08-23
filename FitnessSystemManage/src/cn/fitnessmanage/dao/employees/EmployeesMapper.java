package cn.fitnessmanage.dao.employees;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.EmployeesType;
import cn.fitnessmanage.pojo.Permissions;
import cn.fitnessmanage.pojo.SystemLog;

/**
 *@author唐凡
 *@time2017-6-11-下午12:34:23
 *@description
 */
public interface EmployeesMapper {

	public List<Employees> getXiaoshouList() throws Exception;
	
	public List<Employees> getPersonalList() throws Exception;
	
	public int updateEmployees(Employees emloyees)throws Exception;
	
	public int deleteEmployees(@Param("employeesId")String employeesId)throws Exception;
	
	public int addEmployees(Employees employees)throws Exception;
	
	public List<Employees> getEmployeesList(@Param("employeesId")Integer employeesId,@Param("name")String name,
			@Param("typeId")Integer typeId,@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws Exception;
	
	public int getEmployeesListCount(@Param("employeesId")Integer employeesId,@Param("name")String name,
			@Param("typeId")Integer typeId)throws Exception;
	
	public List<EmployeesType> getEmployeesTypeList(@Param("typeName")String typeName,@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws  Exception;

	public int getEmployeesTypeCount(@Param("typeName")String typeName)throws Exception;
		
	public Integer getMaxEmployeesId()throws Exception;
	
	public int addSystemLog(SystemLog systemlog)throws Exception;
	
	public int deleteEmployeesType(@Param("employeesTypeId")String employeesTypeId)throws Exception;
	
	public int addEmployeesType(EmployeesType employeesType)throws Exception;
	
	public int updateEmployeesType(EmployeesType employeesType)throws Exception;
	
	public int addPermissions(Permissions persission)throws Exception;
	
	public int updatePermissions(Permissions persission)throws Exception;
	
	public int deletePermissions(@Param("employeesTypeId")String employeesTypeId)throws Exception;
	
	public EmployeesType getEmployeesTypeInfo(@Param("employeesTypeId")String employeesTypeId)throws Exception;
	
	public List<SystemLog> getSystemLogList(@Param("name")String name,@Param("date1")String date1,@Param("date2")String date2,
			@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws Exception;
	
	public int getSystemLogCount(@Param("name")String name,@Param("date1")String date1,@Param("date2")String date2)throws Exception;
	
}
