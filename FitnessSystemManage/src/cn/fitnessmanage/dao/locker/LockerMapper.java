package cn.fitnessmanage.dao.locker;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Locker;
import cn.fitnessmanage.pojo.LockerOrder;


/**
 *@author唐凡
 *@time2017-7-19-上午10:50:05
 *@description
 */
public interface LockerMapper {
	public List<LockerOrder> getLockerOrderList(@Param("membersId")String membersId,
			@Param("startDate")String startDate,@Param("overDate")String overDate,@Param("form")Integer form, @Param("pageSize")Integer pageSize)throws Exception;
	
	public int getLockerOrderCount(@Param("membersId")String membersId,@Param("startDate")String startDate,@Param("overDate")String overDate)throws Exception;
	
	public int deleteLockerOrder(@Param("lockerOrderId")String lockerOrderId,@Param("lockerId")String lockerId)throws Exception;
	
	public List<Locker> getLockerList(@Param("form")Integer form, @Param("pageSize")Integer pageSize,@Param("state")String state)throws Exception;
	
	public int getLockerCount(@Param("state")String state)throws Exception;
	
	public int addLocker(Locker locker)throws Exception;
	
	public int deleteLocker(@Param("lockerId")String lockerId)throws Exception;
	
	public int updateLocker(@Param("lockerId")String lockerId,@Param("state")String state)throws Exception;
	
	public Integer getLockerId()throws Exception;
	
	public int addLockerOrder(LockerOrder order)throws Exception;
}
