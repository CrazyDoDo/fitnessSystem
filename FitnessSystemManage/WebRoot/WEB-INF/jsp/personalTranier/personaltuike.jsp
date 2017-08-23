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
<title>训练计划卡</title>
<link href="${pageContext.request.contextPath}/statics/css/membrseAddbase.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
<link href="${pageContext.request.contextPath}/statics/css/membrseAddbasic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/statics/css/My97DatePicker/skin/WdatePicker.css">
</head>
<body  style="background-color:#FFF; color: #000000">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="column">
				<span class="current">私教退课</span>
			</div>
			<form action="#" method="post" id="formTuike">
				会员卡号: <input type="text" name="membersId" id="membersId"
					style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;" />
				<input type="button" id="select" name="select" value="快速查询"
					style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
				<div class="column">
					<span class="current">训练计划表</span>
				</div>
				<table class="kv-table" style="margin-top:10px;">
					<tbody>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-label">会员姓名:</td>
							<td class="kv-content">
							<input type="text" id="name" size="40" readonly="readonly">
							<input type="hidden" id="traniingId" name="traniingId" size="40" readonly="readonly">
							</td>
						</tr>
						<tr>
								<td class="kv-label"></td>
								<td class="kv-label">教练名称:</td>
								<td class="kv-content">
								<select id="personal" name="personalId" style=" width:289px; background-color:#EFEFEF">
										<option value="">请选择</option>
									<c:forEach items="${personal}" var="item">
										<option name="${item.price}" value="${item.employeesId}">${item.name}</option>
									</c:forEach>
								</select>
								</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-label">剩余课时:</td>
							<td class="kv-content"><input type="text" id="shengyu"
								size="40">
							</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-label">需退课时:</td>
							<td class="kv-content"><input type="text" name="hour" id="tuike"
								size="40">
							</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-label">所退金额:</td>
							<td class="kv-content"><input type="text" name="money" id="money"
								size="40">
							</td>
						</tr>						
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label"></td>
								<td class="kv-content"><input class="input" type="button"
									id="tijiao" value="提交"
									style="margin-left:30px; margin-right:10px; width:100px; height:30px;">
									<input class="input" type="reset" value="取消"
									style=" width:100px; height:30px;">
								</td>
							</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/personalTranierjs/personaltuike.js"></script>
</html>


