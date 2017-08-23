package cn.fitnessmanage.dao.curriculum;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import cn.fitnessmanage.pojo.Curriculum;
import cn.fitnessmanage.pojo.MembersOrderCurr;
import cn.fitnessmanage.pojo.OrderCurriculum;
import cn.fitnessmanage.pojo.PersonalCurr;

/**
 *@author唐凡
 *@time2017-8-4-下午5:32:33
 *@description
 */
public interface CurriculumMapper {

	public List<OrderCurriculum> getOrderCurrList(@Param("state")String state)throws Exception;
	
	public List<PersonalCurr> getPersonalCurrList()throws Exception;
	
	public int updateOrderCurrTime(OrderCurriculum orderCurriculum)throws Exception;
	
	public OrderCurriculum getOrderCurriculumInfo(@Param("orderCurrID")String orderCurrID)throws  Exception;
	
	public PersonalCurr getPersonalCurr(@Param("courseId")String courseId)throws Exception;
	
	public int addOrderPersonal(OrderCurriculum orderCurriculum)throws Exception;
	
	public int deleteOrderCurr(@Param("orderCurrID")String orderCurrID)throws Exception;
	
	public int updateCurriculum(@Param("state1")String state1 ,@Param("state2")String state2)throws Exception;
	
	public int getMembersOrderCurrCount(@Param("orderCurrID")String orderCurrID)throws Exception;
	
	public List<MembersOrderCurr> getMembersOrderCurrList(@Param("orderCurrID")String orderCurrID)throws Exception;
	
	public MembersOrderCurr getMembersOrderCurrInfo(@Param("orderId")String orderId,@Param("membersId")String membersId)throws Exception;
	
	public int addMembersOrderCurr(@Param("orderId")String orderId,@Param("membersId")String membersId)throws Exception;
	
	public int deletemembersOrderCurr(@Param("membersOrderId")String membersOrderId)throws Exception;
	
	public List<Curriculum> getCurriculumList(@Param("form")Integer form,@Param("size")Integer size)throws Exception;
	
	public int getCurriculumCount()throws Exception;
	
	public int  addCurriculum(Curriculum curriculum)throws Exception;
	
	public int deleteCurriculum(@Param("courseId")String courseId)throws Exception;
	
	public int updateCurriculumInfo(Curriculum curriculum)throws Exception;
	
	public Curriculum getCurriculumInfo(@Param("courseId")String courseId)throws Exception;
	
	
	public List<PersonalCurr> selectPersonalCurrList(@Param("form")Integer form,@Param("size")Integer size)throws Exception;
	
	public int getPersonalCurrCount()throws Exception;
	
	public int  addPersonalCurr(PersonalCurr personalCurr)throws Exception;
	
	public int deletePersonalCurr(@Param("personalCurrId")String personalCurrId)throws Exception;
	
	public int updatePersonalCurr(PersonalCurr personalCurr)throws Exception;
	
	public List<Curriculum> getCurrInfo()throws Exception;
	
	
	
	
}
