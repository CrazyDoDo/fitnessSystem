<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>私教业务</title>
<link href="${pageContext.request.contextPath }/statics/css/membrseAddbase.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link href="${pageContext.request.contextPath }/statics/css/membrsebasic.css" rel="stylesheet">
</head>
<body  style="background-color:#FFF;color:#000000">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="column">
				<span class="current">会员查询</span>
			</div>
			<form action="#" method="post" id="formDrop">
				会员卡号: <input type="text" name="membersId" id="membersId"
					style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;" />
				<input type="button" id="select" name="select" value="快速查询"
					style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
			<div id="dengji">
				<div class="column">
					<span class="current">预约登记</span>
				</div>
					<table class="kv-table">
						<tbody>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">姓名:</td>
								<td class="kv-content"><input type="text" name="name"
									size="40">
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">手机:</td>
								<td class="kv-content"><input type="text" name="phone"
									size="40">
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">健身教练:</td>
								<td class="kv-content">
								<select style=" width:285px; background-color:#EFEFEF" id="personalId" name="personalId">
										<option value="0">请选择</option>
								<c:forEach items="${personal}" var="item">
										<option value="${item.employeesId}">${item.name}</option>
								</c:forEach>
								</select>
								</td>
							</tr>
							
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">剩余课时:</td>
								<td class="kv-content"><input type="text" name="sumHour" size="40" id="sumHour" >
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">预约时间</td>
								<td class="kv-content"><input type="text" size="25" id="date"
									name="date" onClick="WdatePicker()" class="Wdate"
									style=" background-color:#EFEFEF;">
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">备注:</td>
								<td class="kv-content">
								 <textarea rows="3"  style="resize:none; width: 285px;" name="common"></textarea> 
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label"></td>
								<td class="kv-content"><input class="input" type="button" id="tijiao"
									value="提交"
									style="margin-left:30px; margin-right:10px; width:100px; height:30px;">
									<input class="input" type="reset" value="取消"
									style=" width:100px; height:30px;"></td>
							</tr>

						</tbody>
					</table>
				</form>
				</div>
			</div>
</body>
<script type="text/javascript">
	//搜索会员信息
	$("#select").click(
			function() {
				var membersId = $("#membersId").val();
				if (!isNaN(membersId)) {
					$.post("fitness/personal/getMembersInfo", "membersId="
							+ membersId, selectMemId, "JSON");
					//搜索会员信息的回调函数
					function selectMemId(date) {
						if (date== null || date == "") {
						    $.MsgBox.Alert("消息","不存在该会员");
						} else {
							$("input[name='name']").val(date.name);
							$("input[name='phone']").val(date.phone);
							
						}
					}
				}
			});
	
	//教练收费标准
	$("#personalId").change(function() {
			var personalId = $("#personalId").val();
			var membersId=$("#membersId").val();
			$.post("fitness/personal/getPersonalTraniingInfo.json","personalId="+personalId+"&membersId="+membersId,showMessage,"JSON");
			function showMessage(data){
				if(data==null)
					$("#sumHour").val(0);
				else	
				$("#sumHour").val(data.remainHour);
			}
	});
	
	//预约私教订单
	$("#tijiao")
			.click(
					function() {
						var date = $("#date").val();
						var personalId = $("#personalId").val();
						var fromDrop=$("#formDrop").serialize();
						if (personalId == 0 || date == null) {
							$.MsgBox.Alert("消息","请选择教练,和上课时间");
						}else if($("#sumHour").val()==0)
							$.MsgBox.Alert("消息","该教练的课时已上完,请续课");
						 else {
							$.MsgBox.Confirm("消息","预约时间为" + date + "日,是否提交订单",addPersonalDrop);
							function addPersonalDrop(){ 
								$.post("fitness/personal/addPersonalDrop.json",fromDrop,tijiao);
								function tijiao(data) {
									if (data == 1) {
									$.MsgBox.Alert("消息","预约成功");
									} else {
									$.MsgBox.Alert("消息","预约失败");
									}
								}
							}
						}
					});
	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();
</script>
</html>

