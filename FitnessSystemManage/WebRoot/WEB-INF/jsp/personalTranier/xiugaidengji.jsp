<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<style type="text/css">
	*{ margin:0px; padding:0px;}
	.left{ text-align:right; width:100px; color:#666}
	input{ height:30px; margin-top:5px;}
	textarea{margin-top:5px; resize:none;}
	select{margin-top:5px;}
	.div{;padding-left:200px; width:500px; margin-top: 80px}
	.reght{
	position: absolute;
	float: left;
	width: 100px;
	left: 1109px;
	top: 8px;
	cursor:pointer
}
	li{list-style:none}
</style>
<body>
	<div class="div">
    	<form action="#" method="post" id="formInfo">
    	<table>
    	    <tr hidden>
            	<td class="left">等级编号:</td>
                <td><input type="text" size="50px" name="leverId" value="${lever.leverId}"/>
                	<input type="hidden" name="employeesId" value="${lever.employeesId}"></td>
            </tr>
        	<tr>
            	<td class="left">等级名称:</td>
                <td><input type="text" size="50px" name="personalLever" value="${lever.personalLever}"/></td>
            </tr>
            <tr > 
                <td class="left">课程单价:</td>
                <td><input type="text" size="50px" name="personalPrice" placeholder="(元)" value="${lever.personalPrice}" /></td></tr>
        	<tr>                                                             
        </table>
<input type="button" name='button' id="tijiao" value="保存" style="width:100px; margin:10px 10px 0px 130px;"/>
        <input type="button" value="取消" name="quxiao" style="width:100px;"/>
</form>
    </div>
</body>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/message.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/personalTranierjs/xiugaidengji.js"></script>
</html>


