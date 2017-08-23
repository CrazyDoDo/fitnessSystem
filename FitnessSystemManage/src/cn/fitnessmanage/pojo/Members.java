package cn.fitnessmanage.pojo;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;




public class Members {
	private Integer membersId;
	private String name;
	private Integer age;
	private String sex;
	private String phone;
	private String image;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	private String address;
	private String weChat;
	private String email;
	private String professional;
	private String iD;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date stratDate;
	private String state;
	private Integer coachId;
	private Integer employeesId;
	private Integer membersCardId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date stopDate;
	
	private String coachName;
	private String employeesName;
	private String memCardName;
	
	public Integer getMembersId() {
		return membersId;
	}
	public void setMembersId(Integer membersId) {
		this.membersId = membersId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBirthday() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(birthday);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getWeChat() {
		return weChat;
	}
	public void setWeChat(String weChat) {
		this.weChat = weChat;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfessional() {
		return professional;
	}
	public void setProfessional(String professional) {
		this.professional = professional;
	}
	public String getiD() {
		return iD;
	}
	public void setiD(String iD) {
		this.iD = iD;
	}
	public String getStratDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(stratDate);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}		
	}
	public void setStratDate(Date stratDate) {
		this.stratDate=stratDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getCoachId() {
		return coachId;
	}
	public void setCoachId(Integer coachId) {
		this.coachId = coachId;
	}
	public Integer getEmployeesId() {
		return employeesId;
	}
	public void setEmployeesId(Integer employeesId) {
		this.employeesId = employeesId;
	}
	public Integer getMembersCardId() {
		return membersCardId;
	}
	public void setMembersCardId(Integer membersCardId) {
		this.membersCardId = membersCardId;
	}
	public String getStopDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(stopDate);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}			
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public void setStopDate(Date stopDate) {
		this.stopDate = stopDate;
	}
	public String getCoachName() {
		return coachName;
	}
	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}
	public String getEmployeesName() {
		return employeesName;
	}
	public void setEmployeesName(String employeesName) {
		this.employeesName = employeesName;
	}
	public String getMemCardName() {
		return memCardName;
	}
	public void setMemCardName(String memCardName) {
		this.memCardName = memCardName;
	}

	


}
