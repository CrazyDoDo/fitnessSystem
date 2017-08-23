package cn.fitnessmanage.controller.locker;



import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Locker;
import cn.fitnessmanage.pojo.LockerOrder;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.PersonalLever;
import cn.fitnessmanage.service.locker.LockerService;
import cn.fitnessmanage.service.members.MembersService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;


/**
 *@author唐凡
 *@time2017-8-12-下午12:25:25
 *@description
 */
@Controller
@RequestMapping("fitness/lockerController")
public class lockerController {
	
	@Resource
	private LockerService lockerService;
	
	@Resource
	private MembersService membersService;

	public PageSupport page=null;
	
	private Integer result;
	/**
	 * 前往租柜统计页面
	 * @return
	 */
	@RequestMapping("goXiaoShowTongji")
	public String goCustomerDengji(){
		return "waterBar/xiaoShouTongji";
	}
	/**
	 * 前往储物柜管理页面
	 * @return
	 */
	@RequestMapping("goLockersTable")
	public String goLockersTable(){
		return "waterBar/lockersTable";
	}
	
	/**
	 * 分页返回已租储物柜列表
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("getLockerOrderList.json")
	@ResponseBody
	public PageSupport getLockerOrderList(
			@RequestParam("pageIndex")String pageIndex,@RequestParam("membersId")String membersId,
			@RequestParam("startDate")String startDate,@RequestParam("overDate")String overDate){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(lockerService.getLockerOrderCount(membersId, startDate, overDate));
			List<LockerOrder> lockerOrderList=lockerService.getLockerOrderList(membersId, startDate, overDate,(page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setLockerOrderList(lockerOrderList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	} 
	
	
	/**
	 * 删除租柜订单
	 * @return
	 */
	@RequestMapping("deleteLocerOrder.json")
	@ResponseBody()
	public Integer deleteLocerOrder(@RequestParam("lockerOrderId")String lockerOrderId){
		try {
			result=lockerService.deleteLockerOrder(lockerOrderId,null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 分页返回所有储物柜信息
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("getLockerList.json")
	@ResponseBody
	public PageSupport getLockerList(@RequestParam("pageIndex")String pageIndex,
			@RequestParam(value="state",required=false)String state){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(lockerService.getLockerCount(state));
			List<Locker> lockerList=lockerService.getLockerList((page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize(),state);
			page.setLokcerList(lockerList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	} 
	
	/**
	 * 分页返回下一个储物柜编号
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("getLockerId.json")
	@ResponseBody
	public Integer getLockerId(){
		try {
			 result=lockerService.getLockerId();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 添加储物柜
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("addLocker.json")
	@ResponseBody
	public Integer addLocker(@RequestParam("lockerId")String lockerId,
			HttpServletRequest request){
		try {
			Locker locker=new Locker();
			locker.setLockerId(Integer.parseInt(lockerId));
			locker.setLockerType("VIP");
			locker.setState("空闲");
			locker.setEmployeesId(((Employees)request.getSession().getAttribute(Constants.USER_SESSION)).getEmployeesId());
			result=lockerService.addLocker(locker);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 删除储物柜
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("deleteLocker.json")
	@ResponseBody
	public Integer deleteLocker(@RequestParam("lockerId")String lockerId){
		try {
			result=lockerService.deleteLocker(lockerId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 修改储藏柜的状态
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("updateLocker.json")
	@ResponseBody
	public Integer updateLocker(@RequestParam("lockerId")String lockerId){
		try {
			int sum=lockerService.deleteLockerOrder(null, lockerId);
			result=lockerService.updateLocker(lockerId, "空闲");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	/**
	 * 前往储物柜出租订单页面
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("goLockersRent")
	public String goLockersRent(){	
		return "waterBar/lockersRent";
	}
	
	/**
	 * 修改储藏柜的状态
	 * @param pageIndex
	 * @return
	 */
	@RequestMapping("addLockerOrder.json")
	@ResponseBody
	public Integer addLockerOrder(LockerOrder order,HttpServletRequest request,@RequestParam("overDate")String overDate){
		try {
			order.setEmployeesId(((Employees)request.getSession().getAttribute(Constants.USER_SESSION)).getEmployeesId());
			order.setStartDate(new Date());
			order.setLockerway("临时");
			order.setOverDate(new SimpleDateFormat("YYYY-MM-dd").parse(overDate));
			Members mem=membersService.getMembersInfo(order.getMembersId().toString());
			if(mem==null){
				return -1;
			}
			result=lockerService.updateLocker(order.getLockerId(), "已租");
			result=lockerService.addLockerOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
