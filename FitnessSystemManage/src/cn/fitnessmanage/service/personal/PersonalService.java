package cn.fitnessmanage.service.personal;

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
 *@time2017-7-19-上午11:09:30
 *@description
 */
public interface PersonalService {
	public List<PersonalOrder> getPersonalOrderList(String employeesId,String name,
			String membersId,Integer form,Integer pageSize)throws Exception;
	
	public int getPersonalCount(String employeesId,String name,String membersId)throws Exception;
	
	public int updatePersonalOrder(PersonalOrder order)throws Exception;
	
	public List<PersonalDrop>  getPersonalDropList(String personalId,
			 String membersId, String date1, String date2,
			 Integer form, Integer pageSize)throws Exception;
	
	public int getPersonalDropCount( String membersId, String date1, String date2)throws Exception;
	
	public PersonalDrop getPersonalDropInfo(String dropId)throws Exception;
	
	public int addPersonalDrop(PersonalDrop drop)throws Exception;
	
	public int updatePersonalDrop(PersonalDrop drop)throws Exception;
	
	public int deletePersonalDrop(String dropId)throws Exception;
	
	public int addPersonalOrder(PersonalOrder order)throws Exception;
	
	public int addPersonalTraniing(PersonalTraniing traniing)throws Exception;
	
	public int updatePersonalTraniing(PersonalTraniing traniing)throws Exception;
	
	public PersonalTraniing getpersonalTraniingInfo(String membersId,
			String personalId,String trainingId)throws Exception;
	
	public int addPersonalTuike(PersonalTuike tuike)throws Exception;
	
	public List<PersonalLever> getPersonalLeverList( Integer form, Integer pageSize)throws Exception;
	
	public int getPersonalLeverCount()throws  Exception;
	
	
	public int updatePersonalLever(PersonalLever lever)throws Exception;
	
	public int deletePersoanlLever(String leverid)throws Exception;
	
	public int addPersonalLever(PersonalLever  lever)throws Exception;
	
	
	public PersonalLever getpersonalLeverInfo(String leverId)throws Exception;
	
	public List<Employees> getPersonalInfoList(String  employeesId ,String name,
			 Integer form, Integer pageSize)throws Exception;
	
	public int getPersonalInfoCount(String  employeesId , String name)throws Exception;
	
	public Employees getPersonalInfo(String employeesId)throws Exception;
}
