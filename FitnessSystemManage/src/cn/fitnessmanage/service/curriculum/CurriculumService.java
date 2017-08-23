package cn.fitnessmanage.service.curriculum;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import cn.fitnessmanage.pojo.Curriculum;
import cn.fitnessmanage.pojo.MembersOrderCurr;
import cn.fitnessmanage.pojo.OrderCurriculum;
import cn.fitnessmanage.pojo.PersonalCurr;

/**
 *@author唐凡
 *@time2017-8-4-下午5:31:01
 *@description
 */
public interface CurriculumService {
	
	public List<OrderCurriculum> getOrderCurrList(String state)throws Exception;
	
	public List<PersonalCurr> getPersonalCurrList()throws Exception;
	
	public int updateOrderCurrTime(OrderCurriculum orderCurriculum)throws Exception;
	
	public OrderCurriculum getOrderCurriculumInfo(String orderCurrID)throws  Exception;
	
	public PersonalCurr getPersonalCurr(String courseId)throws Exception;
	
	public int addOrderPersonal(OrderCurriculum orderCurriculum)throws Exception;
	
	public int deleteOrderCurr(String orderCurrID)throws Exception;
	
	public int updateCurriculum(String state1,String state2)throws Exception;
	
	public int getMembersOrderCurrCount(String orderCurrID)throws Exception;
	
	public List<MembersOrderCurr> getMembersOrderCurrList(String orderCurrID)throws Exception;
	
	public MembersOrderCurr getMembersOrderCurrInfo(String orderId,String membersId)throws Exception;
	
	public int addMembersOrderCurr(String orderId,String membersId)throws Exception;
	
	public int deletemembersOrderCurr(String membersOrderId)throws Exception;
	
	public List<Curriculum> getCurriculumList(Integer form,Integer size)throws Exception;
	
	public int getCurriculumCount()throws Exception;
	
	public int  addCurriculum(Curriculum curriculum)throws Exception;
	
	public int deleteCurriculum(String courseId)throws Exception;
	
	public int updateCurriculumInfo(Curriculum curriculum)throws Exception;
	
	public Curriculum getCurriculumInfo(String courseId)throws Exception;
	
	
	public List<PersonalCurr> selectPersonalCurrList(Integer form,Integer size)throws Exception;
	
	public int getPersonalCurrCount()throws Exception;
	
	public int  addPersonalCurr(PersonalCurr personalCurr)throws Exception;
	
	public int deletePersonalCurr(String personalCurrId)throws Exception;
	
	public int updatePersonalCurr(PersonalCurr personalCurr)throws Exception;
	
	public List<Curriculum> getCurrInfo()throws Exception;
}
