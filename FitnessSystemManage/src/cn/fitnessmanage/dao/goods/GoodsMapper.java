package cn.fitnessmanage.dao.goods;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.fitnessmanage.pojo.Goods;
import cn.fitnessmanage.pojo.GoodsOrder;
import cn.fitnessmanage.pojo.GoodsType;

/**
 *@author唐凡
 *@time2017-8-13-下午6:26:12
 *@description
 */
public interface GoodsMapper {

	public  List<GoodsType> getGoodsTypeList(@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws Exception;
	
	public int  getGoodsTypeCount()throws Exception;
	
	public int addGoods(Goods goods)throws Exception;
	
	public int getGoodsMaxId()throws Exception;
	
	public List<Goods> getGoodsList(@Param("goodsId")Integer goodsId,@Param("goodsName")String goodsName,
			@Param("goodsTypeId")Integer goodsTypeId,@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws  Exception;
	
	public int getGoodsCount(@Param("goodsId")Integer goodsId,@Param("goodsName")String goodsName,
			@Param("goodsTypeId")Integer goodsTypeId)throws Exception;
	
	public int deleteGoods(@Param("goodsId")Integer goodsId)throws Exception;
	
	public int updateGoods(Goods goods)throws Exception;
	
	
	public int addGoodsType(@Param("goodsTypeName")String goodsTypeName)throws Exception;
	
	public int updateGoodsType(GoodsType type)throws Exception;
	
	public int deleteGoodsType(@Param("goodsTypeId")Integer goodsTypeId)throws Exception;
	
	
	public List<GoodsOrder> getGoodsMoneyList(@Param("date1")String date1,@Param("date2")String date2,
			@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws Exception;
	
	public List<GoodsOrder> getGoodsMoneyCount(@Param("date1")String date1,@Param("date2")String date2)throws Exception;
	
	public List<Goods> getGoodsOrderList(@Param("date")String date,
			@Param("form")Integer form,@Param("pageSize")Integer pageSize)throws Exception;
	
	public int getGoodsOrderCount(@Param("date")String date)throws Exception;
	
	
	public int addGoodsOrder(GoodsOrder order)throws Exception;
}
