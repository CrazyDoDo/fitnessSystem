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
<title>预约列表</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link
	href="${pageContext.request.contextPath }/statics/css/curriculumtianjia.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css">
<style type="text/css">
.div {
	width: 100%;
	background-color: #DADADA;
	height: 80px;
}

.td1 {
	width: 250px;
	padding-left: 30px;
	color: #F81;
	margin-bottom: 20px;
}

.td2 {
	padding-left: 20px;
}

.div td {
	font-size: 16px;
	height: 35px;
	margin-bottom: 5px;
}

.kv-content {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../common/ModalDialog.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="div">
				<table>
					<tr>
						<td class="td2">课程类型:</td>
						<td class="td1">团体教室</td>
						<td>课程名称:</td>
						<td class="td1">${order.courseName}</td>
						<td>上课教练:</td>
						<td class="td1">${order.personalName}</td>
					</tr>
					<tr>
						<td class="td2">上课时间:</td>
						<td class="td1">${order.stratdate}</td>
						<td>容纳人数:</td>
						<td class="td1" id="sum">${order.count}</td>
						<td>已预约:</td>
						<td class="td1" id="count">${count}</td>
					</tr>
				</table>
			</div>
			<table class="kv-table">
				<tbody id="infoList">
					<tr>
						<td class="kv-label" id="quan">全选</td>
						<td class="kv-label">手机号码</td>
						<td class="kv-label">姓名</td>
						<td class="kv-label">操作员</td>
					</tr>
				</tbody>
			</table>
			<form action="tianjiayuyue.jsp" method="post">
				<input type="hidden" id="orderId" value="${order.orderCurrID}">
				<input type="button" value="-取消预约" id="deleteOrder" name="quxiao"
					style="width:100px;" /> <input type="button" id="addSubmit"
					value="+增加预约" style="width:100px; margin:10px 10px 0px " />
			</form>
		</div>
	</div>

</body>
</html>
<script type="text/javascript">
	//显示页面
	function nextPages() {
		$("#infoList tr:gt(0)").remove();
		var orderId = $("#orderId").val();
		$.post("fitness/curriculum/getMembersOrderCurrList.json", "orderId="
				+ orderId, getMembersOrderCurrList, "JSON");
		function getMembersOrderCurrList(data) {
			for ( var i = 0; i < data.length; i++) {
				$("#infoList")
						.append(
								"<tr><td class='kv-content check'><input type='checkbox' class='deleteOrder' value='"+ data[i].membersOrderId+"'></td>"
										+ "<td class='kv-content'>"
										+ data[i].membersId
										+ "</td>"
										+ "<td class='kv-content'>"
										+ data[i].membersName
										+ "</td>"
										+ "<td class='kv-content'>"
										+ data[i].phone + "</td>");

			}
		}

	}
	//初始化加载页面
	$(function() {
		nextPages();
	});
	//打开预约上课框
	$("#addSubmit").click(function() {
		$("#error").text("");
		$("#MembersOrderCurr").modal("show");
	});
	//添加课程
	$("#addMembersOrder").click(
			function() {
				function addMemOrderCurr(){
					var orderId = $("#orderId").val();
					var membersId = $("#membersId").val();
					$.post("fitness/curriculum/addMembersOrderCurr.json",
							"orderId=" + orderId + "&membersId=" + membersId,
							addMembersOrderCurr, "JSON");
					function addMembersOrderCurr(data) {
						if (data > 0) {
							$("#count").text(data);
							nextPages();
							$("#MembersOrderCurr").modal("hide");
						}else if(data==-1){
							$("#error").text("该会员不存在!");
						}else if(data==-2){
							$("#error").text("该会员已报名!");
						}
					}
				}
				if($("#count").text()==$("#sum").text())
					$.MsgBox.Alert("消息","该课程人数已满");
				else	
					addMemOrderCurr();
			});

	//点击td选中checkbox
	$("#infoList").on("click", ".check", function() {
		if ($(this).find(":checkbox").is(":checked"))
			$(this).find(":checkbox").prop("checked", false);
		else
			$(this).find(":checkbox").prop("checked", true);
	});

	//全选和全部不选
	$("#quan").click(function() {
		if ($(this).text() == "全选") {
			$(this).text("取消全选");
			$("#infoList").find(":checkbox").each(function() {
				this.checked = true;
			});
		} else {
			$(this).text("全选");
			$("#infoList").find(":checkbox").each(function() {
				this.checked = false;
			});
		}
	});

	//删除会员预约上课
	$("#deleteOrder").click(
			function() {
				var membersOrders = [];
				$("#infoList").find(":checkbox").each(function() {
						if ($(this).is(":checked")) {
							membersOrders.push($(this).val());
						}
				});
				//如果没有选中单选框则不弹出提示确认框
				if(membersOrders.length==0){
					$.MsgBox.Alert("消息","请选中要取消的会员");
					return ;
				}			
			
		    	$.MsgBox.Confirm("消息","是否删除会员预约",deleteMemOrderCurr,quXiaoYuYue);
			
				function deleteMemOrderCurr() {
					var orderId = $("#orderId").val();
					$.post("fitness/curriculum/deleteMembersOrderCurr.json",
							"membersOrders=" + membersOrders + "&orderId="+ orderId, deleteMembersOrderCurr, "JSON");
					function deleteMembersOrderCurr(data) {
						if (data > 0) {
							$("#count").text(data);
						}
						nextPages();
					}
				}
				
				function quXiaoYuYue(){
						$("#quan").text("全选");
						$("#infoList").find(":checkbox").each(function() {
							this.checked = false;
						});
				}
				
			});
</script>

