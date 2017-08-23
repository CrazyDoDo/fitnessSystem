<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>添加员工</title> 
    <link href="${pageContext.request.contextPath}/statics/css/membrseAddbase.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/membrsebasic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/My97DatePicker/skin/WdatePicker.css"> 
</head> 
<body>
	<div class="container">
		<div class="content">
		  <form action="updateEmployees" method="post" id="formEmployees" >
		      	<table class="kv-table" style="margin-left:8%">
					<tbody>
						<tr>
							<td class="kv-label">工号:</td>
							<td class="kv-content"><input type="text" name="employeesId" size="80" value="${emp.employeesId}"  readonly="readonly" required="required" >
								<input type="hidden" id="sum" value="${sum}">
							</td>
						</tr>
						<tr>                                          
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="name" size="55"   value="${emp.name}"  required="required" >
                            	<select style="width:160px;background:#f5f5f5" name="sex">
                                	<option value="男" <c:if test="${emp.sex=='男'}"> selected="selected"</c:if>>男</option>
                                    <option value="女" <c:if test="${emp.sex=='女'}"> selected="selected"</c:if>>女</option>
                                </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">生日:</td>
							<td class="kv-content">
							<input type="text" size="15px" name="dirthday" onClick="WdatePicker()" class="Wdate" style="width:230px;"  value="${emp.dirthday}"  required="required">
							<span style="margin-left:20px; margin-right:12px;">电话:</span>
							<input type="text" name="phone" size="36"  value="${emp.phone}"  required="required" pattern="[0-9]{11}">
							</td>
						</tr>
						<tr>
							<td class="kv-label"> 入职时间:</td>
							<td class="kv-content">
							<input type="text" size="15px" name="stratDate" onClick="WdatePicker()" class="Wdate" style="width:230px;"  value="${emp.stratDate}"  required="required"></input>
                            
                            <span style="margin-left:20px; margin-right:12px;">职位:</span>
                            	<select style="width:260px;" name="typeId">
                                	<option value="0">请选择....</option>
                                	<c:forEach items="${empTypeList}" var="type">
	                                    <option value="${type.employeesTypeId}" <c:if test="${type.employeesTypeId==emp.typeId}"> selected="selected"</c:if>>${type.typeName}</option>
                                	</c:forEach>
                                </select>
                            </td>    
						</tr>                     
						<tr>
							<td class="kv-label">身份证:</td>
							<td class="kv-content"><input type="text" name="iD" size="80"  value="${emp.iD}"  required="required"></td>
						</tr>
						<tr>
							<td class="kv-label">现住址:</td>
							<td class="kv-content"><input type="text" name="address" size="80" value="${emp.address}"></td>
						</tr> 
						<tr>
							<td class="kv-label">登录名:</td>
							<td class="kv-content"><input type="text" name="username" size="80"  value="${emp.username}"  required="required"></td>
						</tr>                          
                        <tr>
							<td class="kv-label">修改密码:</td>
							<td class="kv-content"><input type="text" name="password" size="80" placeholder="密码为6-15位数字或密码组成"  pattern="[0-9A-Za-z]{6,15}" value="${emp.password}"  required="required"></td>
						</tr> 
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content">
                              <input class="input" type="submit" value="修改" style="margin-left:180px; margin-right:10px; width:100px; height:30px;">
                            </td>
						</tr>                                                                          
					</tbody>
				</table>
		  </form>
		      </div>
	</div>
	
</body> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/css/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/seleceCity.js"></script>
	<script src="${pageContext.request.contextPath }/statics/js/message.js" type="text/javascript"></script>	
<script type="text/javascript">
		//初始化会员信息
	 	$(function() {
			var sum=$("#sum").val();
			if(sum==1){
					$.MsgBox.Alert("提示", "修改成功");
			}else if(sum==2){
					$.MsgBox.Alert("提示", "修改失败");
			}
		}); 
        $(".input").hover(function(e) {//按钮悬浮背景变色
            $(this).css("background-color","#CCC");
        },function(){
			 $(this).css("background-color","#EFEFEF");
		});
</script>
</html>
