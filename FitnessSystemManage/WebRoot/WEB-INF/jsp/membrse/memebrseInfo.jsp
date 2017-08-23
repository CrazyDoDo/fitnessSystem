<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String memcardId = request.getParameter("memcardId");
	session.setAttribute("memcardId", memcardId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>会员信息列表</title> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/membrseAddbase.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath }/statics/css/membrsebasic.css" rel="stylesheet">
</head> 
<body>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%; height:100%;">
		      <div title="会员卡列表" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">会员卡类型</span></div>
                <form  id="jvForm"  method="get">
		      	<table class="kv-table">
					<tbody>
                    	<tr>
							<td class="kv-label">会员卡号:</td>
							<td class="kv-content"><input type="text" name="membersId" size="52" value="${members.membersId}"></td>
						</tr> 
					</tbody>
				</table>
               <div class="column"><span class="current">会员基本信息</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="name" size="55" value="${members.name}">
                            	<select style="width:160px;background:#f5f5f5" name="sex" id="showSex">
                            	<c:if test="${members.sex eq ('男')}">
                                	<option value="男" selected="selected">男</option>
                                    <option value="女">女</option>
                                </c:if>
                                <c:if test="${members.sex eq ('女')}">
                                	<option value="男" >男</option>
                                    <option value="女" selected="selected">女</option>
                                </c:if>                          
                                </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">生日:</td>
							<td class="kv-content"><input type="text" size="80" name="birthday" onClick="WdatePicker()" class="Wdate" style="background-color:#EFEFEF;" value="${members.birthday}" ></td>
						</tr>
						<tr>
							<td class="kv-label">手机:</td>
							<td class="kv-content"><input type="text" name="phone" size="80" value="${members.phone}"></td>
						</tr>                                                
						<tr>
							<td class="kv-label">身份证:</td>
							<td class="kv-content"><input type="text" name="ID" size="80" value="${members.iD}"></td>
						</tr>
						<tr>
							<td class="kv-label">微信:</td>
							<td class="kv-content"><input type="text" name="weChat" size="80" value="${members.weChat}"></td>
						</tr>                         
						<tr>
							<td class="kv-label">邮箱:</td>
							<td class="kv-content"><input type="text" name="email" size="80" value="${members.email}"></td>
						</tr> 
						<tr>
							<td class="kv-label">联系地址:</td>
							<td class="kv-content"><input type="text" name="address" size="80" value="${members.address}"></td>
						</tr> 
						<tr>
							<td class="kv-label">职业:</td>
							<td class="kv-content"><input type="text" name="professional" size="80" value="${members.professional}"></td>
						</tr>                                                  
					</tbody>
					
                <div class="tupian">
                	<img src="${pageContext.request.contextPath}/statics/images/guide/${members.image}" width="250px" height="250px" id="image">
                	<input type="file" id="file" name="images" value="${members.image}" style="width:250px"/>
                	<input type="hidden" value="${members.image}" name="image"><br/>
                	<span id="error" style="color:#FF0000"></span>            	
                </div>
				</table>

      		<div class="column"><span class="current">会员分配</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">销售:</td>
							<td class="kv-content">
									<select style="width:250px;background:#f5f5f5" name="employeesId" id="sales">
									<option value="0">${members.employeesName}</option>
                                    </select>
                                    <span class="kv-label">私教:</span><select style="width:252px;background:#f5f5f5" name="coachId"  id="coach">
                                	<option value="0">${members.coachName}</option>
                                    </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">会籍:</td>
							<td class="kv-content"><input type="text" name="coach" size="80"></td>
						</tr>                                                
					</tbody>
				</table>
                
		  </form>
		      </div>
              <div title="交易记录" data-options="closable:false">
             				<iframe class='page-iframe' src='goMembrseTrading?membersId=${members.membersId}' frameborder='no'border='no' height='430px' width='100%' scrolling='auto'></iframe>
              </div>
		      <div title="租柜记录" data-options="closable:false">
                            <iframe class='page-iframe' src='goMembrseRent' frameborder='no'border='no' height='430px' width='100%' scrolling='auto'></iframe>
              </div>
		      <div title="刷卡记录" data-options="closable:false">
                            <iframe class='page-iframe' src='goMembrseSwiping' frameborder='no'border='no' height='430px' width='100%' scrolling='auto'></iframe>
              </div> 
		    </div>
		</div>
	</div>
	
</body> 
</html>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
        $(".input").hover(function(e) {//按钮悬浮背景变色
            $(this).css("background-color","#CCC");
        },function(){
			 $(this).css("background-color","#EFEFEF");
			});	
    });

	$('.easyui-tabs1').tabs({
      tabHeight: 36
    });
    $(window).resize(function(){
    	$('.easyui-tabs1').tabs("resize");
    }).resize();
</script>

