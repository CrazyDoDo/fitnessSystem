<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>销售明细</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/membrseInfo.css" rel="stylesheet">
    <style type="text/css">
		.bulk_action{cursor:pointer;}	
    </style>    
</head> 
<body  style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
		      	<div class="column"><span class="current">销售明细</span></div>
		      	<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282; padding-top: 0px;padding-bottom: 1px;">
									<td class="column-title">编号<input type="hidden" value="${date}" id="date"></td>
									<td class="column-title">商品名称</td>
									<td class="column-title">类型</td>
									<td class="column-title">单位</td>
		                            <td class="column-title">价格(元)</td>
									<td class="column-title">库存</td>
									<td class="column-title">售出数量</td>      
									<td class="column-title">收益(元)</td>      
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
		var date=$("#date").val();
		$.post("fitness/goodsController/getGoodsOrderList.json","date="+date+"&pageIndex=" + pageIndex, showPersonalDrop, "JSON");
		function showPersonalDrop(date) {
			var goodsList = date.goodsList;
			for ( var i = 0; i < goodsList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer' name='fitness/goodsController/goXiaoShouMingxi?date="+goodsList[i].date+"'>"
										+ "<td class='update'>"
										+goodsList[i].goodsId+ "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsName + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsTypename + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsUnit + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsPrice + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsCount + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].goodsSum + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].money + "</td>/tr>");

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

</script>
</html>
