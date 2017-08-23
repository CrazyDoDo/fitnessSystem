<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String custId = request.getParameter("custId");
	session.setAttribute("custId", custId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>访客登记</title>
<link href="${pageContext.request.contextPath }/statics/css/membrseAddbase.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/statics/css/membrseAddbasic.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<style type="text/css">
.reght {
	font-size:15px;
	position: absolute;
	float: left;
	width: 100px;
	left: 1109px;
	top: -2px;
}
li {
	list-style: none;
	cursor: pointer;
	margin-top: 6px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="content">
			<div class="column">
				<span class="current">访客登记</span>
			</div>
			<form action="#" method="post" id="jvForm">
				<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="custName" value="${customer.custName}"
								size="55"> <select
								style="width:160px;background:#f5f5f5" name="sex" id="showSex">
                            	<c:if test="${customer.sex eq ('男')}">
                                	<option value="男" selected="selected">男</option>
                                    <option value="女">女</option>
                                </c:if>
                                <c:if test="${customer.sex eq ('女')}">
                                	<option value="男" >男</option>
                                    <option value="女" selected="selected">女</option>
                                </c:if>  
							</select>
							
							<input type="hidden" name="customerId" value="${customer.customerId}">
							<input type="hidden" name="startDate" value="${customer.startDate}">
							</td>
						</tr>
						<tr>
							<td class="kv-label">生日:</td>
							<td class="kv-content"><input type="text" size="80"
								name="birthday" onClick="WdatePicker()" class="Wdate"
								style="background-color:#EFEFEF;" value="${customer.birthday}">
							</td>
						</tr>
						<tr>
							<td class="kv-label">手机:</td>
							<td class="kv-content"><input type="text" name="phone"
								size="80" value="${customer.phone}" pattern ="^[1][358][0-9]{9}">
							</td>
						</tr>
						<tr>
							<td class="kv-label">微信:</td>
							<td class="kv-content"><input type="text" name="weChat"
								size="80" value="${customer.weChat}">
							</td>
						</tr>
						<tr>
							<td class="kv-label">邮箱:</td>
							<td class="kv-content"><input type="text" name="email"
								size="80" value="${customer.email}">
							</td>
						</tr>
						<tr>
							<td class="kv-label">联系地址</td>
							<td class="kv-content"><input type="text" name="address"
								size="80" value="${customer.address}">
							</td>
						</tr>
						<tr>
							<td class="kv-label">职业:</td>
							<td class="kv-content"><input type="text"
								name="professional" size="80" value="${customer.professional}">
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
							<td class="kv-content"><select
								style="width:275px;background:#f5f5f5" name="employeesId"
								id="sales" >
									<option value="${customer.employeesId}">${customer.emplName}</option>
							</select></td>
						</tr>
					</tbody>
				</table>
				<div class="column">
					<span class="current">备注</span>
				</div>
				<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">状态:</td>
							<td class="kv-content"><input type="text" name="state" 
								size="80" value="${customer.state}">
							</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content"><textarea cols="77" rows="3"
									name="comment" style="resize:none">${customer.comment}</textarea>
							</td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content">
							<input class="input" type="button" id="tijiao" value="提交"
								style="margin-left:150px; margin-right:10px; width:100px; height:30px; background-color: #E9E9E9">
							<input class="input" type="button" value="取消" id="quxiao"
								style=" width:100px; height:30px; background-color: #E9E9E9"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>

</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/message.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/customerjs/updateCustomer.js"></script>


