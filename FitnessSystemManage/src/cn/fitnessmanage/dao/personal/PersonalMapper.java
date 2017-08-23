package cn.fitnessmanage.dao.personal;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.PersonalDrop;
import cn.fitnessmanage.pojo.PersonalLever;
import cn.fitnessmanage.pojo.PersonalOrder;
import cn.fitnessmanage.pojo.PersonalTraniing;
import cn.fitnessmanage.pojo.PersonalTuike;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-7-19-上午10:50:20
 *@description
 */
public interface PersonalMapper {
	public List<PersonalOrder> getPersonalOrderList(@Param("employeesId")String employeesId,@Param("name")String name,
			@Param("membersId")String membersId,@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws Exception;
	
	public int getPersonalCount(@Param("employeesId")String employeesId,@Param("name")String name,@Param("membersId")String membersId)throws Exception;
	
	public int updatePersonalOrder(PersonalOrder order)throws Exception;
	
	public List<PersonalDrop>  getPersonalDropList(@Param("personalId") String personalId,
			@Param("membersId") String membersId,@Param("date1") String date1,@Param("date2") String date2,
			@Param("form") Integer form,@Param("pageSize") Integer pageSize)throws Exception;
	
	public int getPersonalDropCount(@Param("membersId") String membersId,@Param("date1") String date1,@Param("date2") String date2)throws Exception;
	
	public PersonalDrop getPersonalDropInfo(@Param("dropId")String dropId)throws Exception;
	
	public int addPersonalDrop(PersonalDrop drop)throws Exception;
	
	public int updatePersonalDrop(PersonalDrop drop)throws Exception;
	
	public int deletePersonalDrop(String dropId)throws Exception;
	
	public int addPersonalOrder(PersonalOrder order)throws Exception;
	
	public int addPersonalTraniing(PersonalTraniing traniing)throws Exception;
	
	public int updatePersonalTraniing(PersonalTraniing traniing)throws Exception;
	
	public PersonalTraniing getpersonalTraniingInfo(@Param("membersId")String membersId,
			@Param("personalId")String personalId,@Param("trainingId")String trainingId)throws Exception;
	
	public int addPersonalTuike(PersonalTuike tuike)throws Exception;
	
	public List<PersonalLever> getPersonalLeverList(@Param("form") Integer form,@Param("pageSize") Integer pageSize)throws Exception;
	
	public int getPersonalLeverCount()throws Exception;
	
	public int updatePersonalLever(PersonalLever lever)throws Exception;
	
	public int deletePersoanlLever(String leverid)throws Exception;
	
	public int addPersonalLever(PersonalLever  lever)throws Exception;
	
	public PersonalLever getpersonalLeverInfo(@Param("leverId") String leverId)throws Exception;
	
	public List<Employees> getPersonalInfoList(@Param("employeesId")String  employeesId ,@Param("name") String name,
			@Param("form") Integer form,@Param("pageSize") Integer pageSize)throws Exception;
	
	public int getPersonalInfoCount(@Param("employeesId")String  employeesId ,@Param("name") String name)throws Exception;
	
	public Employees getPersonalInfo(@Param("employeesId")String employeesId)throws Exception;
	
	
	
	
}
