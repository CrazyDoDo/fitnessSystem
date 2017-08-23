<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

.left {
	text-align: right;
	width: 100px;
	color: #666
}

input {
	height: 25px;
	margin-top: 5px;
}

textarea {
	margin-top: 5px;
	resize: none;
}

select {
	margin-top: 5px;
	height: 25px;
}

.div {;
	padding-left: 200px;
	width: 500px;
	margin-top: 80px;
}

.reght {
	position: absolute;
	float: left;
	width: 100px;
	left: 1109px;
	top: 8px;
}

li {
	list-style: none
}
</style>

<body>
	<div class="div">
		<form action="#" method="post" id="formInfo">
			<table>
				<tr hidden>
					<!--设置员工编号列隐藏-->
					<td class="left">编号:</td>
					<td><input type="text" size="50px" name="employessId" value="${personal.employeesId}" /></td>
				</tr>
				<tr>
					<td class="left">姓名:</td>
					<td><input type="text" size="50px" name="name"  value="${personal.name}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="left">手机号:</td>
					<td><input type="text" size="50px" name="phone" value="${personal.phone}" />
					</td>
				</tr>
				<tr>
					<td class="left">教练等级:</td>
					<td><select id="select" style="width:230px;background:#f5f5f5">
						<c:forEach items="${leverList}" var="lever">
							<option value="${lever.leverId}" <c:if test="${lever.leverId==personal.leverId}">selected="selected"</c:if> >${lever.personalLever}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		<input type="button" name='button' id="tijiao" value="保存" style="width:100px; height:30px;margin:10px 10px 0px 130px;"/> 
		<input type="reset" value="取消" name="quxiao" style="width:100px;  height:30px;" />
		</form>

	</div>
</body>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/message.js"></script>
<script type="text/javascript">
	//提交私教信息
	$("#tijiao").click(
					function() {
						var employeesId=$("#input[name='employessId']").val();
						var phone=$("input[name='phone']").val();
						var leverId=$("#select").val();
						if (phone =="") {
							$.MsgBox.Alert("消息","请将信息填写完整");
						} else {
							$.MsgBox.Confirm("消息","请确认是否修改该教练信息",showMessage);
							function showMessage() {
								$.post("updatePersoanl.json",
												"employeesId="+ employeesId+"&phone="+phone+"&leverId="+leverId, tijiao);
								function tijiao(data) {
									if (data == 1) {
									$.MsgBox.Alert("消息","修改成功");
									} else {
									$.MsgBox.Alert("消息","修改失败");
									}
								}
							}
						}
					}); 
</script>
</html>


