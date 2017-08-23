<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String memId = request.getParameter("memId");
	request.setAttribute("memId", memId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>预约跟进</title>
<link href="${pageContext.request.contextPath}/statics/css/membrseAddbase.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
<link href="${pageContext.request.contextPath}/statics/css/membrsebasic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/statics/css/My97DatePicker/skin/WdatePicker.css">
</head>
<body  style="background-color:#FFF">
	<div class="container">
		<div class="content">
			<div class='column'>
				<span class='current'>预约跟进</span>
			</div>
			<form action="#" method="post" id="formInfo">
				<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="memName" value="${drop.memName}" readonly="readonly"
								size="80">
								<input type="hidden" value="${drop.dropId}" id="dropId" name="dropId">
							</td>
						</tr>
						<tr>
							<td class="kv-label">手机:</td>
							<td class="kv-content"><input type="text" name="memPhone" value="${drop.memPhone}"  readonly="readonly"
								size="80">
							</td>
						</tr>
						<tr>
							<td class="kv-label">预约确认:</td>
							<td class="kv-content"><input type="radio" value="1"
								name="state" checked="checked">不改期 <input type="radio"
								value="2" name="state">更改预约 <input type="radio"
								value="3" name="state">取消预约</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content"><input type="text" size="40"
								name="date" onClick="WdatePicker()" class="Wdate" value="${drop.date}
								style=" background-color:#EFEFEF;">
							</td>
						</tr>
						<tr>
							<td class="kv-label">备注:</td>
							<td class="kv-content"><textarea rows="3" cols="77"
									style="resize:none" name="common">${drop.common}</textarea>
							</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content">
							<input class="input" type="button" value="提交" id="tijiao" style="margin-left:150px; margin-right:10px; width:100px; height:30px;">
							<input class="input" type="button" value="取消" style=" width:100px; height:30px;">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
</html>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/css/My97DatePicker/WdatePicker.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/message.js" type="text/javascript"></script>		
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/personalTranierjs/personalUp.js"></script>
