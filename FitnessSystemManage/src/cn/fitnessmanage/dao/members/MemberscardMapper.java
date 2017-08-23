package cn.fitnessmanage.dao.members;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.fitnessmanage.pojo.MembersCard;

/**
 *@author唐凡
 *@time2017-6-6-下午9:36:55
 *@description
 */
public interface MemberscardMapper {
	public List<MembersCard> getMembersCardList(@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws Exception;
	
	public int getMembersCardCount()throws Exception;
	
	public MembersCard getSelectIdMembersCard (@Param("cardId")Integer cardId)throws Exception;
	
	public int addMembersCard(MembersCard membersCard)throws Exception;
	
	public int updateMembersCard(MembersCard membersCard)throws Exception;
	
	public int deleteMembersCard(@Param("cardId")Integer cardId)throws Exception;
}
