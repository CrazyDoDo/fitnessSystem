package cn.fitnessmanage.service.goods;

import java.util.List;
import cn.fitnessmanage.pojo.Goods;
import cn.fitnessmanage.pojo.GoodsOrder;
import cn.fitnessmanage.pojo.GoodsType;

/**
 *@author唐凡
 *@time2017-8-12-下午11:30:19
 *@description
 */
public interface GoodsService {
	public  List<GoodsType> getGoodsTypeList(Integer form,Integer pageSize)throws Exception;
	
	public int  getGoodsTypeCount()throws Exception;
	
	public int addGoods(Goods goods)throws Exception;
	
	public int getGoodsMaxId()throws Exception;
	
	
	public List<Goods> getGoodsList(Integer goodsId,String goodsName,
			Integer goodsTypeId,Integer form,Integer pageSize)throws  Exception;
	
	public int getGoodsCount(Integer goodsId,String goodsName,
			Integer goodsTypeId)throws Exception;
	
	public int deleteGoods(Integer goodsId)throws Exception;
	
	public int updateGoods(Goods goods)throws Exception;
	
	
	public int addGoodsType(String goodsTypeName)throws Exception;
	
	public int updateGoodsType(GoodsType type)throws Exception;
	
	public int deleteGoodsType(Integer goodsTypeId)throws Exception;
	
	public List<GoodsOrder> getGoodsMoneyList(String date1,String date2,
			Integer form,Integer pageSize)throws Exception;
	
	public List<GoodsOrder> getGoodsMoneyCount(String date1,String date2)throws Exception;
	
	public List<Goods> getGoodsOrderList(String date,
			Integer form,Integer pageSize)throws Exception;
	
	public int getGoodsOrderCount(String date)throws Exception;
	
	public int addGoodsOrder(GoodsOrder order)throws Exception;
}
