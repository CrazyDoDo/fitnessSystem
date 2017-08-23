package cn.fitnessmanage.controller.members;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.sun.org.apache.regexp.internal.recompile;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.LockerOrder;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.MembersCard;
import cn.fitnessmanage.pojo.MembersSwipingCount;
import cn.fitnessmanage.service.employees.EmployeesService;
import cn.fitnessmanage.service.members.MembersService;
import cn.fitnessmanage.service.members.MemberscardService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-6-9-上午11:24:23
 *@description
 */
@Controller
@RequestMapping("fitness/membrse")
public class MembersController {
	private Logger logger=Logger.getLogger(MembersController.class);
	@Resource
	private MemberscardService membersCardService;
	@Resource
	private EmployeesService employeesService;
	@Resource
	private MembersService membersService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	/**
	 * 前往添加会员卡页面
	 * @return
	 */
	@RequestMapping("goMembersAdd")
	public String goMembersAdd(@ModelAttribute("members") Members members){
		return "membrse/membrseAdd";
	}
	
	/**
	 * 返回会员卡集合
	 * @return
	 */
	@RequestMapping("getMembersCardList.json")
	@ResponseBody
	public List<MembersCard> getMembersCardList(){
		List<MembersCard> membersList=null;
		try {
			Integer currentPageNo=1;
			Integer pageSize=100;		
			 membersList=membersCardService.getMembersCardList(currentPageNo, pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return membersList;
	}
	/**
	 * 查询所有销售人员
	 * @return
	 */
	@RequestMapping("getXiaoshouList.json")
	@ResponseBody
	public List<Employees> getXiaoshouList(){
		List<Employees> xiaoshouList=null;
		try {
			xiaoshouList=employeesService.getXiaoshouList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return xiaoshouList;		
	}
	
	/**
	 * 查找所有健身教练
	 * @return
	 */
	@RequestMapping("getPersonalList.json")
	@ResponseBody
	public List<Employees> getPersonalList(){
		List<Employees> personalList=null;
		try {
			personalList=employeesService.getPersonalList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return personalList;		
	}	
	/**
	 * 返回最后一位开卡的会员
	 */	
	@RequestMapping("getLastMembers.json")
	@ResponseBody
	public int getLastMembers(){
		int membersId = 0;
		try {
			membersId = membersService.getLastMembers();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return membersId;
	}
	/**
	 * 上传会员图片
	 * @param attach
	 * @param request
	 * @return
	 */
	@RequestMapping("uploadImage.html")
	@ResponseBody
	public Object uploadImage(@RequestParam(value="images",required= false) MultipartFile attach,HttpServletRequest request){
		HashMap<String, String> error=new HashMap<String, String>();
		//判断文件是否为空
		if(!attach.isEmpty()){
			String path=request.getSession().getServletContext().getRealPath("statics"+File.separator+"images"+File.separator+"guide");
			logger.info("uploadFiles----------"+path);
			String oldFileName=attach.getOriginalFilename();//获取原文件名
			logger.info("oldFileName----------"+oldFileName);
			String perfix=FilenameUtils.getExtension(oldFileName);//获取文件后缀
			logger.info("perfix---------"+perfix);
			int fileSize=1000000;//设置上传限制
			logger.info("uploadFile size"+attach.getSize());//文件大小
			if(attach.getSize()>fileSize){
				error.put("fileUploadError", "上传大小不得超过1M");
				return error;
			}else if(perfix.equalsIgnoreCase("jpg") || 
					perfix.equalsIgnoreCase("png") ||
					perfix.equalsIgnoreCase("jpeg") ||
					perfix.equalsIgnoreCase("pneg") ){
				String fileName=attach.getOriginalFilename();
				logger.info("new FileName"+fileName);
				File file=new File(path,fileName);
				if(!file.exists()){
					file.mkdirs();
				}
				//保存
				try {
					attach.transferTo(file);
					return attach.getOriginalFilename();
				} catch (Exception e) {
					e.printStackTrace();
					error.put("fileUploadError", "上传失败");
					return error;
				} 
			}else{
				error.put("fileUploadError", "上传格式不正确");
				return error;
			}
		}
		error.put("fileUploadError", "上传失败");
		return error;
	}
	
	/**
	 * 添加会员卡
	 * @return
	 */
	@RequestMapping(value="/addMembers.html")
	@ResponseBody
	public Object addMembers(Members members,HttpSession session,HttpServletRequest request,@RequestParam(value="address1",required=false) String address1,@RequestParam(value="address2",required=false) String address2,@RequestParam(value="address3",required=false) String address3
			){
		HashMap<String, String> resultMap=new HashMap<String, String>();
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy/MM/dd");
		try {
			members.setStopDate(sdf2.parse(request.getParameter("stopDate1")));
			members.setBirthday(sdf1.parse(request.getParameter("birthday1")));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
	    members.setStratDate(new Date());
		members.setState("正常");
		members.setAddress(address1+address2+address3);
		int result=0;
		try {
			 result=membersService.addMembers(members);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0){
			resultMap.put("delResult","true");
		}else{
			resultMap.put("delResult","false");
		}
		return JSONArray.toJSON(resultMap);
	}
	
	
	/**
	 * 前往会员统计报表页面
	 */
	@RequestMapping("goMembrseTongji")
	public String goMembrseTongji(){
		return "membrse/membrseTongji";
	}
	
	@SuppressWarnings("null")
	@RequestMapping("getMembersSwipingCount")
	@ResponseBody
	/**
	 * 会员刷卡统计
	 * @return
	 */
	public PageSupport getMembersSwipingCount(@RequestParam(value="date1", required=false)String date1,
			@RequestParam(value="date2", required=false)String date2,@RequestParam(value="pageIndex", required=false)String pageIndex){
		PageSupport page=new PageSupport();
		//当前页码
		Integer currentPageNo=1;
		if(pageIndex != null && ! pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		
			int  totalCount=membersService.getSWipingCount(date1, date2).size();
			System.out.println("+++++++++++++++++++++"+totalCount);
			page.setPageSize(Constants.pageSize);
			page.setCurrentPageNo(currentPageNo);
			page.setTotalCount(totalCount);	
			int sum= (page.getCurrentPageNo()-1)*page.getPageSize();
		//分别将不同时间段的人数存入List集合中,
		List<MembersSwipingCount> swipingList1=membersService.selectMembersSwipingList(0, 12, date1, date2,0, 10000);
		List<MembersSwipingCount> swipingList2=membersService.selectMembersSwipingList(12, 18, date1, date2,0, 10000);
		List<MembersSwipingCount> swipingList3=membersService.selectMembersSwipingList(18, 24, date1, date2,0, 10000);
		List<MembersSwipingCount> swipingList4=membersService.selectMembersSwipingList(null	,null, date1, date2,sum, page.getPageSize());
		//将信息存入map中
		Map<String, Integer> sw1= new HashMap<String, Integer>();
		for (MembersSwipingCount membersSwiping : swipingList1) {
			System.out.println(membersSwiping.getZongSum()+"+++++++++++"+membersSwiping.getStartDate());
			sw1.put(membersSwiping.getStartDate(), membersSwiping.getZongSum());
		}
		Map<String, Integer> sw2= new HashMap<String, Integer>();
		for (MembersSwipingCount membersSwiping : swipingList2) {
			System.out.println(membersSwiping.getZongSum()+"+++++++++++"+membersSwiping.getStartDate());
			sw2.put(membersSwiping.getStartDate(), membersSwiping.getZongSum());
		}
		Map<String, Integer> sw3= new HashMap<String, Integer>();
		for (MembersSwipingCount membersSwiping : swipingList3) {
			System.out.println(membersSwiping.getZongSum()+"+++++++++++"+membersSwiping.getStartDate());
			sw3.put(membersSwiping.getStartDate(), membersSwiping.getZongSum());
		}	
		List<MembersSwipingCount> returnSwipingList=new ArrayList<MembersSwipingCount>();;
		try {
			//根据总日期,来循环读取map中的信息,存入list集合中
			for (MembersSwipingCount swipingCount : swipingList4) {
				 
				MembersSwipingCount ms=new MembersSwipingCount();
				//sw1.containsKey如果此映射包含指定键的映射关系，则返回 true。
				if(sw1.containsKey(swipingCount.getStartDate()))
					ms.setShangSum(sw1.get(swipingCount.getStartDate()));
				else
					ms.setShangSum(0);
				
				if(sw2.containsKey(swipingCount.getStartDate()))
					ms.setZhongSum(sw2.get(swipingCount.getStartDate()));
				else
					ms.setZhongSum(0);
				if(sw3.containsKey(swipingCount.getStartDate()))
					ms.setWanSum(sw3.get(swipingCount.getStartDate()));
				else
					ms.setWanSum(0);
				
				ms.setZongSum(swipingCount.getZongSum());
				ms.setStartDate(sdf.parse(swipingCount.getStartDate()));
				returnSwipingList.add(ms);
			}
			for (MembersSwipingCount msp : returnSwipingList) {
				System.out.println(msp.getShangSum());
				System.out.println(msp.getZhongSum());
				System.out.println(msp.getWanSum());
				System.out.println(msp.getZongSum());
				System.out.println(msp.getStartDate());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			page.setMembersSwipingCount(returnSwipingList);
		return  page;
		
	}	
}
