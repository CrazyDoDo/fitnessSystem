package cn.fitnessmanage.service.employees;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.employees.EmployeesMapper;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.EmployeesType;
import cn.fitnessmanage.pojo.Permissions;
import cn.fitnessmanage.pojo.SystemLog;

/**
 *@author唐凡
 *@time2017-6-11-下午1:21:45
 *@description
 */
@Service 
public class EmployeesServiceImpl implements EmployeesService {
	
	@Resource
	private EmployeesMapper mapper;
	/**
	 * 查找所有 销售人员
	 */
	public List<Employees> getXiaoshouList() throws Exception {
		return mapper.getXiaoshouList();
	}
	/**
	 * 查找所有健身教练
	 */
	public List<Employees> getPersonalList() throws Exception {
		return mapper.getPersonalList();
	}
	/**
	 * 修改员工信息
	 */
	public int updateEmployees(Employees emloyees) throws Exception {
		return mapper.updateEmployees(emloyees);
	}
	/**
	 * 删除员工
	 */
	public int deleteEmployees(String employeesId) throws Exception {
		return mapper.deleteEmployees(employeesId);
	}
	/**
	 * 返回所有员工
	 */
	public List<Employees> getEmployeesList(Integer employeesId, String name,
			Integer typeId,Integer form,Integer pageSize) throws Exception {
		return mapper.getEmployeesList(employeesId, name, typeId,form,pageSize);
	}
	/**
	 * 返回员工的总数
	 */
	public int getEmployeesListCount(Integer employeesId, String name,
			Integer typeId) throws Exception {
		return mapper.getEmployeesListCount(employeesId, name, typeId);
	}
	/**
	 * 添加员工信息
	 */
	public int addEmployees(Employees employees) throws Exception {
		return mapper.addEmployees(employees);
	}
	/**
	 * 返回员工类型
	 */
	public List<EmployeesType> getEmployeesTypeList(String typeName,Integer form,Integer pageSize) throws Exception {
		return mapper.getEmployeesTypeList(typeName,form,pageSize);
	}
	/**
	 * 返回最大的员工工号
	 */
	public Integer getMaxEmployeesId() throws Exception {
		return mapper.getMaxEmployeesId();
	}
	/**
	 * 添加操作日志
	 */
	public int addSystemLog(SystemLog systemlog) throws Exception {
		return mapper.addSystemLog(systemlog);
	}
	
	/**
	 * 返回所有岗位集合总数
	 */
	public int getEmployeesTypeCount(String typeName) throws Exception {
		return mapper.getEmployeesTypeCount(typeName);
	}
	
	/**
	 * 删除岗位
	 */
	public int deleteEmployeesType(String employeesTypeId) throws Exception {
		
		return mapper.deleteEmployeesType(employeesTypeId);
	}
	
	/**
	 * 添加岗位
	 */
	public int addEmployeesType(EmployeesType employeesType) throws Exception {
		
		return mapper.addEmployeesType(employeesType);
	}
	
	/**
	 * 修改岗位
	 */
	public int updateEmployeesType(EmployeesType employeesType)
			throws Exception {
		
		return mapper.updateEmployeesType(employeesType);
	}
	
	/**
	 * 添加权限
	 */
	public int addPermissions(Permissions persission) throws Exception {
		
		return mapper.addPermissions(persission);
	}
	
	/**
	 * 修改权限
	 */
	public int updatePermissions(Permissions persission) throws Exception {
		
		return mapper.updatePermissions(persission);
	}
	
	/**
	 * 删除岗位时删除权限表中的相关记录
	 */
	public int deletePermissions(String employeesTypeId) throws Exception {
		
		return mapper.deletePermissions(employeesTypeId);
	}
	/**
	 * 根据主键查找岗位信息
	 */
	public EmployeesType getEmployeesTypeInfo(String employeesTypeId)
			throws Exception {
		return mapper.getEmployeesTypeInfo(employeesTypeId);
	}
	
	/**
	 * 返回系统日志
	 */
	public List<SystemLog> getSystemLogList(String name, String date1,
			String date2, Integer form, Integer pageSize) throws Exception {
		return mapper.getSystemLogList(name, date1, date2, form, pageSize);
	}
	
	/**
	 * 返回系统日志总记录数
	 */
	public int getSystemLogCount(String name, String date1, String date2)
			throws Exception {
		return mapper.getSystemLogCount(name, date1, date2);
	}
	
	
	
	

}
