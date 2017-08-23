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
<title>会员刷卡统计</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link
	href="${pageContext.request.contextPath }/statics/css/basic_info.css"
	rel="stylesheet">
</head>
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="会员刷卡统计" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">会员刷卡统计</span>
					</div>
					<form action="#" method="post">
						刷卡时间: <input type="text" size="25px" id="date1"
							onClick="WdatePicker()" class="Wdate">至</input> <input
							type="text" size="25px" id="date2" onClick="WdatePicker()"
							class="Wdate">
							<input type="button" id="select" name="select" value="快速查询"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
							<input type="reset" id="newreset" name="select" value="重置"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:70px; height:28px;">
					</form>
					<input type="hidden" id="membersId" value="${membersId}"> <input
						type="hidden" id="totalCount" value="${totalCount}">
					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th class="column-title">编号</th>
									<th class="column-title">日期</th>
									<th class="column-title">上午人数</th>
									<th class="column-title">下午人数</th>
									<th class="column-title">晚上人数</th>
									<th class="column-title">总人数</th>
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
	</div>

</body>
</html>
<script type="text/javascript">
	//前往指定页面
	function nextPages(pageIndex) {
		var startDate = $("#date1").val();
		var endDate = $("#date2").val();
		var membersId = $("#membersId").val();
		$(".pagination").html("");
		$(".memcard").html("");
		$.post("fitness/membrse/getMembersSwipingCount",
				"pageIndex=" + pageIndex + "&date1=" + startDate + "&date2="
						+ endDate, showTrading, "JSON");
		function showTrading(date) {
			var membersSwipingList = date.membersSwipingCount;
			for ( var i = 0; i < membersSwipingList.length; i++) {
				$(".memcard").append(
						"<tr class='even pointer'>" + "<td>" + (i + 1)
								+"</td><td >"+ membersSwipingList[i].startDate
								+ "</td><td >" + membersSwipingList[i].shangSum
								+ "</td><td >" + membersSwipingList[i].zhongSum
								+ "</td><td >" + membersSwipingList[i].wanSum 
								+ "</td><td >" + membersSwipingList[i].zongSum  
								+ "</td></tr>");
				totalCount = totalCount - 1;
				if (totalCount == 0) {
					totalCount = $("#totalCount").val();
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
	//按时间查找会员刷卡信息
	$("#select").click(function(){
		nextPages(1);
	});
	/*  var indexs=0;
	 $(function(){	//初始化加载会员刷卡信息
	 function loadPersonalOrder(){
	 var date1=$("input[name='date1']").val();
	 var date2=$("input[name='date2']").val();
	 $.post("../membrseTongjiServlet", "action=load"
	 + "&date1="+date1+ "&date2="+date2+"&pageIndex="+1, loadTrading, "JSON");
	
	 function loadTrading(data) {
	 var list = data.membersSwipingList;
	 $("#showmemRentInfo tr:gt(0)").remove();
	 for ( var i = 0; i < list.length; i++) {
	 $("#showmemRentInfo").append(
	 "<tr>" + "<td class='kv-content'>"
	 + (++indexs) + "</td>"
	 + "<td class='kv-content'>" + list[i].membersId
	 + "</td>" + "<td class='kv-content'>"
	 + list[i].membersName + "</td>"
	 + "<td class='kv-content'>" + list[i].employeesName
	 + "</td>" + "<td class='kv-content'>"
	 + list[i].stratDate + "</td>"
	 + "</tr>");
	 }
	 //给首页,下一页,上一页,末页赋值
	 var index = 1;
	 $("#ccc").append(
	 "总页数[" + data.currPageNo + "/" + data.totalPageCount
	 + "]");
	 if (data.currPageNo > 1) {
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst(1)'>首页</a>");
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + (data.currPageNo - 1) + ")'>上一页</a>");
	 }
	 if (data.currPageNo < data.totalPageCount) {
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + (data.currPageNo + 1) + ")'>下一页</a>");
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + data.totalPageCount + ")'>末页</a>");
	 }
	 ;				
	 }
	 }
	 loadPersonalOrder();
	 });
	
	 //去首页,下一页,上一页,末页
	 function goFirst(pageIndex) {
	 var date1=$("input[name='date1']").val();
	 var date2=$("input[name='date2']").val();
	 $("#ccc").html("");
	 $.ajax({
	 url : "../membrseTongjiServlet",
	 data : "action=load"
	 + "&date1="+date1+ "&date2="+date2+"&pageIndex="+ pageIndex,
	 dataType : "json",
	 success : function(data) {
	 indexs=0;
	 var list = data.membersSwipingList;
	 $("#showmemRentInfo tr:gt(0)").remove();
	 for ( var i = 0; i < list.length; i++) {
	 $("#showmemRentInfo").append(
	 "<tr>" + "<td class='kv-content'>"
	 + (++indexs) + "</td>"
	 + "<td class='kv-content'>" + list[i].membersId
	 + "</td>" + "<td class='kv-content'>"
	 + list[i].membersName + "</td>"
	 + "<td class='kv-content'>" + list[i].employeesName
	 + "</td>" + "<td class='kv-content'>"
	 + list[i].stratDate + "</td>"
	 + "</tr>");
	 }
	 //给首页,下一页,上一页,末页赋值
	 var index = 1;
	 $("#ccc").append(
	 "总页数[" + data.currPageNo + "/" + data.totalPageCount
	 + "]");
	 if (data.currPageNo > 1) {
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst(1)'>首页</a>");
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + (data.currPageNo - 1) + ")'>上一页</a>");
	 }
	 if (data.currPageNo < data.totalPageCount) {
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + (data.currPageNo + 1) + ")'>下一页</a>");
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + data.totalPageCount + ")'>末页</a>");
	 }
	 ;
	 },
	 error : function() {
	 alert("发生错误,请联系管理员!");
	 }

	 });
	 }
	
	 //搜索会员信息
	 $("#selectDate").click(
	 function() {
	 $("#ccc").html("");
	 var date1=$("input[name='date1']").val();
	 var date2=$("input[name='date2']").val();
	 $.post("../membrseTongjiServlet", "action=load"
	 + "&date1="+date1+"&date2="+date2, loadTrading, "JSON");
	 function loadTrading(data) {
	 var list = data.membersSwipingList;
	 indexs=0;
	 $("#showmemRentInfo tr:gt(0)").remove();
	 for ( var i = 0; i < list.length; i++) {
	 $("#showmemRentInfo").append(
	 "<tr>" + "<td class='kv-content'>"
	 + (++indexs) + "</td>"
	 + "<td class='kv-content'>" + list[i].membersId
	 + "</td>" + "<td class='kv-content'>"
	 + list[i].membersName + "</td>"
	 + "<td class='kv-content'>" + list[i].employeesName
	 + "</td>" + "<td class='kv-content'>"
	 + list[i].stratDate + "</td>"
	 + "</tr>");
	 }
	 //给首页,下一页,上一页,末页赋值
	 var index = 1;
	 $("#ccc").append(
	 "总页数[" + data.currPageNo + "/" + data.totalPageCount
	 + "]");
	 if (data.currPageNo > 1) {
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst(1)'>首页</a>");
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + (data.currPageNo - 1) + ")'>上一页</a>");
	 }
	 if (data.currPageNo < data.totalPageCount) {
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + (data.currPageNo + 1) + ")'>下一页</a>");
	 $("#ccc").append(
	 "<a onclick='javascript:goFirst("
	 + data.totalPageCount + ")'>末页</a>");
	 }
	 ;				
	 }
	 });	 */
	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();
</script>

