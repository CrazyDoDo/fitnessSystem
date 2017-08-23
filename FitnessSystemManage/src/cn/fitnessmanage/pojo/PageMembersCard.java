package cn.fitnessmanage.pojo;

import java.util.List;

import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-6-6-下午11:36:34
 *@description
 */
public class PageMembersCard {
	private PageSupport page;
	private List<MembersCard> membersCardList;
	public PageSupport getPage() {
		return page;
	}
	public void setPage(PageSupport page) {
		this.page = page;
	}
	public List<MembersCard> getMembersCardList() {
		return membersCardList;
	}
	public void setMembersCardList(List<MembersCard> membersCardList) {
		this.membersCardList = membersCardList;
	}
	
	
}
