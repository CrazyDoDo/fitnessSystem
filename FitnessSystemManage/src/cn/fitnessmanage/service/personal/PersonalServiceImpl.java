package cn.fitnessmanage.service.personal;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.personal.PersonalMapper;
import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.PersonalDrop;
import cn.fitnessmanage.pojo.PersonalLever;
import cn.fitnessmanage.pojo.PersonalOrder;
import cn.fitnessmanage.pojo.PersonalTraniing;
import cn.fitnessmanage.pojo.PersonalTuike;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-7-19-上午11:09:54
 *@description
 */
@Service
public class PersonalServiceImpl implements PersonalService {
	@Resource
	private PersonalMapper personalMapper;
	/**
	 * 根据会员卡号查找会员的消费信息
	 */
	public List<PersonalOrder> getPersonalOrderList(String employeesId,String name,
			String membersId,Integer form,Integer pageSize) throws Exception {
		return personalMapper.getPersonalOrderList( employeesId, name,membersId, form,pageSize);
	}
	/**
	 * 查找会员的消费信息总数
	 */
	public int getPersonalCount(String employeesId,String name,String membersId) throws Exception {
		return personalMapper.getPersonalCount( employeesId, name,membersId);
	}
	
	/**
	 * 修改订单详情
	 */
	public int updatePersonalOrder(PersonalOrder order) throws Exception {
		return personalMapper.updatePersonalOrder(order);
	}
	
	/**
	 * 分页返回,会员预约上课列表
	 */
	public List<PersonalDrop> getPersonalDropList( String personalId,String membersId,
			String date1, String date2, Integer form, Integer pageSize)
			throws Exception {
		return personalMapper.getPersonalDropList(personalId,membersId, date1, date2, form, pageSize);
	}
	/**
	 * 返回所有会员预约上课总数
	 */
	public int getPersonalDropCount(String membersId, String date1, String date2)
			throws Exception {
		return personalMapper.getPersonalDropCount(membersId, date1, date2);
	}
	
	/**
	 * 根据会员预约上课编号查找预约信息
	 */
	public PersonalDrop getPersonalDropInfo(String dropId) throws Exception {
		return personalMapper.getPersonalDropInfo(dropId);
	}
	/**
	 * 修改会员预约
	 */
	public int updatePersonalDrop(PersonalDrop drop) throws Exception {
		return personalMapper.updatePersonalDrop(drop);
	}
	/**
	 * 删除会员预约
	 */
	public int deletePersonalDrop(String dropId) throws Exception {
		return personalMapper.deletePersonalDrop(dropId);
	}
	/**
	 * 添加会员预约上课
	 */
	public int addPersonalDrop(PersonalDrop drop) throws Exception {
		return personalMapper.addPersonalDrop(drop);
	}
	/**
	 * 添加私教订单
	 */
	public int addPersonalOrder(PersonalOrder order) throws Exception {
		return personalMapper.addPersonalOrder(order);
	}
	/**
	 * 新增私教订单详情
	 */
	public int addPersonalTraniing(PersonalTraniing traniing) throws Exception {
		return personalMapper.addPersonalTraniing(traniing);
	}
	/**
	 * 修改会员订单详情
	 */
	public int updatePersonalTraniing(PersonalTraniing traniing)
			throws Exception {
		return personalMapper.updatePersonalTraniing(traniing);
	}
	/**
	 * 根据条件返回私教订单详情
	 */
	public PersonalTraniing getpersonalTraniingInfo(String membersId,
			String personalId,String trainingId) throws Exception {
		return personalMapper.getpersonalTraniingInfo(membersId, personalId, trainingId);
	}
	/**
	 * 插入会员退课信息
	 */
	public int addPersonalTuike(PersonalTuike tuike) throws Exception {
		return personalMapper.addPersonalTuike(tuike);
	}
	/**
	 * 分页返回私教等级列表
	 */
	public List<PersonalLever> getPersonalLeverList(Integer form, Integer pageSize)
			throws Exception {
		return personalMapper.getPersonalLeverList(form, pageSize);
	}
	/**
	 * 分页返回私教等级总记录数
	 */
	public int getPersonalLeverCount() throws Exception {
		return personalMapper.getPersonalLeverCount();
	}
	/**
	 * 修改私教等级
	 */
	public int updatePersonalLever(PersonalLever lever) throws Exception {
		return personalMapper.updatePersonalLever(lever);
	}
	/**
	 * 删除私教等级
	 */
	public int deletePersoanlLever(String leverid) throws Exception {
		return personalMapper.deletePersoanlLever(leverid);
	}
	/**
	 * 添加私教等级
	 */
	public int addPersonalLever(PersonalLever lever) throws Exception {
		return personalMapper.addPersonalLever(lever);
	}
	/**
	 * 根据私教等级主键,查找私教信息
	 */
	public PersonalLever getpersonalLeverInfo(String leverId) throws Exception {
		return personalMapper.getpersonalLeverInfo(leverId);
	}
	
	/**
	 * 分页返回,私教信息
	 */
	public List<Employees> getPersonalInfoList(String employeesId, String name,
			Integer form, Integer pageSize) throws Exception {
		return personalMapper.getPersonalInfoList(employeesId, name, form, pageSize);
	}
	/**
	 * 返回私教人员总数
	 */
	public int getPersonalInfoCount(String employeesId, String name)
			throws Exception {
		return personalMapper.getPersonalInfoCount(employeesId, name);
	}
	/**
	 * 根据主键查找健身教练信息
	 */
	public Employees getPersonalInfo(String employeesId) throws Exception {
		return personalMapper.getPersonalInfo(employeesId);
	}

	
}
