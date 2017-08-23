package cn.fitnessmanage.controller.members;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.fitnessmanage.pojo.MembersCard;
import cn.fitnessmanage.pojo.PageMembersCard;
import cn.fitnessmanage.service.members.MemberscardService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-6-4-下午5:08:42
 *@description
 */
@Controller
@RequestMapping("fitness/membrseCard")
public class MembersCardController {
	@Resource
	private MemberscardService memberscardService;
	/**
	 * 前往会员卡配置页面
	 * @return
	 */
	@RequestMapping("membrseCard")
	public String membrseCard(){
		
		return "membrse/membrseCard";
	}
	
	/**
	 * 前往添加会员卡页面
	 * @return
	 */
	@RequestMapping("membrseCadAdd")
	public String membrseCadUpdate(){
		
		return "membrse/membrseCadUpdate";
	}
	
	@RequestMapping("getMembersCardList")
	@ResponseBody
	public String membersCardList(@RequestParam(value="pageIndex",required=false)String pageIndex,
								Model model){
		//设置页面容量
		int pageSize=Constants.pageSize;
		//当前页码
		Integer currentPageNo=1;
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
		 totalCount=memberscardService.getMembersCardCount();
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
			List<MembersCard> getMemCardList=memberscardService.getMembersCardList(currentPageNo, pageSize);
			PageMembersCard pageMem=new PageMembersCard();
			pageMem.setMembersCardList(getMemCardList);
			pageMem.setPage(pages);
			String memCardList=JSON.toJSONString(pageMem);			
			return memCardList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	//进入会员卡修改页面
	@RequestMapping("membrseCadUpdate")
	public String membrseCadUpdate(@RequestParam(value="cardId")String cardId,HttpServletRequest reqeust){
		reqeust.setAttribute("cardId",cardId);
		return "membrse/membrseCadUpdate";
	}
	//返回会员卡信息到修改页面
	@RequestMapping("membrseCadList")
	@ResponseBody
	public MembersCard getMembersCardList(@RequestParam(value="cardId")String cardId,Model models){
		Integer memCardId=Integer.parseInt(cardId);
		MembersCard membersCard = null;
		try {
			membersCard = memberscardService.getSelectIdMembersCard(memCardId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return membersCard;
	}
	//添加会员卡信息
	@RequestMapping("addMembersCard.html")
	@ResponseBody
	public String addMembersCard(MembersCard membersCard){
		int result=0;
		try {
			 result=memberscardService.addMembersCard(membersCard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			return "true";
		}else{
			return "false";
		}
	}
	//修改会员卡信息
	@RequestMapping("updateMembersCard.html")
	@ResponseBody
	public String updateMembersCard(MembersCard membersCard){
		int result=0;
		try {
			 result=memberscardService.updateMembersCard(membersCard);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			return "true";
		}else{
			return "false";
		}
	}
	//删除会员卡信息
	@RequestMapping("deleteMembersCard.html")
	@ResponseBody
	public String deleteMembersCard(@RequestParam(value="cardId")String cardId){
		int result=0;
		try {
			 result=memberscardService.deleteMembersCard(Integer.parseInt(cardId));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			return "true";
		}else{
			return "false";
		}
	}
	
}
