package cn.fitnessmanage.dao.members;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.MembersSwipingCount;
import cn.fitnessmanage.pojo.SwipingRecord;

/**
 *@author唐凡
 *@time2017-6-5-上午10:55:06
 *@description
 */
public interface MembersMapper {
	
	public Members getMembersInfo(@Param("membersId")String membersId)throws Exception;
	
	public List<SwipingRecord> getSwipingInfo(@Param("membersId")String membersId) throws Exception;
	
	public int getMembersSwipingCount(@Param("membersId")String membersId) throws Exception;
	
	public List<SwipingRecord> getSwipingInfoList(@Param("membersId")String membersId,@Param("form")Integer form,@Param("pageSize")Integer pageSize) throws Exception;
	
	public int addSwipingInfo(SwipingRecord swiping)throws Exception;
	 
	public int addMembers(Members members)throws Exception;
	
	public int getLastMembers()throws Exception;
	
	public int getMembersCount(@Param("membersId")String membersId)throws Exception;
	
	public List<Members> getMembersList(@Param("membersId") String membersId,@Param("form")Integer form, @Param("pageSize")Integer pageSize);
	
	public int updateMembersInfo(Members members)throws Exception;
	
	public int updatemembersDate(@Param("membersId")String membersId,@Param("date")String date )throws Exception;
	
	public int deleteMembersInfo(@Param("membersId") String membersId)throws Exception;
	
	/**
	 * 查询当天的会员人数统计
	 * @param hour1
	 * @param hour2
	 * @param date1
	 * @param date2
	 * @return
	 */
	public List<MembersSwipingCount> selectMembersSwipingList(@Param("hour1")Integer hour1,
			@Param("hour2")Integer hour2,@Param("date1")String date1,@Param("date2")String date2,
			@Param("form")Integer form, @Param("pageSize")Integer pageSize);
	
	public List<Integer> getSwipingCount(@Param("date1")String date1,@Param("date2")String date2);
}
