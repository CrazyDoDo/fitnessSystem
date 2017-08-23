package cn.fitnessmanage.pojo;

import java.util.List;

import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-6-22-下午10:43:26
 *@description
 */
public class PageMembers {

	private List<Members> membersList;
	private PageSupport page;
	public List<Members> getMembersList() {
		return membersList;
	}
	public void setMembersList(List<Members> membersList) {
		this.membersList = membersList;
	}
	public PageSupport getPage() {
		return page;
	}
	public void setPage(PageSupport page) {
		this.page = page;
	}
	
}
