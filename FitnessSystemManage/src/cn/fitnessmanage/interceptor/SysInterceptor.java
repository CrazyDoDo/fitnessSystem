package cn.fitnessmanage.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSON;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.tools.Constants;

public class SysInterceptor extends HandlerInterceptorAdapter {
	private Logger logger = Logger.getLogger(SysInterceptor.class);
	
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler) throws Exception{
		logger.debug("SysInterceptor preHandle ==========================");
		HttpSession session = request.getSession();
		
		Employees employees=(Employees)session.getAttribute(Constants.USER_SESSION);
		if(null != employees){ //dev SUCCESS
			return true;
		}else{
			/*判断是传统的请求,还是异步请求
			 * request.getHeader("X-Requested-With")
			 x-requested-with 信息项是否有无，如果无该头信息项，
			 取出的是未定义的值，即null，则说明是传统请求；如果存在该头信息项，
			 值是XMLHttpRequest 则说明是Ajax请求；*/
		      String XRequested =request.getHeader("X-Requested-With");
		      if("XMLHttpRequest".equals(XRequested)){
		    	  String info=JSON.toJSONString("isAjax");
		        response.getWriter().write(info);
		      }else{
		        response.sendRedirect(request.getContextPath()+"/403.jsp");
		      }
			return false;
		}
		
	}
}
