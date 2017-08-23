package cn.fitnessmanage.service.locker;

import java.util.List;
import cn.fitnessmanage.pojo.Locker;
import cn.fitnessmanage.pojo.LockerOrder;

/**
 *@author唐凡
 *@time2017-7-20-下午10:23:40
 *@description
 */
public interface LockerService {
	public List<LockerOrder> getLockerOrderList(String membersId,String startDate,String overDate,Integer form,Integer pageSize)throws Exception;
	
	public int getLockerOrderCount(String membersId,String startDate,String overDate)throws Exception;
	
	public int deleteLockerOrder(String lockerOrderId,String lockerId)throws Exception;
	
	public List<Locker> getLockerList(Integer form,Integer pageSize,String state)throws Exception;
	
	public int getLockerCount(String state)throws Exception;
	
	public int addLocker(Locker locker)throws Exception;
	
	public int deleteLocker(String locker)throws Exception;
	
	public int updateLocker(String locker,String state)throws Exception;
	
	public Integer getLockerId()throws Exception;
	
	public int addLockerOrder(LockerOrder order)throws Exception;
}
