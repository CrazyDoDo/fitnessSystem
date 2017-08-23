package cn.fitnessmanage.service.members;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.MembersCard;

/**
 *@author唐凡
 *@time2017-6-6-下午9:56:37
 *@description
 */
public interface MemberscardService {

	public List<MembersCard> getMembersCardList(Integer currentPageNo,Integer pageSize)throws Exception;
	
	public int getMembersCardCount()throws Exception;
	
	public MembersCard getSelectIdMembersCard(Integer cardId)throws Exception;
	
	public int addMembersCard(MembersCard membersCard)throws Exception;
	
	public int updateMembersCard(MembersCard membersCard)throws Exception;
	
	public int deleteMembersCard(@Param("cardId")Integer cardId)throws Exception;	
}
