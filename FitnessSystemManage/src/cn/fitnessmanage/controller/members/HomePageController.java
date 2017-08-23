package cn.fitnessmanage.controller.members;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.SwipingRecord;
import cn.fitnessmanage.service.members.MembersService;
import cn.fitnessmanage.tools.Constants;

/**
 *@author唐凡
 *@time2017-6-5-上午10:39:14
 *@description
 */
@Controller
@RequestMapping("fitness")
public class HomePageController {
	private Logger logger=Logger.getLogger(HomePageController.class);
	@Resource
	private MembersService membersService;
	
	/**
	 * 异步请求会员信息
	 * @param membersId
	 * @return
	 */
	@RequestMapping(value="/memInfoSelect")
	@ResponseBody
	public Members getMembersInfo(@RequestParam(value="membersId")String membersId,
									HttpSession session){
		Members  members=null;
		try {
			  members=membersService.getMembersInfo(membersId);
			  //创建刷卡对象,存入刷卡信息
			  SwipingRecord swiping=new SwipingRecord();
			  swiping.setDate(new Date());
			  swiping.setStratDate(new Date());
			  swiping.setEmployeesId(((Employees)session.getAttribute(Constants.USER_SESSION)).getEmployeesId());
			  swiping.setMembersId(members.getMembersId());
			  swiping.setSwipingSum(1);
			  int sum=membersService.addSwipingInfo(swiping);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return members;
	}
	/**
	 * 异步请求会员刷卡信息
	 * @param membersId
	 * @return
	 */	
	@RequestMapping(value="swipingInfoSelect")
	@ResponseBody
	public List<SwipingRecord> getSwipingInfo(@RequestParam(value="membersId")String membersId){
		List<SwipingRecord>  swiping=null;
		try {
			swiping=membersService.getSwipingInfo(membersId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return swiping;
	}
	/**
	 * 检查session内存的User是否失效
	 */
	@RequestMapping("checkUser.html")
	@ResponseBody
	public String checkUser(HttpSession session){
		Employees employees=(Employees)session.getAttribute(Constants.USER_SESSION);
		if(employees == null){
			return "true";
		}else{
			return "false";
		}
		
	}
	 
}
