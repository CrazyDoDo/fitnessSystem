package cn.fitnessmanage.controller.members;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.pojo.LockerOrder;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.PageMembers;
import cn.fitnessmanage.pojo.PersonalOrder;
import cn.fitnessmanage.pojo.SwipingRecord;
import cn.fitnessmanage.service.locker.LockerService;
import cn.fitnessmanage.service.members.MembersService;
import cn.fitnessmanage.service.personal.PersonalService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-7-18-下午4:01:54
 *@description
 */
@Controller
@RequestMapping("fitness/membersInfoController")
public class MembersInfoController {

	private Logger logger=Logger.getLogger(MembersCardOperation.class);
	@Resource
	private MembersService membersService;
	@Resource
	private PersonalService personalService;
	
	@Resource
	private LockerService lockerService;
	/**
	 * 前往会员信息列表页面
	 * @return
	 */
	@RequestMapping("goMembrseInfoList")
	public String goMembersInfoList(){
		return "membrse/membrseInfoList";
	}
	
	/**
	 * 异步获取所有的会员信息
	 * 分页显示
	 * @return
	 */
	@RequestMapping("getMembersList")
	@ResponseBody
	public PageMembers getMembersList(@RequestParam(value="pageIndex",required=false) String pageIndex,@RequestParam(value="membersId",required=false)String membersId){
		PageMembers pageMembers=new PageMembers();
		//设置页面容量
		int pageSize=Constants.pageSize;
		//当前页码
		Integer currentPageNo=1;
		String memId=null;
		if(membersId != null && ! membersId.equals("")){
			memId=membersId;
		}
		if(pageIndex != null && ! pageIndex.equals("")){
			try{
				currentPageNo = Integer.valueOf(pageIndex);
			}catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		//获取总数
		int totalCount=0;
		try {
		 totalCount=membersService.getMembersCount(memId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageSupport pages=new PageSupport();
		pages.setPageSize(pageSize);
		pages.setCurrentPageNo(currentPageNo);
		pages.setTotalCount(totalCount);
		//获取总页数
		int totalPageCount=pages.getTotalPageCount();
		if(currentPageNo<1){
			currentPageNo=1;
		}else if(currentPageNo>totalPageCount){
			currentPageNo=totalPageCount;
		}
		
		try {
			List<Members> getMembersList=membersService.getMembersList(memId, currentPageNo, pageSize);
			pageMembers.setMembersList(getMembersList);
			pageMembers.setPage(pages);
			return pageMembers;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	}
	
	/**
	 * 前往会员卡详细信息页面
	 * @return
	 */
	@RequestMapping("goMembrseInfo")
	public String goMembersInfoUpdate(@RequestParam("membersId")String membersId,Model model){
		try {
			Members members=membersService.getMembersInfo(membersId);
			model.addAttribute("members", members);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "membrse/memebrseInfo";
	}
	
	@RequestMapping("goMembrseTrading")
	public String goMembrseTrading(@RequestParam("membersId")String membersId,HttpServletRequest request){
		request.getSession().setAttribute("membersId", membersId);
		return "membrse/membrseTrading";
	}
	
	/**
	 * 查询会员交易记录,分页返回信息
	 * @param pageIndex
	 * @param membersId
	 * @param model
	 * @return
	 */
	@RequestMapping("getMembrseTrading")
	@ResponseBody
	public PageSupport getMembrseTrading(@RequestParam(value="pageIndex",required=false) String pageIndex,@RequestParam("membersId")String membersId,Model model){
		PageSupport page=new PageSupport();
		//设置页面容量
		int pageSize=Constants.pageSize;
		//当前页码
		Integer currentPageNo=1;
		String memId=null;
		if(membersId != null && ! membersId.equals("")){
			memId=membersId;
		}
		if(pageIndex != null && ! pageIndex.equals("")){
			currentPageNo = Integer.valueOf(pageIndex);
		}
		try {
			int  totalCount=personalService.getPersonalCount(null,null,membersId);
			page.setPageSize(pageSize);
			page.setCurrentPageNo(currentPageNo);
			page.setTotalCount(totalCount);		
			List<PersonalOrder> getPersonalOrderList=personalService.getPersonalOrderList(null,null,membersId, (page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setPersonalOrderList(getPersonalOrderList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return page;
	}
	
	/**
	 * 前往会员刷卡详情页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("goMembrseSwiping")
	public String goMembrseSwiping(HttpServletRequest request) throws Exception{
		int  totalCount=membersService.getMembersSwipingCount(request.getSession().getAttribute("membersId").toString());
		request.getSession().setAttribute("totalCount", totalCount);
		return "membrse/membrseSwiping";
	}
	
	/**
	 * 分页显示会员刷卡信息
	 * @param pageIndex
	 * @param membersId
	 * @return
	 */
	@RequestMapping("getMembrseSwiping")
	@ResponseBody
	public PageSupport getMembrseSwiping(@RequestParam(value="pageIndex",required=false) String pageIndex,
			@RequestParam("membersId")String membersId){
		PageSupport page=new PageSupport();
		//当前页码
		Integer currentPageNo=1;
		if(pageIndex != null && ! pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		
		try {
			int  totalCount=membersService.getMembersSwipingCount(membersId);
			page.setPageSize(Constants.pageSize);
			page.setCurrentPageNo(currentPageNo);
			page.setTotalCount(totalCount);		
			List<SwipingRecord> getSwipingRecordList=membersService.getSwipingInfoList(membersId, (page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setSwipingRecordList(getSwipingRecordList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return page;
	}
	
	/**
	 * 打开会员租柜信息页面
	 * @return
	 */
	@RequestMapping("goMembrseRent")
	public String goMembrseRent(){
		return "membrse/membrseRent";
	}
	
	@RequestMapping("getLockerOrderList")
	@ResponseBody
	public PageSupport getLockerOrderList(@RequestParam("membersId")String membersId,
			@RequestParam(value="pageIndex",required=false)String pageIndex){
		PageSupport page=new PageSupport();
		//当前页码
		Integer currentPageNo=1;
		if(pageIndex != null && ! pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		
		try {
			int  totalCount=lockerService.getLockerOrderCount(membersId,null,null);
			page.setPageSize(Constants.pageSize);
			page.setCurrentPageNo(currentPageNo);
			page.setTotalCount(totalCount);		
			List<LockerOrder> getLockerOrder=lockerService.getLockerOrderList(membersId,null,null, (page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setLockerOrderList(getLockerOrder);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return page;
	}
	
}
