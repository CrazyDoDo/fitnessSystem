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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>访客登记</title>
<link href="${pageContext.request.contextPath }/statics/css/membrseAddbase.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/membrseAddbasic.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
</head>
<body>
	<div class="container">
		<div class="content">
			<div class="column">
				<span class="current">访客登记</span>
			</div>
			<form action="#" method="post" id="formInfo">
				<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="custName"
								size="55" placeholder="必填"> <select
								style="width:160px;background:#f5f5f5" name="sex">
									<option name="man" value="男">男</option>
									<option name="wman" value="女">女</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="kv-label">生日:</td>
							<td class="kv-content"><input type="text" size="80" name="birthday" onClick="WdatePicker()" class="Wdate" style="background-color:#EFEFEF;"></td>
						</tr>
						<tr>
							<td class="kv-label">手机:</td>
							<td class="kv-content"><input type="text" name="phone"
								size="80" placeholder="必填"></td>
						</tr>
						<tr>
							<td class="kv-label">微信:</td>
							<td class="kv-content"><input type="text" name="weChat"
								size="80"></td>
						</tr>
						<tr>
							<td class="kv-label">邮箱:</td>
							<td class="kv-content"><input type="text" name="email"
								size="80"></td>
						</tr>
						<tr>
							<td class="kv-label">联系地址:</td>
							<td class="kv-content"><select
								style="width:275px;background:#f5f5f5"
								id="province">
							</select> <select style="width:275px;background:#f5f5f5" 
								id="city">
							</select>
							</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content"><input type="text" 
								size="80" id="detailed"></td>
						</tr>
						<tr>
							<td class="kv-label">职业:</td>
							<td class="kv-content"><input type="text"
								name="professional" size="80"></td>
						</tr>
					</tbody>
				</table>
				<div class="column">
					<span class="current">客户来源</span>
				</div>
				<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">来源:</td>
							<td class="kv-content"><select
								style="width:275px;background:#f5f5f5" name="souree">
									<option value="">请选择</option>
									<option value="户外宣传">户外宣传</option>
									<option value="网络宣传">网络宣传</option>
									<option value="朋友介绍">朋友介绍</option>
							</select>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="column">
					<span class="current">销售接待</span>
				</div>
				<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">销售</td>
							<td class="kv-content">
							<select style="width:275px;background:#f5f5f5" name="employeesId"
								id="sales">
								<option value="88888">请选择</option>
								<c:forEach items="${selesList}" var="seles">
									<option value="${seles.employeesId}">${seles.name}</option>
								</c:forEach>	
							</select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="column">
					<span class="current">备注</span>
				</div>
				<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content"><textarea cols="77" rows="3"
									name="comment" style="resize:none"></textarea></td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content">
							<input class="input" type="button" id="tijiao" value="提交"
								style="margin-left:150px; margin-right:10px; width:100px; height:30px; background-color: #E9E9E9">
							<input class="input" type="reset" value="取消" id="quxiao"
								style=" width:100px; height:30px; background-color: #E9E9E9">
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/message.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/seleceCity.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/customerjs/customerDengji.js"></script>

