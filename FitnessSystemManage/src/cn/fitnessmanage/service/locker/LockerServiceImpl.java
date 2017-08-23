package cn.fitnessmanage.service.locker;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.locker.LockerMapper;
import cn.fitnessmanage.pojo.Locker;
import cn.fitnessmanage.pojo.LockerOrder;

/**
 *@author唐凡
 *@time2017-7-20-下午10:24:13
 *@description
 */
@Service
public class LockerServiceImpl implements LockerService {
	@Resource
	private LockerMapper mapper;
	/**
	 * 分页返回,会员的租柜信息
	 */
	public List<LockerOrder> getLockerOrderList(String membersId,String startDate,String overDate, Integer form,
			Integer pageSize) throws Exception {
		return mapper.getLockerOrderList(membersId, startDate, overDate, form, pageSize);
	}
	/**
	 * 查询会员的租柜记录总数
	 */
	public int getLockerOrderCount(String membersId,String startDate,String overDate) throws Exception {
		return mapper.getLockerOrderCount(membersId,startDate, overDate);
	}
	/**
	 * 删除租柜订单
	 */
	public int deleteLockerOrder(String lockerOrderId,String lockerId) throws Exception {
		return mapper.deleteLockerOrder(lockerOrderId, lockerId);
	}
	/**
	 * 返回所有储物柜信息
	 */
	public List<Locker> getLockerList(Integer form, Integer pageSize,String state)
			throws Exception {
		return mapper.getLockerList(form, pageSize, state);
	}
	/**
	 * 返回储物柜总记录数
	 */
	public int getLockerCount(String state) throws Exception {
		return mapper.getLockerCount(state);
	}
	/**
	 * 添加储物柜
	 */
	public int addLocker(Locker locker) throws Exception {
		return mapper.addLocker(locker);
	}
	/**
	 * 删除储物柜
	 */
	public int deleteLocker(String locker) throws Exception {
		return mapper.deleteLocker(locker);
	}
	/**
	 * 修改储物柜状态
	 */
	public int updateLocker(String locker, String state) throws Exception {
		return mapper.updateLocker(locker, state);
	}
	/**
	 * 返回最近添加的储物柜编号
	 */
	public Integer getLockerId() throws Exception {
		return mapper.getLockerId();
	}
	/**
	 * 储物柜出租
	 */
	public int addLockerOrder(LockerOrder order) throws Exception {
		return mapper.addLockerOrder(order);
	}

}
