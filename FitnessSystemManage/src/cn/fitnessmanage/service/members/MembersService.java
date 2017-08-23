package cn.fitnessmanage.service.members;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.MembersSwipingCount;
import cn.fitnessmanage.pojo.SwipingRecord;

/**
 *@author唐凡
 *@time2017-6-5-上午10:59:00
 *@description
 */
public interface MembersService {

	public Members getMembersInfo(String membersId)throws Exception;
	
	public List<SwipingRecord> getSwipingInfo(String membersId) throws Exception;
	
	public List<SwipingRecord> getSwipingInfoList(String membersId,int form, int pageSize) throws Exception;
	
	public int getMembersSwipingCount(String membersId) throws Exception;
	
	public int addSwipingInfo(SwipingRecord swiping)throws Exception;
	
	public int getLastMembers()throws Exception;
	
	public int addMembers(Members members)throws Exception;
	
	public int getMembersCount(String membersId)throws Exception;
	
	public List<Members> getMembersList( String membersId,Integer form, Integer pageSize)throws Exception;
	
	public int  updateMembersInfo(Members members)throws Exception;
	
	public int updatemembersDate(String membersId,String date )throws Exception;
	
	public int deleteMembersInfo(String membersId)throws Exception;
	
	public List<MembersSwipingCount> selectMembersSwipingList(Integer hour1,
			Integer hour2,String date1,String date2,Integer form,Integer pageSize);
	public List<Integer> getSWipingCount(String date1,String date2);
}
