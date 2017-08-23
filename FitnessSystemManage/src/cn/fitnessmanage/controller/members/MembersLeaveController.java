package cn.fitnessmanage.controller.members;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.service.members.MembersService;

/**
 *@author唐凡
 *@time2017-7-23-下午1:28:59
 *@description
 */
@Controller
@RequestMapping("fitness/membersLeaveController")
public class MembersLeaveController {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@Resource
	private MembersService membersService;

	/**
	 * 前往会员请假页面
	 */
	@RequestMapping("goMembrseLeave")
	public String goMembrseLeave(){
		return "membrse/membrseLeave";
	}
	
	/**
	 * 前往会员挂失页面
	 */
	@RequestMapping("goMembrseCardLoss")
	public String goMembrseCardLoss(){
		return "membrse/membrseCardLoss";
	}
	
	/**
	 * 前往会员补办页面
	 */
	@RequestMapping("goMembrseReplace")
	public String goMembrseReplace(){
		return "membrse/membrseReplace";
	}
	
	@RequestMapping("membrseLeave")
	@ResponseBody
	public Object membrseLeave(@RequestParam("membersId")String membersId,
			@RequestParam("date")String date){
		String err="";
		Members members;
		try {
			members = membersService.getMembersInfo(membersId);
			if(members==null){
				err="1";
			}
			Calendar calendaradd = Calendar.getInstance();
			calendaradd.setTime(sdf.parse(members.getStopDate()));// 获取该会员的到期时间
			calendaradd.add(Calendar.DAY_OF_YEAR, Integer.parseInt(date));// 对会员到期时间进行修改
			String overDate = sdf.format(calendaradd.getTime());//请假后的到期时间
			int result=membersService.updatemembersDate(members.getMembersId().toString(), overDate);
			if(result>0){
				err="2";
			}else{
				err="3";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return err;
	}
	
	/**
	 * 会员卡挂失业务
	 * @param membersId
	 * @return
	 */
	@RequestMapping("membrseCardLoss")
	@ResponseBody
	public int membrseCardLoss(@RequestParam("membersId")String membersId){
		int result=0;
		try {
			Members mem=membersService.getMembersInfo(membersId);
			if(mem==null)
				result=1;
			mem.setState("已挂失,不可用");
			if(membersService.updateMembersInfo(mem)>0){
				result=2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 会员卡补办业务
	 * @param membersId
	 * @return
	 */
	@RequestMapping("membrseReplace")
	@ResponseBody
	public int membrseReplace(@RequestParam("membersId")String membersId){
		int result=0;
		try {
			Members mem=membersService.getMembersInfo(membersId);
			if(mem==null)
				result=1;
			mem.setState("正常");
			if(membersService.updateMembersInfo(mem)>0){
				result=2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
