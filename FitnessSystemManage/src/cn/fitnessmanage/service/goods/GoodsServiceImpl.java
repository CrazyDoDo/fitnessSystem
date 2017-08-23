package cn.fitnessmanage.service.goods;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.fitnessmanage.dao.goods.GoodsMapper;
import cn.fitnessmanage.pojo.Goods;
import cn.fitnessmanage.pojo.GoodsOrder;
import cn.fitnessmanage.pojo.GoodsType;

/**
 *@author唐凡
 *@time2017-8-12-下午11:30:40
 *@description
 */
@Service
public class GoodsServiceImpl implements GoodsService {
		
		@Resource
		private GoodsMapper goodsMapper;
	
	/**
	 * 返回商品类型集合
	 */
	public List<GoodsType> getGoodsTypeList(Integer form, Integer pageSize)
			throws Exception {
		return goodsMapper.getGoodsTypeList(form, pageSize);
	}
	
	/**
	 * 返回商品类型记录总数
	 */
	public int getGoodsTypeCount() throws Exception {
		return goodsMapper.getGoodsTypeCount();
	}
	
	/**
	 * 添加商品
	 */
	public int addGoods(Goods goods) throws Exception {
		return goodsMapper.addGoods(goods);
	}

	/**
	 * 返回商品最大的编号
	 */
	public int getGoodsMaxId() throws Exception {
		return goodsMapper.getGoodsMaxId();
	}
	/**
	 * 返回商品集合
	 */
	public List<Goods> getGoodsList(Integer goodsId,String goodsName,
			Integer goodsTypeId, Integer form, Integer pageSize)
			throws Exception {
		return goodsMapper.getGoodsList(goodsId, goodsName, goodsTypeId, form, pageSize);
	}
	/**
	 * 返回商品记录总数
	 */
	public int getGoodsCount(Integer goodsId,String goodsName,
			Integer goodsTypeId) throws Exception {
		return goodsMapper.getGoodsCount(goodsId, goodsName, goodsTypeId);
	}
	
	/**
	 * 根据商品编号删除商品
	 */
	public int deleteGoods(Integer goodsId) throws Exception {
		return goodsMapper.deleteGoods(goodsId);
	}

	/**
	 * 修改商品信息
	 */
	public int updateGoods(Goods goods) throws Exception {
		return goodsMapper.updateGoods(goods);
	}

	/**
	 * 添加商品类型
	 */
	public int addGoodsType(String goodsTypeName) throws Exception {
		return goodsMapper.addGoodsType(goodsTypeName);
	}

	/**
	 * 修改商品类型
	 */
	public int updateGoodsType(GoodsType type) throws Exception {
		return goodsMapper.updateGoodsType(type);
	}

	/**
	 * 删除商品类型
	 */
	public int deleteGoodsType(Integer goodsTypeId) throws Exception {
		return goodsMapper.deleteGoodsType(goodsTypeId);
	}
	
	/**
	 * 返回每日的销售总金额
	 */
	public List<GoodsOrder> getGoodsMoneyList(String date1, String date2,
			Integer form, Integer pageSize) throws Exception {
		return goodsMapper.getGoodsMoneyList(date1, date2, form, pageSize);
	}
	
	/**返回所有的销售总金额记录数
	 * 
	 */
	public List<GoodsOrder> getGoodsMoneyCount(String date1, String date2) throws Exception {
		return goodsMapper.getGoodsMoneyCount(date1, date2);
	}

	/**
	 * 返回按时间查找的销售记录
	 */
	public List<Goods> getGoodsOrderList(String date, Integer form,
			Integer pageSize) throws Exception {
		return goodsMapper.getGoodsOrderList(date, form, pageSize);
	}
	
	/**
	 * 返回按时间查找的销售总记录
	 */
	public int getGoodsOrderCount(String date) throws Exception {
		return goodsMapper.getGoodsOrderCount(date);
	}
	
	/**
	 * 会员购买商品,添加商品订单
	 */
	public int addGoodsOrder(GoodsOrder order) throws Exception {
		return goodsMapper.addGoodsOrder(order);
	}

	
}
