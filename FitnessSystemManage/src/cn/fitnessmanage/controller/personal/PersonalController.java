package cn.fitnessmanage.controller.personal;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.pojo.Customer;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.PersonalDrop;
import cn.fitnessmanage.pojo.PersonalOrder;
import cn.fitnessmanage.pojo.PersonalTraniing;
import cn.fitnessmanage.pojo.PersonalTuike;
import cn.fitnessmanage.service.employees.EmployeesService;
import cn.fitnessmanage.service.members.MembersService;
import cn.fitnessmanage.service.personal.PersonalService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-7-27-下午11:30:05
 *@description
 */
@Controller
@RequestMapping("fitness/personal")
public class PersonalController {
	
	@Resource
	private PersonalService personalService;
	
    private	PageSupport page;
    
    @Resource
    private EmployeesService employeesService;
    
    @Resource
    private MembersService membersService;
	/**
	 * 前往预约训练页面
	 * @return
	 */
	@RequestMapping("goPersonalXunlian")
	public String goPersonalYewu(){
		return "personalTranier/personalXunlian";
	}
	
	/**
	 * 分页返回会员预约上课信息
	 * @return
	 */
	@RequestMapping("getPersonalDropList.json")
	@ResponseBody
	public PageSupport getPersonalDropList(
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
			List<PersonalDrop> personalDropList=personalService.getPersonalDropList(null,membersId, date1, date2,(page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setPersonalDropList(personalDropList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	/**
	 * 前往预约跟进页面
	 * @return
	 */
	@RequestMapping("goPersonalUp")
	public String goUpdateCustomer(@RequestParam("dropId")String dropId,HttpServletRequest request){
		try {
			PersonalDrop drop=personalService.getPersonalDropInfo(dropId);
			request.setAttribute("drop", drop);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "personalTranier/personalUp";
	}
	
	/**
	 * 修改会员预约
	 * @return
	 */
	@RequestMapping("updatePersoanlDrop")
	@ResponseBody
	public Integer updatePersoanlDrop(PersonalDrop drop){
		Integer result=0;
		try {
			System.out.println(drop.getDate()+"+++++++++"+drop.getDropId());
			if(drop.getState().equals("2"))
				result=personalService.updatePersonalDrop(drop);
			else if(drop.getState().equals("3"))
				result=personalService.deletePersonalDrop(drop.getDropId().toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 删除会员预约
	 * @return
	 */
	@RequestMapping("deletePersonalDrop.json")
	@ResponseBody
	public Integer deletePersonalDrop(@RequestParam("dropId")String dropId){
		Integer result=0;
		try {
				result=personalService.deletePersonalDrop(dropId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 前往预约训练页面
	 * @return
	 */
	@RequestMapping("goPersonalYewu")
	public String goPersonalYeWu(HttpServletRequest request,
			@ModelAttribute("personalDrop")PersonalDrop personalDrop){
		try {
			request.setAttribute("personal", employeesService.getPersonalList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "personalTranier/personalYewu";
	}
	
	/**
	 * 返回会员信息
	 * @param membersId
	 * @return
	 */
	@RequestMapping("getMembersInfo")
	@ResponseBody
	public Members getMembersInfo(@Param("membersId")String membersId){
		Members mem=null;
		try {
			mem=membersService.getMembersInfo(membersId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mem;
	}
	
	/**
	 * 添加会员预约上课
	 * @param personalDrop
	 * @return
	 */
	@RequestMapping("addPersonalDrop.json")
	@ResponseBody
	public Integer addPersonalDrop(PersonalDrop personalDrop){
		Integer result=0;
		try {
			//预约上课后,私教订单中的课时减1,
			PersonalTraniing tran=personalService.getpersonalTraniingInfo(personalDrop.getMembersId().toString(), personalDrop.getPersonalId().toString(),null);
			tran.setRemainHour(tran.getRemainHour()-1);
			Integer updateTran=personalService.updatePersonalTraniing(tran);
			if(updateTran>0){
				personalDrop.setState("正常");
				personalDrop.setOrderId(tran.getOrderId());
				result=personalService.addPersonalDrop(personalDrop);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 前往私教购课页面
	 * @return
	 */
	@RequestMapping("goMembrsePersonal")
	public String goMembrsePersonal(HttpServletRequest request,
			@ModelAttribute("personalOrder")PersonalOrder personalOrder){
		try {
			request.setAttribute("personal", employeesService.getPersonalList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "personalTranier/membrsePersonal";
	}
	
	
	/**
	 * 前往私教退课页面
	 * @return
	 */
	@RequestMapping("goPersonaltuike")
	public String goPersonaltuike(HttpServletRequest request){
		try {
			request.setAttribute("personal", employeesService.getPersonalList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "personalTranier/personaltuike";
	}
	
	/**
	 * 添加私教订单
	 * @return
	 */
	@RequestMapping("addPersonalOrder.json")
	@ResponseBody
	public Integer addPersonalOrder(PersonalOrder personalOrder,PersonalTraniing traniing,HttpServletRequest request,
			@RequestParam(value="comment",required=false)String comment,@RequestParam(value="currType",required=false)String currType,
			@RequestParam(value="type",required=false)String type){
		Integer result=0;
		List<PersonalOrder> order=null;
		try {
			Employees emp=(Employees) request.getSession().getAttribute(Constants.USER_SESSION);
			//判断是否存在已有的订单
			order=personalService.getPersonalOrderList(traniing.getPersonalId().toString(), null, personalOrder.getMembersId().toString(), 0, 10);
			System.out.println("++++++++++++++++++++++++++++++++++++++"+order.size());
			if(order.size()!=0 && ! type.equals("2")){
				result=2;
				return result;
			}
			
			if(type.equals("1")){
				System.out.println("+++++++++++++++++++++++++++++"+type);
				personalOrder.setObvious("私教购课"+personalOrder.getKeshi()+"节");
				personalOrder.setOperatingPeriect("购买私教课");
				personalOrder.setTransactionType("消费");
				personalOrder.setEmployeesId(emp.getEmployeesId());
				personalOrder.setDate(new  Date());
				Integer traniingId=personalService.addPersonalOrder(personalOrder);
				if(traniingId>0){
						traniing.setSumHour(personalOrder.getKeshi());
						traniing.setRemainHour(personalOrder.getKeshi());
						//将新插入的订单主键返回,作为订单详情的外键
						traniing.setOrderId(personalOrder.getOrderId());
						result=personalService.addPersonalTraniing(traniing);
					}
			}else if(type.equals("2")){//修改已有的私教订单和私教订单详情
				System.out.println("+++++++++++++++++++++++++++++"+type);
				PersonalTraniing tran=personalService.getpersonalTraniingInfo( personalOrder.getMembersId().toString(), traniing.getPersonalId().toString(), null);
				PersonalOrder newOrder=	order.get(0);
				int sum=tran.getSumHour()+personalOrder.getKeshi();
				int price=Integer.parseInt(newOrder.getPrice())+Integer.parseInt(personalOrder.getPrice());
				newOrder.setObvious("私教购课"+sum+"节");
				newOrder.setPrice(String.valueOf(price));
				newOrder.setDate(new Date());
				tran.setSumHour(sum);
				tran.setRemainHour( (tran.getRemainHour()+personalOrder.getKeshi()) );
				Integer orderUpdate=personalService.updatePersonalOrder(newOrder);
				result=personalService.updatePersonalTraniing(tran);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 根据条件查询私教订单详情
	 * @return
	 */
	@RequestMapping("getPersonalTraniingInfo.json")
	@ResponseBody
	public PersonalTraniing getPersonalTraniingInfo(@RequestParam("membersId")String membersId,
			@RequestParam("personalId")String personalId){
		PersonalTraniing tran=null;
		try {
			tran=personalService.getpersonalTraniingInfo(membersId, personalId,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tran;
	}
	
	/**
	 * 新增会员退课
	 * @return
	 */
	@RequestMapping("addPersonalTuike.json")
	@ResponseBody
	public Integer addPersonalTuike(PersonalTuike tuike,HttpServletRequest request){
		Integer result=0;
		try {
			tuike.setDate(new Date());
			int sum=personalService.addPersonalTuike(tuike);
			PersonalTraniing tran=personalService.getpersonalTraniingInfo(null, null,tuike.getTraniingId().toString());
			if(sum>0){
				tran.setRemainHour(tran.getRemainHour()-tuike.getHour());
				result=personalService.updatePersonalTraniing(tran);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	 
	
}
