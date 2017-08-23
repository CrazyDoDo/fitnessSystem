package cn.fitnessmanage.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 *@author唐凡
 *@time2017-7-21-下午12:06:23
 *@description
 */
public class MembersSwipingCount {

	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date startDate;
	private Integer shangSum;
	private Integer zhongSum;
	private Integer wanSum;
	private Integer zongSum;
	public String getStartDate() {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String applyTime =sdf.format(startDate);
			return applyTime;	
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}		
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Integer getShangSum() {
		return shangSum;
	}
	public void setShangSum(Integer shangSum) {
		this.shangSum = shangSum;
	}
	public Integer getZhongSum() {
		return zhongSum;
	}
	public void setZhongSum(Integer zhongSum) {
		this.zhongSum = zhongSum;
	}
	public Integer getWanSum() {
		return wanSum;
	}
	public void setWanSum(Integer wanSum) {
		this.wanSum = wanSum;
	}
	public Integer getZongSum() {
		return zongSum;
	}
	public void setZongSum(Integer zongSum) {
		this.zongSum = zongSum;
	}
	

	
	
}
