package cn.fitnessmanage.pojo;
/**
 * ��Ʒ��
 * @author Administrator
 *
 */
public class Goods {
	private Integer goodsId;
	private String goodsName;
	private Integer goodsTypeId;
	private String goodsPrice;
	private Integer goodsCount;
	private String goodsUnit;
	private String common;
	
	private String goodsTypename;//扩展属性,商品类型名称
	private Double money;//扩展属性,数量*价格
	private Integer goodsSum;//扩展属性,售出商品数量
	
	
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Integer getGoodsSum() {
		return goodsSum;
	}
	public void setGoodsSum(Integer goodsSum) {
		this.goodsSum = goodsSum;
	}
	public String getGoodsTypename() {
		return goodsTypename;
	}
	public void setGoodsTypename(String goodsTypename) {
		this.goodsTypename = goodsTypename;
	}
	public String getCommon() {
		return common;
	}
	public void setCommon(String common) {
		this.common = common;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(Integer goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}
	public String getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public Integer getGoodsCount() {
		return goodsCount;
	}
	public void setGoodsCount(Integer goodsCount) {
		this.goodsCount = goodsCount;
	}
	public String getGoodsUnit() {
		return goodsUnit;
	}
	public void setGoodsUnit(String goodsUnit) {
		this.goodsUnit = goodsUnit;
	}

	

	
}
