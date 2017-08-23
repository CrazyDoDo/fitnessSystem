package cn.fitnessmanage.controller.login;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Permissions;
import cn.fitnessmanage.service.login.LoginService;
import cn.fitnessmanage.tools.Constants;

/**
 *@author唐凡
 *@time2017-6-4-下午1:35:29
 *@description
 */
@Controller
public class LoginController {
	
	@Resource
	private LoginService loginService;
	
	/**
	 * 403系统拦截,进入登陆页面
	 * @return
	 */
	@RequestMapping("dologin")
	public String login(){
		
		return "login";
	}
	
	/**
	 * 用户登录请求处理
	 * @param model
	 * @param session
	 * @param username
	 * @param password
	 * @param check
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public Object login(Model model,HttpSession session,
						@RequestParam("username")String username,
						@RequestParam("password")String password,
						@RequestParam("check")String check){
		HashMap<String, String> resultMap=new HashMap<String, String>();
		String yanzheng=(String)session.getAttribute("numrand");
		
		if( ! yanzheng.equals(check)){
			resultMap.put("result", "error1");
		}else{
			try {
				Employees employees = loginService.userLogin(username, password);
				if(employees!=null){
					Permissions perm=loginService.getPersissions(employees.getTypeId());
					resultMap.put("result", "employees");
					session.setAttribute(Constants.USER_SESSION, employees);
					session.setAttribute("perm",perm);
				}else{
					resultMap.put("result","error2");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}


		return JSONArray.toJSON(resultMap);
	}
	/**
	 * 退出登录,注销用户
	 * @param session
	 * @return
	 */
	@RequestMapping("loginOut")
	public String loginOut(HttpSession session){
		session.removeAttribute(Constants.USER_SESSION);
		session.removeAttribute("perm");
		return "login";
	}
	
	/**
	 * 	前往首页
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("main")
	public String main(HttpSession session,Model model){
		
		return "main";
	}
	
	
	@RequestMapping("homePage")
	public String homePage(){
		return "membrse/homePage";
	}
	
}
