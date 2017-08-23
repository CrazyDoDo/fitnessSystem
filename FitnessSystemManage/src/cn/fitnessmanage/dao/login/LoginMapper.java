package cn.fitnessmanage.dao.login;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Permissions;

/**
 *@author唐凡
 *@time2017-6-4-下午1:36:49
 *@description
 */
public interface LoginMapper {
	
	public Employees userLogin(@Param("username")String username,@Param("password") String password)throws Exception;

	public Permissions getPersissions(@Param("employeesTypeId")int employeesTypeId) throws Exception;
}
