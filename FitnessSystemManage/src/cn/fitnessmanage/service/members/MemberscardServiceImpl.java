package cn.fitnessmanage.service.members;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.members.MemberscardMapper;
import cn.fitnessmanage.pojo.MembersCard;

/**
 *@author唐凡
 *@time2017-6-6-下午9:57:04
 *@description
 */
@Service
public class MemberscardServiceImpl implements MemberscardService {
	@Resource
	private MemberscardMapper mapper;
	
	/**
	 * 分页返回会员卡集合
	 */
	public List<MembersCard> getMembersCardList(Integer currentPageNo, Integer pageSize)
			throws Exception {
		return mapper.getMembersCardList((currentPageNo-1)*pageSize, pageSize);
	}
	/**
	 * 返回会员卡总数
	 */
	public int getMembersCardCount() throws Exception {
		return mapper.getMembersCardCount();
	}
	/**
	 * 根据Id查找会员卡信息
	 */
	public MembersCard getSelectIdMembersCard(Integer cardId) throws Exception {
		return mapper.getSelectIdMembersCard(cardId);
	}
	/**
	 * 添加会员卡信息
	 */
	public int addMembersCard(MembersCard membersCard) throws Exception {
		return mapper.addMembersCard(membersCard);
	}
	/**
	 * 修改会员卡信息
	 */
	public int updateMembersCard(MembersCard membersCard) throws Exception {
		return mapper.updateMembersCard(membersCard);
	}
	/**
	 * 删除会员卡信息
	 */
	public int deleteMembersCard(Integer cardId) throws Exception {
		return mapper.deleteMembersCard(cardId);
	}

}
