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
    <title>商品分类</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/curriculumtianjia.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css"> 
        <style type="text/css">
		.infoList{cursor:pointer;}	
		 td span{color:#000}
    </style>
</head> 
<body style="background-color:#FFF">
	<jsp:include page="../common/ModalDialogGoods.jsp"></jsp:include>
	<div class="container"  style="width: 100% ;padding-left:0px">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
		      <div title="商品分类" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">商品分类</span>
		      	 <img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17"
				  style="margin:0px 0px 0px 70px; cursor:pointer">
		      	</div>
					<input type="button"  id="add" value="+添加商品分类" style="width:120px; margin-bottom:5px; margin-left: 0px;"/> 
		      <div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282; padding-top: 0px;padding-bottom: 1px;">
									<th style="padding-top: 0px;padding-bottom: 0px">
									<input type="checkbox" id="123all" class="123" >
									</th>
									<th class="column-title">编号</th>
									<th class="column-title">商品分类</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除商品类型(<span
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
<script type="text/javascript">
/*用于定位当前页码*/
	var goPageIndex = 1;
	//初始化会员信息
	function nextPages(pageIndex) {
		$(".pagination").html("");
		$(".infoList").html("");
		$.post("fitness/goodsController/getGoodsTypeList.json", "pageIndex=" + pageIndex, showPersonalDrop, "JSON");
		function showPersonalDrop(date) {
			var goodsTypeList = date.goodsTypeList;
			for ( var i = 0; i < goodsTypeList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer'>"
										+ "<td style='padding-top: 0px;padding-bottom: 0px'><input type='checkbox' aa='1' class='flat' name='table_records' value='"
										+ goodsTypeList[i].goodsTypeId + "'></td>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update'>"
										+ goodsTypeList[i].goodsTypeName + "</td></tr>");

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
					var goodsTypeId = $(this).val();
					$.post("fitness/goodsController/deleteGoodsType.json", "goodsTypeId=" + goodsTypeId,
							deleteGoodsType, "JSON");
					function deleteGoodsType(data) {
						if(data<=0){
							$.MsgBox.Alert("提示","删除失败,请联系管理员");
						}
					}
				});
		goFirst(goPageIndex);
		nodeletememcard();
	}
	
	
	//打开添加商品类型模态框
	$("#add").click(function(){
		 $("span[id*='error']").text("");
		 $("#goodsType").val("");
		 $("#addGoodsType").modal("show");
	});
	
	//执行添加商品类型
	$("#saveGoodsType").click(function(){
		if( $("#goodsType").val()==""){
			$("#error5").text("请输入商品名称");
				return "";
		}
		var goodsTypeName=$("#goodsType").val();
		$.post("fitness/goodsController/addGoodsType.json", "goodsTypeName=" + goodsTypeName,
								addGoodsType, "JSON");
			function addGoodsType(data) {
				if(data<=0){
					$.MsgBox.Alert("提示","添加失败,请联系管理员");
				}else{
					goFirst(goPageIndex);
				}
			}
		 $("#addGoodsType").modal("hide");
	});
	
	//打开修改商品类型模态框
	$(".infoList").on("click",".update", function(){
		$("span[id*='error']").text("");
		$("#typeId").val($(this).parent("tr").find(".flat").val());
		$("#typeName").val($(this).parent("tr").find("td:eq(2)").text());
		$("#updateGoodsType").modal("show");
	});
	
	//执行修改商品类型
	$("#updateType").click(function(){
		if( $("#typeName").val()==""){
			$("#error6").text("请输入商品名称");
				return "";
		}
		var goodsTypeName=$("#typeName").val();
		var goodsTypeId=$("#typeId").val();
		$.post("fitness/goodsController/updateGoodsType.json", "goodsTypeName=" + goodsTypeName+"&goodsTypeId="+goodsTypeId,
								updateGoodsType, "JSON");
			function updateGoodsType(data) {
				if(data<=0){
					$.MsgBox.Alert("提示","添加失败,请联系管理员");
				}else{
					goFirst(goPageIndex);
				}
			}
		 $("#updateGoodsType").modal("hide");
	});
	
	


</script>
</html>
