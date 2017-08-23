package cn.fitnessmanage.service.curriculum;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.curriculum.CurriculumMapper;
import cn.fitnessmanage.pojo.Curriculum;
import cn.fitnessmanage.pojo.MembersOrderCurr;
import cn.fitnessmanage.pojo.OrderCurriculum;
import cn.fitnessmanage.pojo.PersonalCurr;

/**
 *@author唐凡
 *@time2017-8-4-下午5:31:23
 *@description
 */
@Service
public class CurriculumServiceImpl implements CurriculumService {
	
	@Resource
	private CurriculumMapper  curriculumMapper;
	
	/**
	 * 返回操课表
	 */
	public List<OrderCurriculum> getOrderCurrList(String state)
			throws Exception {
		return curriculumMapper.getOrderCurrList(state);
	}
	/**
	 * 查询所有教练代课列表
	 */
	public List<PersonalCurr> getPersonalCurrList() throws Exception {
		return curriculumMapper.getPersonalCurrList();
	}
	
	/**
	 * 修改上课时间段
	 */
	public int updateOrderCurrTime(OrderCurriculum orderCurriculum)throws Exception  {
		return curriculumMapper.updateOrderCurrTime(orderCurriculum);
	}
	
	/**
	 * 根据课程Id查找课程相关信息
	 */
	public OrderCurriculum getOrderCurriculumInfo(String orderCurrID)
			throws Exception {
		return curriculumMapper.getOrderCurriculumInfo(orderCurrID);
	}
	
	/**
	 * 根据课程编号查找教练
	 */
	public PersonalCurr getPersonalCurr(String courseId) throws Exception {
		return curriculumMapper.getPersonalCurr(courseId);
	}
	
	/**
	 * 添加课程
	 */
	public int addOrderPersonal(OrderCurriculum orderCurriculum)
			throws Exception {
		return curriculumMapper.addOrderPersonal(orderCurriculum);
	}
	/**
	 * 根据课程编号删除课程
	 */
	public int deleteOrderCurr(String orderCurrID) throws Exception {
		return curriculumMapper.deleteOrderCurr(orderCurrID);
	}
	
	/**
	 * 更新课表
	 */
	public int updateCurriculum(String state1,String state2) throws Exception {
		return curriculumMapper.updateCurriculum(state1,state2);
	}
	/**
	 * 根据操课Id查找上课人数
	 */
	public int getMembersOrderCurrCount(String orderCurrID) throws Exception {
		return curriculumMapper.getMembersOrderCurrCount(orderCurrID);
	}
	/**
	 * 返回该课程下的所有预约会员
	 */
	public List<MembersOrderCurr> getMembersOrderCurrList(String orderCurrID)
			throws Exception {
		return curriculumMapper.getMembersOrderCurrList(orderCurrID);
	}
	/**
	 * 会员预约上课
	 */
	public int addMembersOrderCurr(String orderId, String membersId)
			throws Exception {
		return curriculumMapper.addMembersOrderCurr(orderId, membersId);
	}
	/**
	 * 删除会员预约上课
	 */
	public int deletemembersOrderCurr(String membersOrderId) throws Exception {
		return curriculumMapper.deletemembersOrderCurr(membersOrderId);
	}
	
	
	public MembersOrderCurr getMembersOrderCurrInfo(String orderId,
			String membersId) throws Exception {
		return curriculumMapper.getMembersOrderCurrInfo(orderId, membersId);
	}
	/**
	 * 分页返回所有返回课程
	 */
	public List<Curriculum> getCurriculumList(Integer form, Integer size)
			throws Exception {
		return curriculumMapper.getCurriculumList(form, size);
	}
	/**
	 * 返回课程总记录数
	 */
	public int getCurriculumCount() throws Exception {
		return curriculumMapper.getCurriculumCount();
	}
	
	/**
	 * 添加课程
	 */
	public int addCurriculum(Curriculum curriculum) throws Exception {
		return curriculumMapper.addCurriculum(curriculum);
	}
	/**
	 * 删除课程
	 */
	public int deleteCurriculum(String courseId) throws Exception {
		return curriculumMapper.deleteCurriculum(courseId);
	}
	/**
	 * 修改课程
	 */
	public int updateCurriculumInfo(Curriculum curriculum) throws Exception {
		return curriculumMapper.updateCurriculumInfo(curriculum);
	}
	/**
	 * 根据Id查询课程
	 */
	public Curriculum getCurriculumInfo(String courseId) throws Exception {
		return curriculumMapper.getCurriculumInfo(courseId);
	}
	/**
	 * 分页返回教练代课信息
	 */
	public List<PersonalCurr> selectPersonalCurrList(Integer form, Integer size)
			throws Exception {
		return curriculumMapper.selectPersonalCurrList(form, size);
	}
	/**
	 * 返回教练代课记录总数
	 */
	public int getPersonalCurrCount() throws Exception {
		return curriculumMapper.getPersonalCurrCount();
	}
	/**
	 *添加教练代课
	 */
	public int addPersonalCurr(PersonalCurr personalCurr) throws Exception {
		return curriculumMapper.addPersonalCurr(personalCurr);
	}
	/**
	 * 删除教练代课
	 */
	public int deletePersonalCurr(String personalCurrId) throws Exception {
		return curriculumMapper.deletePersonalCurr(personalCurrId);
	}
	/**
	 * 修改教练代课信息
	 */
	public int updatePersonalCurr(PersonalCurr personalCurr) throws Exception {
		return curriculumMapper.updatePersonalCurr(personalCurr);
	}
	/**
	 * 查询没有教练代课的课程
	 */
	public List<Curriculum> getCurrInfo() throws Exception {
		return curriculumMapper.getCurrInfo();
	}



}
