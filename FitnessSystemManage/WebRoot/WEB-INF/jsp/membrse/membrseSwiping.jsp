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
<title>刷卡信息</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link href="${pageContext.request.contextPath }/statics/css/goodsInfoBase.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css">
</head>
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="column">
				<span class="current">刷卡信息</span>
			</div>
			<!--<form action="#" method="post">
                刷卡时间: <input type="text" size="25px" name="date1" onClick="WdatePicker()" class="Wdate">至</input>
                		<input type="text" size="25px" name="date2" onClick="WdatePicker()" class="Wdate"></input>
                        <input type="button" name="select" value="查询" id="selectDate">
                        <input type="reset" value="重置">
                </form> -->
			<input type="hidden" id="membersId" value="${membersId}">
			<input type="hidden" id="totalCount" value="${totalCount}">
				<div class="table-responsive">
				    <table class="table table-striped jambo_table bulk_action">
						<thead>
							<tr class="headings" style="background-color:#828282">
								<th class="column-title">编号</th>
								<th class="column-title">会员姓名</th>
								<th class="column-title">入场时间</th>
								<th class="column-title">累计刷卡</th>
								<th class="column-title">操作员</th>
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

</body>
</html>
<script type="text/javascript">
//获取总记录数
var totalCount=$("#totalCount").val();
	//前往指定页面
	function nextPages(pageIndex) {
		var startDate=$("date1").val();
		var endDate=$("").val();
		var membersId = $("#membersId").val();
		$(".pagination").html("");
		$(".memcard").html("");
		$.post("fitness/membersInfoController/getMembrseSwiping", "pageIndex="
				+ pageIndex + "&membersId=" + membersId, showTrading, "JSON");
		function showTrading(date) {
			var swipingList = date.swipingRecordList;
			for ( var i = 0; i < swipingList.length; i++) {
				$(".memcard").append(
								"<tr class='even pointer'>"
										+ "<td>"
										+ (i + 1)
										+ "</td><td >"
										+ swipingList[i].membersName
										+ "</td><td >"
										+ swipingList[i].stratDate
										+ "</td><td >"
										+ (totalCount)
										+ "</td><td >"
										+ swipingList[i].employeesName
										+ "</td></tr>");
								totalCount=totalCount-1;
								if(totalCount==0){
									 totalCount=$("#totalCount").val();
								}
					
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
	//初始化刷卡信息
	$(function() {
		nextPages(1);
	});
	// 去首页,下一页,上一页,末页
	function goFirst(pageIndex) {
		nextPages(pageIndex);
	}
	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();
</script>

