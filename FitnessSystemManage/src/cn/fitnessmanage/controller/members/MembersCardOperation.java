package cn.fitnessmanage.controller.members;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.MembersCard;
import cn.fitnessmanage.pojo.PageMembers;
import cn.fitnessmanage.pojo.PageMembersCard;
import cn.fitnessmanage.service.employees.EmployeesService;
import cn.fitnessmanage.service.members.MembersService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-6-13-上午9:27:52
 *@description
 */
@Controller
@RequestMapping("fitness/membersCardOperation")
public class MembersCardOperation {
	private Logger logger=Logger.getLogger(MembersCardOperation.class);
	@Resource
	private MembersService membersService;
	
	@Resource
	private EmployeesService employeesService;
	/**
	 * 前往会员管理页面
	 * @return
	 */
	@RequestMapping("goMembersCardOperation")
	public String goMembersCardOperation(){
		return "membrse/membrseCardOperation";
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
	 * 前往会员卡修改页面
	 * @return
	 */
	@RequestMapping("membrseInfoUpdate")
	public String goMembersInfoUpdate(@RequestParam("membersId")String membersId,Model model){
		try {
			Members members=membersService.getMembersInfo(membersId);
			model.addAttribute("members", members);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "membrse/membrseUpdate";
	}
	
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
	 * 修改会员信息
	 * @return
	 */
	@RequestMapping("updateMembersInfo.html")
	@ResponseBody
	public Object updateMembersInfo(Members members,HttpSession session,HttpServletRequest request){
		logger.info("membersId----------"+members.getMembersId());
		try {
			String imagePath=(membersService.getMembersInfo(members.getMembersId().toString())).getImage();
			logger.info("imagePath----------"+imagePath);
			if(! imagePath.equals(members.getImage())){
				String path=request.getSession().getServletContext().getRealPath("statics"+File.separator+"images"+File.separator+"guide"+"/"+imagePath);
				File file=new File(path);
				if(file.exists()){
					file.delete();
			}
		}
		} catch (Exception e1) {
			e1.printStackTrace();
		}		
		HashMap<String, String> resultMap=new HashMap<String, String>();
		SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
		try {
			members.setBirthday(sdf1.parse(request.getParameter("birthday")));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}		
		int result=0;
		try {
			 result=membersService.updateMembersInfo(members);
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
	
	
	@RequestMapping("deleteMembersCard.html")
	@ResponseBody
	public Object deleteMembersCard(@RequestParam("membersId")String membersId){
		HashMap<String, String> resultMap=new HashMap<String, String>();
		int result=0;
		try {
			 result=membersService.deleteMembersInfo(membersId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
