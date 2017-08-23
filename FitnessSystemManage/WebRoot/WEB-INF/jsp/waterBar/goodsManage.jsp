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
    <title>商品管理</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/curriculumtianjia.css" rel="stylesheet">
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
			<div class="easyui-tabs1" style="width:100%;height:100%;">
		      <div title="商品管理" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">商品管理</span>
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
									<th style="padding-top: 0px;padding-bottom: 0px">
									<input type="checkbox" id="123all" class="123" >
									</th>
									<th class="column-title">商品编码</th>
									<th class="column-title">商品名称</th>
									<th class="column-title">价格(元)</th>
									<th class="column-title">类型</th>
									<th class="column-title">单位</th>
									<th class="column-title">库存</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除商品(<span
											class="action-cnt"></span> )</a>
											
									</th>
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
		</div>
	</div>
</body> 
</html>
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
										+ "<td style='padding-top: 0px;padding-bottom: 0px'><input type='checkbox' aa='1' class='flat' name='table_records' value='"
										+ goodsList[i].goodsId + "'></td>"
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
	
	function titleUpdate() {
		var e = $(".bulk_action input[name='table_records']:checked").length;
		if (e > 0) {
			$(".column-title").hide(), $(".bulk-actions").show(), $(
					".action-cnt").html(e + " 条数据 ");
		} else {
			$(".column-title").show();
			$(".bulk-actions").hide();
		}
	}
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

	//全选和取消全选
	$(".123").click(function() {
		if (this.checked==true) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = true;
			});
			$(".flat").parent().parent().css("background-color", "#E6F9F7");
			$(".flat").attr("aa", 0);
		} else if(this.checked==false) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = false;
			});
			$(".flat").parent().parent().css("background-color", "#FFF");
			$(".flat").attr("aa", 1);
		}
		titleUpdate();
	});


	//删除会员卡信息
	$(".antoo").click(function() {
		var info = $(this).find("span").text();
		$.MsgBox.Confirm("提示", "是否删除这" + info, deletePersonalDrop, nodeletememcard);
	});
	function nodeletememcard() {
		$(":checkbox").attr("checked", false);
		$(".flat").parent().parent().css("background-color", "#FFF");
		$(".flat").attr("aa", 1);
		titleUpdate();
	}
	function deletePersonalDrop() {
		$(".bulk_action input[name='table_records']:checkbox:checked").each(
				function() {
					var goodsId = $(this).val();
					$.post("fitness/goodsController/deleteGoods.json", "goodsId=" + goodsId,
							deleteGoods, "JSON");
					function deleteGoods(data) {
						if(data<=0){
							$.MsgBox.Alert("提示","删除失败,请联系管理员");
						}
					}
				});
		goFirst(goPageIndex);
		nodeletememcard();
	}

	//打开修改商品信息窗口
	$(".infoList").on("click",".update", function(){
		$("span[id*='error']").text("");
		var goodsId=$(this).parent("tr").find("td:eq(1)").text();
		var goodsName=$(this).parent("tr").find("td:eq(2)").text();
		var goodsTypeId=$(this).parent("tr").find("td:eq(4)").attr("name");
		var goodsPrice=$(this).parent("tr").find("td:eq(3)").text();
		var goodsUnit=$(this).parent("tr").find("td:eq(5)").text();
		var goodsCount=$(this).parent("tr").find("td:eq(6)").text();
		var common=$(this).parent("tr").find(".common").val();
		if(common=="undefined")
			common="";
		$("#goodsId").val(goodsId);
		$("#goodsName").val(goodsName);
		$("#goodsPrice").val(goodsPrice);
		$("#goodsUnit").val(goodsUnit);
		$("#goodsCount").val(goodsCount);
		$("#common").val(common);
		$("#goodsTypeId option").removeAttr("selected");
		$("#goodsTypeId option[value='"+goodsTypeId+"']").attr("selected",true);
	    $("#updateGoodsModal").modal("show");
	}); 
	
	//修改商品信息
	$("#updateGoods").click(function(){
			if($("input[name='goodsName']").val()==""){
	   				$("span[id*='error']").text("");
	    			$("#error1").text("请输入商品名称");
	    			return ;
	    	}if($("input[name='goodsUnit']").val()=="" || $("input[name='goodsPrice']").val()==""
	    	||$("input[name='goodsCount']").val()==""){
	    			$("span[id*='error']").text("");
	    			$("#error2").text("单位,价格,库存均需要填写");
	    			return ;
	    	} 
	    	if( isNaN($("input[name='goodsPrice']").val()) || isNaN($("input[name='goodsCount']").val())){
	    		    $("span[id*='error']").text("");
	    			$("#error2").text("价格,库存请填写数字");
	    			return ;
	    	}
	    	if($("#goodsTypeId").val()==0){
	    			$("span[id*='error']").text("");
	    			$("#error3").text("请选择商品类型");
	    			return ;
	    	}
	    	if($("input[name='goodsId']").val()==0){
	    			$("span[id*='error']").text("");
	    			$("#error4").text("请输入商品编码");
	    			return ;
	    	}
		var formGoods=$("#goodsInfo").serialize();
		$.post("fitness/goodsController/updateGoods.json", formGoods,updateGoods, "JSON");
			function updateGoods(data) {
				if(data<=0){
							$.MsgBox.Alert("提示","修改失败,请联系管理员");
				}else{
					$("#updateGoodsModal").modal("hide");
					$.MsgBox.Alert("提示","修改成功");
					goFirst(goPageIndex);
				}
			}
	
	});


</script>

