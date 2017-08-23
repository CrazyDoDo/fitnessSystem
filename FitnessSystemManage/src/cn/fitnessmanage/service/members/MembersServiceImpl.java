package cn.fitnessmanage.service.members;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.members.MembersMapper;
import cn.fitnessmanage.pojo.Members;
import cn.fitnessmanage.pojo.MembersSwipingCount;
import cn.fitnessmanage.pojo.SwipingRecord;

/**
 *@author唐凡
 *@time2017-6-5-上午10:59:53
 *@description
 */
@Service
public class MembersServiceImpl implements MembersService {
	@Resource
	private MembersMapper mapper;
	
	/**
	 * 查找会员信息
	 */
	public Members getMembersInfo(String membersId) throws Exception {
		return mapper.getMembersInfo(membersId);
	}
	/**
	 * 查找会员刷卡信息
	 */
	public List<SwipingRecord> getSwipingInfo(String membersId) throws Exception {
		return mapper.getSwipingInfo(membersId);
	}
	
	/**
	 * 获取会员刷卡总数
	 */
	public int getMembersSwipingCount(String membersId) throws Exception {
		return mapper.getMembersSwipingCount(membersId);
	}
	
	/**
	 * 查找会员的所有数卡信息
	 */
	public List<SwipingRecord> getSwipingInfoList(String membersId, int form,
			int pageSize) throws Exception {
		return mapper.getSwipingInfoList(membersId, form, pageSize);
	}
	
	
	/**
	 * 添加会员刷卡信息
	 */
	public int addSwipingInfo(SwipingRecord swiping) throws Exception {
		return mapper.addSwipingInfo(swiping);
	}
	/**
	 * 返回最后一位开卡的会员
	 */
	public int getLastMembers() throws Exception {
		return mapper.getLastMembers();
	}
	/**
	 * 会员开卡,添加会员信息
	 */
	public int addMembers(Members members) throws Exception {
		return mapper.addMembers(members);
	}
	
	public List<Members> getMembersList(String membersId, Integer currentPageNo,
			Integer pageSize)throws Exception {
		return mapper.getMembersList(membersId, (currentPageNo-1)*pageSize, pageSize);
	}
	
	public int getMembersCount(String membersId) throws Exception {
		return mapper.getMembersCount(membersId);
	}
	/**
	 * 修改会员信息
	 */
	public int updateMembersInfo(Members members) throws Exception {
		return mapper.updateMembersInfo(members);
	}
	/**
	 * 会员请假,修改到期时间
	 */
	public int updatemembersDate(String membersId, String date)
			throws Exception {
		return mapper.updatemembersDate(membersId, date);
	}
	
	/**
	 * 删除会员信息
	 * @return
	 */
	public int deleteMembersInfo(String membersId)throws Exception{
		return mapper.deleteMembersInfo(membersId);
	}
	/**
	 * 会员刷卡统计
	 */
	public List<MembersSwipingCount> selectMembersSwipingList(Integer hour1,
			Integer hour2, String date1, String date2,Integer form,Integer pageSize) {
		return mapper.selectMembersSwipingList(hour1, hour2, date1, date2,form,pageSize);
	}
	/**
	 * 会员刷卡总数
	 * @return
	 */
	public List<Integer> getSWipingCount(String date1,String date2){
		return mapper.getSwipingCount(date1, date2);
	}


	

}
