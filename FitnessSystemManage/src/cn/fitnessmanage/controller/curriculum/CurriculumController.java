package cn.fitnessmanage.controller.curriculum;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.dao.curriculum.CurriculumMapper;
import cn.fitnessmanage.pojo.Curriculum;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.MembersOrderCurr;
import cn.fitnessmanage.pojo.OrderCurriculum;
import cn.fitnessmanage.pojo.PersonalCurr;
import cn.fitnessmanage.service.curriculum.CurriculumService;
import cn.fitnessmanage.service.employees.EmployeesService;
import cn.fitnessmanage.service.members.MembersService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-8-4-下午2:39:34
 *@description
 */
@Controller
@RequestMapping("fitness/curriculum")
public class CurriculumController {
	
	@Resource
	private CurriculumService curriculumService;
	
	@Resource
	private MembersService membersService;

	@Resource
	private EmployeesService employeesService;
	
	private List<OrderCurriculum> orderCurriculumList;
	
	private List<PersonalCurr> personalCurrList;
	
	private List<MembersOrderCurr> membersOrederCurrList;
	
	private PersonalCurr personalCurr;
	
	
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	 public PageSupport page=null;
	
	/**
	 * 前往课表管理页面
	 * @return
	 */
	@RequestMapping("goCurriculuManage")
	public String goCurriculuManage(HttpServletRequest request){
		try {
			personalCurrList=curriculumService.getPersonalCurrList();
			request.getSession().setAttribute("perAndCurr", personalCurrList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "curriculum/curriculumManage";
	}
	
	
	/**
	 * 前往预发布课表页面
	 * @return
	 */
	@RequestMapping("goYuyueCurriculu")
	public String goYuyueCurriculu(HttpServletRequest request){
		try {
			personalCurrList=curriculumService.getPersonalCurrList();
			request.getSession().setAttribute("perAndCurr", personalCurrList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "curriculum/yuyueCurriculum";
	}
	
	/**
	 * 返回下一周的操课信息
	 * @return
	 */
	@RequestMapping("getYuyueCurriculumList.json")
	@ResponseBody
	public List<OrderCurriculum> getYuyueCurriculumList(@RequestParam("state")String state){
		try {
			orderCurriculumList=curriculumService.getOrderCurrList(state);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderCurriculumList;
	}
	
	/**
	 * 查询所有教练代课列表
	 */
	@RequestMapping("getPersonalCurrList.json")
	@ResponseBody
	public List<PersonalCurr> getPersonalCurrList(){
		try {
			personalCurrList=curriculumService.getPersonalCurrList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return personalCurrList;
	}
	
	/**
	 * 修改上课时间
	 * @return
	 */
	@RequestMapping("updateOrderCurrTime.json")
	@ResponseBody
	public Integer updateOrderCurrTime(@RequestParam("stratdate")String stratdate,
			@RequestParam("orderIds")String orderIds[],HttpServletRequest request){//orderIds为数组类型参数接收
		Integer result=0;
		try {
			OrderCurriculum order=null;
			for (int i = 0; i < orderIds.length; i++) {
				order=curriculumService.getOrderCurriculumInfo(orderIds[i]);
				order.setStratdate(stratdate);
				result=curriculumService.updateOrderCurrTime(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 根据课程Id查找代课教练信息
	 */
	@RequestMapping("getPersonalCurr.json")
	@ResponseBody
	public PersonalCurr getPersonalCurr(@RequestParam("courseId")String courseId){
		try {
			personalCurr=curriculumService.getPersonalCurr(courseId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return personalCurr;
	}
	
	/**
	 * 修改课程信息
	 * @return
	 */
	@RequestMapping("updateOrderPersonal.json")
	@ResponseBody
	public Integer updateOrderPersonal(@RequestParam("courseId")String courseId,
			@RequestParam("personalId")String personalId,@RequestParam("orderId")String orderId){
		int result=0;
		OrderCurriculum order=null;
			try {
				order=curriculumService.getOrderCurriculumInfo(orderId);
				order.setCourseId(Integer.parseInt(courseId));
				order.setPersonalId(Integer.parseInt(personalId));
				result=curriculumService.updateOrderCurrTime(order);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}
	
	/**
	 * 添加课程信息
	 * @return
	 */
	@RequestMapping("addOrderPersonal.json")
	@ResponseBody
	public Integer addOrderPersonal(
			@RequestParam("courseId")Integer courseId,@RequestParam("personalId")Integer personalId,
			@RequestParam("whatDay")Integer whatDay,@RequestParam("strtaDate")String strtaDate){
		int result=0;
		//将前台传入的值,赋给order对象
		OrderCurriculum order=new OrderCurriculum();
		order.setCourseId(courseId);
		order.setPersonalId(personalId);
		order.setStratdate(strtaDate);
		order.setWhatDay(whatDay);
		order.setState(3);
		try {
			result=curriculumService.addOrderPersonal(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/**
	 * 根据课程编号删除排课
	 * @return
	 */
	@RequestMapping("deleteOrderCurr.json")
	@ResponseBody
	public Integer deleteOrderCurr(@RequestParam("orderId")String orderId){
		int result=0;
		try {
			result=curriculumService.deleteOrderCurr(orderId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
				
	}
	
	/**
	 * 更新课表
	 * @return
	 */
	@RequestMapping("updateCurriculum.json")
	@ResponseBody	
	public Integer updateCurriculum(){
		Integer result=0;
			try {
				result=curriculumService.updateCurriculum(Constants.STATE1,Constants.STATE2);
				result=curriculumService.updateCurriculum(Constants.STATE2,Constants.STATE3);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;
		
	}
	
	/**
	 * 前往预约管理页面
	 * @return
	 */
	@RequestMapping("goYuyueguanli")
	public String goYuyueguanli(){
		return "curriculum/yuyueguanli";
	}
	
	
	/**
	 * 前往预约上课页面
	 * @return
	 */
	@RequestMapping("goTianjiaCurriculum")
	public String goTianjiaCurriculum(@RequestParam("orderId")String orderId,HttpServletRequest request){
		try {
			OrderCurriculum order=curriculumService.getOrderCurriculumInfo(orderId);
			int count=curriculumService.getMembersOrderCurrCount(orderId);
			request.setAttribute("order", order);
			request.setAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "curriculum/curriculumliebiao";
	}
	
	/**
	 * 返回该课程下的所有预约会员
	 * @param orderId
	 * @return
	 */
	@RequestMapping("getMembersOrderCurrList.json")
	@ResponseBody
	public List<MembersOrderCurr> getMembersOrderCurrList(@RequestParam("orderId")String orderId){
		try {
			membersOrederCurrList=curriculumService.getMembersOrderCurrList(orderId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return membersOrederCurrList;
	}
	
	/**
	 * 会员预约上课
	 * @return
	 */
	@RequestMapping("addMembersOrderCurr.json")
	@ResponseBody
	public Integer addMembersOrderCurr(@RequestParam("orderId")String orderId,@RequestParam("membersId")String membersId){
		Integer  result=0;
		Integer count=0;
		try {
			MembersOrderCurr memOrderCurr=curriculumService.getMembersOrderCurrInfo(orderId, membersId);
			if(memOrderCurr!=null){
				return -2;
			}
			Members mem=membersService.getMembersInfo(membersId);
			if(mem==null)
				return -1;//该会员不存在
			count=curriculumService.addMembersOrderCurr(orderId, membersId);
			if(count>0){
				result=curriculumService.getMembersOrderCurrCount(orderId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 删除会员预约上课
	 * @return
	 */
	@RequestMapping("deleteMembersOrderCurr.json")
	@ResponseBody
	public Integer deleteMembersOrderCurr(@RequestParam(value="membersOrders",required=false)String membersOrders[],
			@RequestParam("orderId")String orderId){
		Integer  result=0;
		Integer count=0;
		try {
			for (int i = 0; i < membersOrders.length; i++) {
				result=curriculumService.deletemembersOrderCurr(membersOrders[i]);
			}
			if(result>0){
				count=curriculumService.getMembersOrderCurrCount(orderId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	/**
	 * 前往教室管理页面
	 * @return
	 */
	@RequestMapping("goCurriculumType")
	public String goCurriculumType(){
		return "curriculum/curriculumType";
	}
	
	/**
	 * 前往课程管理页面
	 * @return
	 */
	@RequestMapping("goCurriculumguanli")
	public String goCurriculumguanli(){
		return "curriculum/curriculumguanli";
	}
	
	/**
	 * 前往教练管理页面
	 * @return
	 */
	@RequestMapping("goPersonalManage")
	public String goPersonalManage(HttpServletRequest request){
		try {
			request.getSession().setAttribute("personalList", employeesService.getPersonalList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "curriculum/personalManage";
	}
	
	/**
	 * 分页返回所有私教人员
	 */
	@RequestMapping("getcurriculumList.json")
	@ResponseBody
	public PageSupport getcurriculumList(@RequestParam("pageIndex")String pageIndex){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(curriculumService.getCurriculumCount());
			List<Curriculum> curriculumList=curriculumService.getCurriculumList((page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setCurriculumList(curriculumList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
				
	}
	
	
	/**
	 * 添加课程
	 */
	@RequestMapping("addCurriculum.json")
	@ResponseBody
	public Integer addCurriculum(Curriculum curriculum){
		int result=0;
			try {
				curriculum.setDate(sdf.format(new Date()));
				curriculum.setCurriculumType("团体课");
				result=curriculumService.addCurriculum(curriculum);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;	
	}
	
	
	/**
	 * 删除课程
	 */
	@RequestMapping("deleteCurriculum.json")
	@ResponseBody
	public Integer deleteCurriculum(@RequestParam("courseId")String courseId){
		int result=0;
			try {
				result=curriculumService.deleteCurriculum(courseId);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;	
	}
	/**
	 * 修改课程
	 */
	@RequestMapping("updateCurriculumInfo.json")
	@ResponseBody
	public Integer updateCurriculum(Curriculum curriculum){
		int result=0;
		try {
			result=curriculumService.updateCurriculumInfo(curriculum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;	
	}
	
	/**
	 * 根据编号查找课程信息
	 */
	@RequestMapping("getCurriculumInfo.json")
	@ResponseBody
	public Curriculum getCurriculumInfo(@RequestParam("courseId")String courseId){
		try {
			return curriculumService.getCurriculumInfo(courseId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	
	/**
	 * 查找教练代课集合
	 */
	@RequestMapping("selectPersonalCurrList.json")
	@ResponseBody
	public PageSupport getPersonalCurrList(@RequestParam("pageIndex")String pageIndex){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(curriculumService.getPersonalCurrCount());
			List<PersonalCurr> personalCurrList=curriculumService.selectPersonalCurrList((page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setPersonalCurrList(personalCurrList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	/**
	 * 删除教练
	 */
	@RequestMapping("deletePersonalCurr.json")
	@ResponseBody
	public Integer deletePersonalCurr(@RequestParam("personalCurrId")String personalCurrId){
		int result=0;
			try {
				result=curriculumService.deletePersonalCurr(personalCurrId);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;	
	}
	
	/**
	 * 查询没有教练代课的课程
	 */
	@RequestMapping("getCurrInfo.json")
	@ResponseBody
	public List<Curriculum> getCurrInfo(){
		List<Curriculum> curriculumList=null;
		try {
			curriculumList=curriculumService.getCurrInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return curriculumList;	
	}
	
	/**
	 * 查询没有教练代课的课程
	 */
	@RequestMapping("addPersonalCurr.json")
	@ResponseBody
	public Integer addPersonalCurr(PersonalCurr personalCurr){
		int result=0;
		try {
			personalCurr.setDate(new Date());
			result=curriculumService.addPersonalCurr(personalCurr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;	
	}
	
	/**
	 * 查询没有教练代课的课程
	 */
	@RequestMapping("updatePersonalCurr.json")
	@ResponseBody
	public Integer updatePersonalCurr(PersonalCurr personalCurr){
		int result=0;
		try {
			personalCurr.setDate(new Date());
			result=curriculumService.updatePersonalCurr(personalCurr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;	
	}
	
	
	
	
	
}
