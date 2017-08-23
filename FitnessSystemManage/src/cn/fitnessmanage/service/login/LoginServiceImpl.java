package cn.fitnessmanage.service.login;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.login.LoginMapper;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Permissions;

/**
 *@author唐凡
 *@time2017-6-4-下午3:28:53
 *@description
 */
@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper mapper;
	/**
	 * 用户登录
	 */
	public Employees userLogin(String username, String password)
			throws Exception {
		return mapper.userLogin(username, password);
	}
	/**
	 * 搜索用户权限
	 */
	public Permissions getPersissions(int employeesTypeId) throws Exception {
		return mapper.getPersissions(employeesTypeId);
	}

}
