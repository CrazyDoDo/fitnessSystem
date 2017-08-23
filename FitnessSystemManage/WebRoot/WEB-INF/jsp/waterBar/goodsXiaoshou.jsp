<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>商品销售</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/curriculumBase.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css"> 
    <style type="text/css">
		.infoList{cursor:pointer;}
		form span{color:#000;font-size:12px}	
		select{width: 150px;}	
    </style>
</head> 
<body style="background-color:#FFF">
	<jsp:include page="../common/ModalDialogGoods.jsp"></jsp:include>
	<div class="container"  style="width: 100% ;padding-left:0px">
		<div class="content">
		      	<div class="column"><span class="current">商品销售</span>
		      	 <img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17"
				  style="margin:0px 0px 0px 70px; cursor:pointer">
		      	</div>
              		<form action="#" method="post" id="formGoods">
						 <span >商品编码:</span>
						 	<input type="text" name="goodsId" size="20px" style="height:20px;">
						 <span >商品名称:</span>
						  	<input type="text" name="goodsName" size="20px" style="height:20px;">
						 <span>商品类型</span> 
		                            	<select name="goodsTypeId">
		                            		<option value="0">请选择</option>
		                            		<c:forEach items="${goodsType}" var="type">
		                            			<option value="${type.goodsTypeId}">${type.goodsTypeName}</option>
		                            		</c:forEach>
		                                </select>
						<input type="button" id="select" name="select" value="快速查询"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
						<input type="reset" name="select" value="重置"
							style="padding-left:10px; background-color:#828282; color:#FFF;width:70px; height:28px;">
					</form>
		      <div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282; padding-top: 0px;padding-bottom: 1px;">
									<th class="column-title">商品编码</th>
									<th class="column-title">商品名称</th>
									<th class="column-title">价格(元)</th>
									<th class="column-title">类型</th>
									<th class="column-title">单位</th>
									<th class="column-title">库存</th>
								</tr>
							</thead>

							<tbody class="infoList">
							</tbody>
							
						</table>
					</div>
					<div class="dataTables_paginate paging_simple_numbers"
						id="datatable_paginate" style="height:20px; margin-bottom:30px;">
						<ul class="pagination">
						</ul>
					</div>
		      </div>
		    </div>
</body> 
<script type="text/javascript">
/*用于定位当前页码*/
	var goPageIndex = 1;
	//初始化会员信息
	function nextPages(pageIndex) {
		$(".pagination").html("");
		$(".infoList").html("");
		var formGoods=$("#formGoods").serialize();
		$.post("fitness/goodsController/getGoodsList.json",formGoods+"&pageIndex=" + pageIndex, showPersonalDrop, "JSON");
		function showPersonalDrop(date) {
			var goodsList = date.goodsList;
			for ( var i = 0; i < goodsList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer'>"
										+ "<td class='update'>"
										+goodsList[i].goodsId+ "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsName + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsPrice + "</td>"
										+ "<td class='update' name='"+goodsList[i].goodsTypeId+"'>"
										+ goodsList[i].goodsTypename + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsUnit + "</td>"
										+ "<td class='update'><input type='hidden' class='common' name='common' value='"+goodsList[i].common+"'>"
										+ goodsList[i].goodsCount + "</td></tr>");

			}
			// 给首页,下一页,上一页,末页赋值
			var index = 1;
			var page = date;
			$(".pagination")
					.append(
							"<li class='paginate_button' id='datatable_previous'>"
									+ "<a  aria-controls='datatable' data-dt-idx='0' tabindex='0'>"
									+ "总页数[" + page.currentPageNo + "/"
									+ page.totalPageCount + "]</a></li>");
			if (page.currentPageNo > 1) {
				$(".pagination")
						.append(
								"<li class='paginate_button' id='datatable_previous'>"
										+ "<a onclick='javascript:goFirst(1)' tabindex='0'>首页</a></li>");
				$(".pagination").append(
						"<li class='paginate_button' id='datatable_previous'>"
								+ "<a  onclick='javascript:goFirst("
								+ (page.currentPageNo - 1) + ")'>上一页</a></li>");
				Index = page.currentPageNo;
			}
			if (page.currentPageNo < page.totalPageCount) {
				$(".pagination").append(
						"<li class='paginate_button' id='datatable_previous'>"
								+ "<a  onclick='javascript:goFirst("
								+ (page.currentPageNo + 1) + ")'>下一页</a></li>");
				$(".pagination").append(
						"<li class='paginate_button' id='datatable_previous'>"
								+ "<a  onclick='javascript:goFirst("
								+ page.totalPageCount + ")'>尾页</a></li>");
				Index = page.currentPageNo;
			}
			;
		}
	}
 	//初始化会员信息
	$(function() {
		nextPages(1);
	}); 
	// 去首页,下一页,上一页,末页
	function goFirst(pageIndex) {
		nextPages(pageIndex);
		goPageIndex = pageIndex;
	}
	// 刷新会员列表
	$("#update").click(function() {
		goFirst(goPageIndex);
	});
	// 按条件搜索信息
	$("#select").click(function() {
		goFirst(goPageIndex);
	});
	
	//选中变色,改变标题
	$(".infoList").on("click",".flat", function() {
		titleUpdate();
		if ($(this).attr("aa") == 1) {
			$(this).parent().parent().css("background-color", "#E6F9F7");
			$(this).attr("aa", 0);
		} else {
			$(this).parent().parent().css("background-color", "#FFF");
			$(this).attr("aa", 1);
		}
	});
	
		//打开修改商品信息窗口
	$(".infoList").on("click",".update", function(){
		var goodsName=$(this).parent("tr").find("td:eq(1)").text();
		var goodsPrice=$(this).parent("tr").find("td:eq(2)").text();
		var goodsId=$(this).parent("tr").find("td:eq(0)").text();
		$("#goodsXiaoShou").find("input[name='goodsName']").val(goodsName);
		$("#goodsXiaoShou").find("input[name='goodsPrice']").val(goodsPrice);
		$("#goodsXiaoShou").find("input[name='goodsId']").val(goodsId);
		
		//打开模态框前清空表单
		$("span[id*='error']").text("");
		$("#goodsXiaoShou").find("input[name='membersId']").val("");
		$("#goodsXiaoShou").find("#goodsSum").val("");
		$("#goodsXiaoShou").find("input[name='money']").val("");
		
	    $("#goodsXiaoShou").modal("show");
	});  
	
	$("#goodsSum").blur(function(){
		var sum=$(this).val();
		var price=$("#goodsXiaoShou").find("input[name='goodsPrice']").val();
		var money=sum*price;
		$("input[name='money']").val(money);
	});
	
	$("#saveXiaoShou").click(function(){
			if($("input[name='membersId']").val()==""){
	   				$("span[id*='error']").text("");
	    			$("#error7").text("请输入会员卡号");
	    			return ;
	    	}if($("#goodsSum").val()==""){
	    			$("span[id*='error']").text("");
	    			$("#error8").text("请输入数量");
	    			return ;
	    	}
	    var formOrder=$("#formOrder").serialize();
	    $.post("fitness/goodsController/addGoodsOrder.json",formOrder, addGoodsOrder, "JSON");	 
	    	function addGoodsOrder(data){
	    		if(data>0){
					$("#goodsXiaoShou").modal("hide");
					setTimeout(function(){$.MsgBox.Alert("提示","购买成功");},300);
				}else{
					setTimeout(function(){$.MsgBox.Alert("提示","购买失败,请联系管理员");},300);
				}
	    	}
	    	
	});
</script>
</html>
