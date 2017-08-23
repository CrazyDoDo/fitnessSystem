package cn.fitnessmanage.service.login;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Permissions;

/**
 *@author唐凡
 *@time2017-6-4-下午3:28:26
 *@description
 */
public interface LoginService {

	public Employees userLogin(String username,String password) throws Exception;
	
	public Permissions getPersissions(int employeesTypeId) throws Exception;
}
