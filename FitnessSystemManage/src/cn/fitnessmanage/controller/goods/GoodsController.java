package cn.fitnessmanage.controller.goods;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.fitnessmanage.pojo.Employees;
import cn.fitnessmanage.pojo.Goods;
import cn.fitnessmanage.pojo.GoodsOrder;
import cn.fitnessmanage.pojo.GoodsType;
import cn.fitnessmanage.service.goods.GoodsService;
import cn.fitnessmanage.tools.Constants;
import cn.fitnessmanage.tools.PageSupport;

/**
 *@author唐凡
 *@time2017-8-12-下午11:28:42
 *@description
 */
@Controller
@RequestMapping("fitness/goodsController")
public class GoodsController {
	
	@Resource
	private GoodsService goodsService;
	
	private Integer result;
	
	private PageSupport page;
	
	/**
	 * 前往添加商品页面
	 * @return
	 */
	@RequestMapping("goAddGoods")
	public String goAddGoods(HttpServletRequest request){
		try {
			request.getSession().setAttribute("goodsType", goodsService.getGoodsTypeList(0, 100));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "waterBar/addGoods";
	}
	
	/**
	 * 前往商品管理页面
	 * @return
	 */
	@RequestMapping("goGoodsManage")
	public String goGoodsManage(){
		return "waterBar/goodsManage";
	}
	
	/**
	 * 前往添加商品类型页面
	 * @return
	 */
	@RequestMapping("goGoodsType")
	public String goGoodsType(){
		return "waterBar/goodsType";
	}
	
	/**
	 * 添加商品
	 * @return
	 */
	@RequestMapping("addGoods.json")
	@ResponseBody
	public Integer addGoods(Goods goods){
		try {
			result=goodsService.addGoods(goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 返回商品最大的编号
	 * @return
	 */
	@RequestMapping("getGoodsMaxId.json")
	@ResponseBody
	public Integer getGoodsMaxId(){
		try {
			result=goodsService.getGoodsMaxId();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 分页返回,所有商品集合
	 */
	@RequestMapping("getGoodsList.json")
	@ResponseBody
	public PageSupport getGoodsList(
			@RequestParam("pageIndex")String pageIndex,@RequestParam("goodsId")Integer goodsId,
			@RequestParam("goodsName")String goodsName,@RequestParam("goodsTypeId")Integer goodsTypeId){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(goodsService.getGoodsCount(goodsId,goodsName,goodsTypeId));
			List<Goods> goodsList=goodsService.getGoodsList(goodsId,goodsName,goodsTypeId,(page.getCurrentPageNo()-1)*page.getPageSize(), page.getPageSize());
			page.setGoodsList(goodsList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	/**
	 * 根据商品编号删除商品
	 * @return
	 */
	@RequestMapping("deleteGoods.json")
	@ResponseBody
	public Integer deleteGoods(@RequestParam("goodsId")Integer goodsId){
		try {
			result=goodsService.deleteGoods(goodsId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 修改商品信息
	 * @return
	 */
	@RequestMapping("updateGoods.json")
	@ResponseBody
	public Integer updateGoods(Goods goods){
		try {
			result=goodsService.updateGoods(goods);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 分页返回所有商品类型
	 */
	@RequestMapping("getGoodsTypeList.json")
	@ResponseBody
	public PageSupport getGoodsTypeList(@RequestParam("pageIndex")String pageIndex){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount(goodsService.getGoodsTypeCount());
			List<GoodsType> goodsTypeList=goodsService.getGoodsTypeList((page.getCurrentPageNo()-1)*page.getPageSize(),  page.getPageSize());
			page.setGoodsTypeList(goodsTypeList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	
	/**
	 * 删除商品类型
	 * @return
	 */
	@RequestMapping("deleteGoodsType.json")
	@ResponseBody
	public Integer deleteGoodsType(@RequestParam("goodsTypeId")Integer goodsTypeId){
		try {
			result=goodsService.deleteGoodsType(goodsTypeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 添加商品类型
	 * @return
	 */
	@RequestMapping("addGoodsType.json")
	@ResponseBody
	public Integer addGoodsType(@RequestParam("goodsTypeName")String goodsTypeName){
		try {
			result=goodsService.addGoodsType(goodsTypeName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 修改商品类型
	 * @return
	 */
	@RequestMapping("updateGoodsType.json")
	@ResponseBody
	public Integer updateGoodsType(GoodsType type){
		try {
			result=goodsService.updateGoodsType(type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 前往销售报表页面
	 * @return
	 */
	@RequestMapping("goLockersJilu")
	public String goLockersJilu(){
		return "waterBar/lockersJilu";
	}
	
	/**
	 * 返回每日的销售总金额
	 */
	@RequestMapping("getGoodsMoneyList.json")
	@ResponseBody
	public PageSupport getGoodsMoneyList(@RequestParam("pageIndex")String pageIndex,
			@RequestParam("date1")String date1,@RequestParam("date2")String date2){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount((goodsService.getGoodsMoneyCount(date1, date2)).size());
			List<GoodsOrder> goodsOrderList=goodsService.getGoodsMoneyList(date1, date2,(page.getCurrentPageNo()-1)*page.getPageSize(),  page.getPageSize());
			page.setGoodsOrderList(goodsOrderList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}

	/**
	 *前往销售明细页面
	 */
	@RequestMapping("goXiaoShouMingxi")
	public String  goXiaoShouMingxi(@RequestParam("date")String date,HttpServletRequest request){
		request.setAttribute("date", date);
		return "waterBar/xiaoShouMingxi";
	}
	
	/**
	 * 返回按时间查找的销售记录
	 */
	@RequestMapping("getGoodsOrderList.json")
	@ResponseBody
	public PageSupport getGoodsOrderList(@RequestParam("pageIndex")String pageIndex,
			@RequestParam("date")String date){
		page=new PageSupport();
		Integer currentPageNo=1;
		if(pageIndex!=null && !pageIndex.equals(""))
			currentPageNo=Integer.parseInt(pageIndex);
		try {
			page.setCurrentPageNo(currentPageNo);
			page.setPageSize(Constants.pageSize);
			page.setTotalCount((goodsService.getGoodsOrderCount(date)));
			List<Goods> goodsList=goodsService.getGoodsOrderList(date,(page.getCurrentPageNo()-1)*page.getPageSize(),  page.getPageSize());
			page.setGoodsList(goodsList);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return page;
	}
	
	/**
	 * 前往商品销售页面
	 * @return
	 */
	@RequestMapping("goGoodsXiaoshou")
	public String goGoodsXiaoshou(HttpServletRequest request){
		try {
			request.getSession().setAttribute("goodsType", goodsService.getGoodsTypeList(0, 100));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "waterBar/goodsXiaoshou";
	}
	
	
	/**
	 * 会员购买商品,添加商品订单
	 * @return
	 */
	@RequestMapping("addGoodsOrder.json")
	@ResponseBody
	public Integer addGoodsOrder(GoodsOrder order,HttpServletRequest request){
		try {
			order.setDate(new Date());
			Employees emp=(Employees)request.getSession().getAttribute(Constants.USER_SESSION);
			order.setEmployeesId(emp.getEmployeesId());
			result=goodsService.addGoodsOrder(order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	
	
}
