<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>上课详情</title>
<link href="${pageContext.request.contextPath}/statics/css/base.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css2/easyui.css">
<link
	href="${pageContext.request.contextPath}/statics/css/personalBase.css"
	rel="stylesheet">
</head>
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div title="上课详情" data-options="closable:false" class="basic-info">
				<div class="column">
					<span class="current">上课详情</span>
				</div>
				<form action="#" method="post" id="formInfo">
							 <input type="hidden" name="membersId" value="${membersId}">
							 <input type="hidden" name="personalId" value="${personalId}">
					时间范围: <input type="text" size="25px" id="date1" name="date1"
						onClick="WdatePicker()" class="Wdate" />&nbsp;至 <input
						type="text" size="25px" id="date2"   name="date2" onClick="WdatePicker()"
						class="Wdate" /> <input type="button" id="select" name="select"
						value="快速查询"
						style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
					<input type="reset" name="select" value="重置"
						style="padding-left:15px; background-color:#828282; color:#FFF;width:70px; height:28px;">
				</form>

				<div class="table-responsive" style="margin-top: 5px;">
					<table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings" style="background-color:#828282">
								<th class="column-title">编号</th>
								<th class="column-title">会员卡号</th>
								<th class="column-title">会员姓名</th>
								<th class="column-title">手机号</th>
								<th class="column-title">预约上课时间</th>
								<th class="column-title">状态</th>
								<th class="column-title">备注</th>
							</tr>
						</thead>

						<tbody class="memcard">
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

</body>
<script type="text/javascript">
/*用于定位当前页码*/
	var goPageIndex = 1;
	//初始化会员信息
	function nextPages(pageIndex) {
		$(".pagination").html("");
		$(".memcard").html("");
		var formInfo=$("#formInfo").serialize();
		$.post("fitness/siJiaoDengJi/getPersonalDropList.json", "pageIndex=" + pageIndex+"&"+formInfo,
				  showPersonalLever, "JSON");
		function showPersonalLever(date) {
			var personalDropList = date.personalDropList;
			for ( var i = 0; i < personalDropList.length; i++) {
				$(".memcard")
						.append(
								"<tr class='even pointer'>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update'>"
										+ personalDropList[i].membersId+ "</td>"
										+ "<td class='update'>"
										+ personalDropList[i].memName + "</td>"
										+ "<td class='update'>"
										+ personalDropList[i].memPhone + "</td>"
										+ "<td class='update'>"
										+ personalDropList[i].date + "</td>"
										+ "<td class='update'>"
										+ personalDropList[i].state + "</td>"
										+ "<td class='update'>"
										+ personalDropList[i].common + "</td></tr>");

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
	
	//根据会员卡号搜索会员信息
	$("#select").click(function() {
		nextPages(1);
	});
</script>
</html>
