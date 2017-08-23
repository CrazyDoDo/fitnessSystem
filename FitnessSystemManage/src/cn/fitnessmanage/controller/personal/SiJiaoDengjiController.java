package cn.fitnessmanage.controller.personal;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.PersonalDrop;
import cn.fitnessmanage.pojo.PersonalLever;
import cn.fitnessmanage.pojo.PersonalOrder;
import cn.fitnessmanage.service.employees.EmployeesService;
import cn.fitnessmanage.service.personal.PersonalService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-8-1-下午1:45:00
 *@description
 */
@Controller
@RequestMapping("fitness/siJiaoDengJi")
public class SiJiaoDengjiController {
	
	@Resource
	private PersonalService personalService;
	
	@Resource
	private EmployeesService employeesService;
	
	PageSupport page=null;

	/**
	 * 前往私教经理页面
	 * @return
	 */
	@RequestMapping("goPersonaldengji")
	public String goPersonaldengji(){
		return "personalTranier/personaldengji";
	}
	
	/**
	 * 前往添加私教等级页面
	 * @return
	 */
	@RequestMapping("goTianjiadengji")
	public String goTianjiadengji(){
		return "personalTranier/tianjiadengji";
	}
	
	/**
	 * 分页返回私教等级列表
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("getPersonalLeverList.json")
	@ResponseBody
	public PageSupport getPersonalLeverList(@RequestParam("pageIndex")String pageIndex){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(personalService.getPersonalLeverCount());
			List<PersonalLever> personalLeverList=personalService.getPersonalLeverList((page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setPersonalLeverList(personalLeverList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	} 
	
	@RequestMapping("goXiugaidengji")
	public String goXiugaidengji(@RequestParam(value="leverId",required=false)String leverId,
			HttpServletRequest reqeust){
		try {
			PersonalLever lever=personalService.getpersonalLeverInfo(leverId);
			reqeust.setAttribute("lever", lever);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "personalTranier/xiugaidengji";
	}
	
	/**
	 * 删除私教等级
	 * @return
	 */
	@RequestMapping("deletePersonallever.json")
	@ResponseBody
	public Integer deletePersonallever(@RequestParam("leverId")String leverId){
		Integer  result=0;
		try {
			result=personalService.deletePersoanlLever(leverId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 添加私教等级
	 * @return
	 */
	@RequestMapping("addPersonalLever.json")
	@ResponseBody
	public Integer addPersonalLever(PersonalLever lever,HttpServletRequest reqeust ){
		Integer  result=0;
		try {
			Employees emp=(Employees)reqeust.getSession().getAttribute(Constants.USER_SESSION);
			lever.setEmployeesId(emp.getEmployeesId());
			result=personalService.addPersonalLever(lever);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 修改私教等级
	 * @return
	 */
	@RequestMapping("updatePersonalLever.json")
	@ResponseBody
	public Integer updatePersonalLever(PersonalLever lever ){
		Integer  result=0;
		try {
			result=personalService.updatePersonalLever(lever);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 前往私教信息页面
	 * @return
	 */
	@RequestMapping("goSijiaoguanli")
	public String goSijiaoguanli(){
		return "personalTranier/sijiaoguanli";
	}
	
	/**
	 * 分页返回所有私教人员
	 * @param pageIndex
	 * @param employeesId
	 * @param name
	 * @return
	 */
	@RequestMapping("getPersonalInfo.json")
	@ResponseBody
	public PageSupport getPersonalInfo(@RequestParam("pageIndex")String pageIndex,
			@RequestParam(value="employeesId",required=false)String employeesId,@RequestParam(value="name",required=false)String name){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(personalService.getPersonalInfoCount(employeesId, name));
			List<Employees> employeesList=personalService.getPersonalInfoList(employeesId, name, (page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setEmployeesList(employeesList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
				
	}
	
	@RequestMapping("goUpdatepersonal")
	public String goupdatepersonal(@RequestParam("employeesId")String employeesId,
			HttpServletRequest request){
		try {
			//根据主键查找出对应的私教,和查找所有的私教等级
			Employees personal=personalService.getPersonalInfo(employeesId);
			List<PersonalLever> leverList=personalService.getPersonalLeverList(0, 50);
			request.getSession().setAttribute("personal", personal);
			request.setAttribute("leverList", leverList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "personalTranier/updatePersonal";
	}
	
	/**
	 * 修改私教信息
	 * @return
	 */
	@RequestMapping("updatePersoanl.json")
	@ResponseBody
	public Integer updatePersoanl(@RequestParam("employeesId")String employeesId,HttpServletRequest request,
			@RequestParam("phone")String phone,@RequestParam("leverId")String leverId){
		Integer result=0;
		//私教经理可对私教的等级和电话进行修改
		Employees personal=(Employees)request.getSession().getAttribute("personal");
		personal.setPhone(phone);
		personal.setLeverId(Integer.parseInt(leverId));
		try {
			result=employeesService.updateEmployees(personal);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	/**
	 * 前往私教报表页面
	 * @return
	 */
	@RequestMapping("goShoukemingxi")
	public String goShoukemingxi(HttpServletRequest request){
		try {
			request.setAttribute("personal", employeesService.getPersonalList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "personalTranier/shoukemingxi";
	}
	
	/**
	 * 返回所有私教订单
	 * @return
	 */
	@RequestMapping("getpersonalOrderList.json")
	@ResponseBody
	public PageSupport getpersonalOrderList(@RequestParam("pageIndex")String pageIndex,@RequestParam("membersId")String membersId,
			@RequestParam("name")String name,@RequestParam("employeesId")String employeesId){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(personalService.getPersonalCount(employeesId, name, membersId));
			List<PersonalOrder> personalOrderList=personalService.getPersonalOrderList(employeesId, name, membersId,(page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setPersonalOrderList(personalOrderList);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return  page;
	}
	
	/**
	 * 前往上课明细页面
	 * @return
	 */
	@RequestMapping("goShangkemingxi")
	public String goShangkemingxi(@RequestParam("personalId")String personalId,
			@RequestParam("membersId")String membersId,HttpServletRequest request){
			request.setAttribute("personalId", personalId);
			request.setAttribute("membersId",membersId);
		return "personalTranier/shangkemingxi";
	}
	
	/**
	 * 分页返回会员预约上课信息
	 * @return
	 */
	@RequestMapping("getPersonalDropList.json")
	@ResponseBody
	public PageSupport getPersonalDropList(@RequestParam(value="personalId",required=false)String personalId,
			@RequestParam(value="membersId",required=false)String membersId,@RequestParam(value="date1",required=false)String date1,
			@RequestParam(value="date2",required=false)String date2,@RequestParam(value="pageIndex",required=false)String pageIndex	){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(personalService.getPersonalDropCount(membersId, date1, date2));
			List<PersonalDrop> personalDropList=personalService.getPersonalDropList(personalId,membersId, date1, date2,(page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setPersonalDropList(personalDropList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
}
