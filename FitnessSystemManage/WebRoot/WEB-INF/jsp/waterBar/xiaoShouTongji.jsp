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
<title>租柜统计</title>
<link href="${pageContext.request.contextPath}/statics/css/base.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css2/easyui.css">
<link
	href="${pageContext.request.contextPath}/statics/css/basic_info.css"
	rel="stylesheet">
</head>
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="租柜统计" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">已租储物柜</span><img id="update"
							src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg"
							width="40" height="17"
							style="margin:0px 0px 0px 70px; cursor:pointer">
					</div>
					<form action="#" method="post" id="formLocker">
						<span style="font-size:12px">会员卡号:</span> <input type="text"
							name="membersId" size="20px" style="height:20px;"> <span
							style="font-size:12px">租柜日期:</span><input type="text" size="25px"
							name="startDate" onClick="WdatePicker()" class="Wdate"><span
							style="font-size:12px">&nbsp;至&nbsp;</span></input> <input type="text"
							size="25px" name="overDate" onClick="WdatePicker()" class="Wdate"></input>
						<input type="button" id="select" name="select" value="快速查询"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
						<input type="reset" name="select" value="重置"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:70px; height:28px;">
					</form>
					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th><input type="checkbox" id="123all" class="123">
									</th>
									<th class="column-title">储物柜编号</th>
									<th class="column-title">会员卡号</th>
									<th class="column-title">会员姓名</th>
									<th class="column-title">储物柜类型</th>
									<th class="column-title">起租日期</th>
									<th class="column-title">到期日期</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除会员租柜(<span
											class="action-cnt"></span>)</a></th>
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
				<div title="储物柜管理" data-options="closable:false" class="basic-info">
					<iframe class='page-iframe'
						src='fitness/lockerController/goLockersTable' frameborder='no'
						border='no' height='480px' width='100%' scrolling='auto'></iframe>
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
		var locker = $("#formLocker").serialize();
		$.post("fitness/lockerController/getLockerOrderList.json", "pageIndex="
				+ pageIndex + "&" + locker, getLockerOrderList, "JSON");
		function getLockerOrderList(date) {
			var lockerOrderList = date.lockerOrderList;
			for ( var i = 0; i < lockerOrderList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer'>"
										+ "<td style='padding-top: 5px'><input type='checkbox' aa='1' class='flat' name='table_records' value='"
										+ lockerOrderList[i].lockerOrderId + "'></td>"
										+ "<td class='update'>" + "V-"
										+ lockerOrderList[i].lockerId + "</td>"
										+ "<td class='update'>"
										+ lockerOrderList[i].membersId
										+ "</td>" + "<td class='update'>"
										+ lockerOrderList[i].membersName
										+ "</td>" + "<td class='update'>"
										+ lockerOrderList[i].lockerType
										+ "</td>" + "<td class='update'>"
										+ lockerOrderList[i].startDate
										+ "</td>" + "<td class='update'>"
										+ lockerOrderList[i].overDate
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

	//全选和取消全选
	$(".123").click(function() {
		if (this.checked == true) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = true;
			});
			$(".flat").parent().parent().css("background-color", "#E6F9F7");
			$(".flat").attr("aa", 0);
		} else if (this.checked == false) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = false;
			});
			$(".flat").parent().parent().css("background-color", "#FFF");
			$(".flat").attr("aa", 1);
		}
		titleUpdate();
	});

	//删除租柜信息
	$(".antoo").click(
			function() {
				var info = $(this).find("span").text();
				$.MsgBox.Confirm("提示", "是否删除这" + info, deletePersonalDrop,
						nodeletememcard);
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
					var lockerOrderId = $(this).val();
					$.post("fitness/lockerController/deleteLocerOrder.json",
							"lockerOrderId=" + lockerOrderId, deleteLocerOrder,
							"JSON");
					function deleteLocerOrder(data) {
					}
				});
		goFirst(goPageIndex);
		nodeletememcard();
	}

	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();
</script>
</html>
