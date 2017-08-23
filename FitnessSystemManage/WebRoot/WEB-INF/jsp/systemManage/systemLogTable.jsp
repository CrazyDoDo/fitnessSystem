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
    <title>岗位列表</title> 
    <link href="${pageContext.request.contextPath}/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/basic_info.css" rel="stylesheet">
</head> 
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
					<div class="column">
						<span class="current">岗位列表</span><img id="update"
							src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg"
							width="40" height="17"
							style="margin:0px 0px 0px 70px; cursor:pointer">
					</div>
					<form action="#" method="post" id="formInfo" style="margin-bottom:5px;">
						<span style="font-size:12px; color:black;">岗位名称:</span>
						 	<input type="text" name="name" size="20px" style="height:20px;  margin-right:10px;">
					    <span style="font-size:12px; color:black;">操作日期:</span>
					   		<input type="text" size="25px" name="date1" onClick="WdatePicker()" class="Wdate">
					    <span style="font-size:12px; color:black;">&nbsp;至&nbsp;</span>
					    	<input type="text" size="25px" name="date2" onClick="WdatePicker()" class="Wdate">
						<input type="button" id="select" name="select" value="快速查询"
							 style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
						<input type="reset" name="select" value="重置"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:70px; height:28px;">
					</form>
					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th></th>
									<th class="column-title">编号</th>
									<th class="column-title">操作人</th>
									<th class="column-title">操作模块</th>
									<th class="column-title">操作时间</th>
									<th class="column-title">详细</th>
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
		var formInfo = $("#formInfo").serialize();
		$.post("fitness/emoloyeesController/getSystemLogList.json", "pageIndex="
				+ pageIndex + "&" + formInfo, getSystemLogList, "JSON");
		function getSystemLogList(date) {
			var systemLogList = date.systemLogList;
			for ( var i = 0; i < systemLogList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer'>"
										+ "<td ></td>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update'>"
										+ systemLogList[i].name
										+ "</td><td class='update'>"
										+ systemLogList[i].module
										+ "</td><td class='update'>" 
										+ systemLogList[i].date
										+ "</td><td class='update'>" 
										+ systemLogList[i].comment
										+ "</td></tr>");

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

	// 快速搜索会员列表
	$("#select").click(function() {
		goFirst(1);
	});

	//选中变色,改变标题
	$(".infoList").on("click", ".flat", function() {
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


