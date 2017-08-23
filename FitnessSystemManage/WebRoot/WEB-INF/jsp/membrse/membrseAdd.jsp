<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>会员开卡</title> 
    <link href="${pageContext.request.contextPath }/statics/css/membrseAddbase.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/membrseAddbasic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css"> 
</head> 
<body>
	<div class="container">
		<div class="content">
              	<div class="column"><span class="current">会员卡类型</span></div>
                <form id="jvForm"  method="get">
		      	<table class="kv-table">
					<tbody>
                    	<tr>
							<td class="kv-label">会员卡号:</td>
							<td class="kv-content"><input type="text" name="membersId" size="52"></td>
						</tr> 
						<tr>
							<td class="kv-label">开卡类型:</td>
							<td class="kv-content">
                                 <select id="select" style="width:370px;background:#f5f5f5" name="membersCardId">
                                 <option value="1">请选择</option>
                                </select>
                            </td>
						</tr>
	                	<tr>
							<td class="kv-label">到期时间:</td>
							<td class="kv-content"><input type="text" name="stopDate1" size="52" id="overDate"></td>
						</tr> 
					</tbody>
				</table>
               <div class="column"><span class="current">会员基本信息</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="name" size="55"  placeholder="必填">
                            	<select style="width:160px;background:#f5f5f5" name="sex">
                                	<option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">生日:</td>
							<td class="kv-content"><input type="text" size="80" id="birthday1" name="birthday1" onClick="WdatePicker()" class="Wdate" style="background-color:#EFEFEF;"></td>
						</tr>
						<tr>
							<td class="kv-label">手机:</td>
							<td class="kv-content"><input type="text" name="phone" size="80"  placeholder="必填"></td>
						</tr>                                                
						<tr>
							<td class="kv-label">身份证:</td>
							<td class="kv-content"><input type="text" name="iD" size="80"  placeholder="选填"></td>
						</tr>
						<tr>
							<td class="kv-label">微信:</td>
							<td class="kv-content"><input type="text" name="weChat" size="80"  placeholder="选填"></td>
						</tr>                         
						<tr>
							<td class="kv-label">邮箱:</td>
							<td class="kv-content"><input type="text" name="email" size="80"  placeholder="选填"></td>
						</tr> 
						<tr>
							<td class="kv-label">联系地址:</td>
							<td class="kv-content">
                                <select style="width:275px;background:#f5f5f5" id="province">
                                </select>
                                <select style="width:275px;background:#f5f5f5" id="city">
                                </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content"><input type="text"  id="detailed" size="80"></td>
						</tr> 
						<tr>
							<td class="kv-label">职业:</td>
							<td class="kv-content"><input type="text" name="professional" size="80" placeholder="选填"></td>
						</tr>                                                  
					</tbody>
					
                 <div class="tupian">
                	<img src="" width="250px" height="250px" id="image">
                	<input type="file" id="file" name="images" value="${product.fileName}" style="width:250px"/>
                	<input type="hidden" value="" name="image"><br/>
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
									<option value="8">请选择</option>
                                    </select>
                                    <span class="kv-label">私教:</span><select style="width:252px;background:#f5f5f5" name="coachId" id="coach">
                                	<option value="4">请选择</option>
                                    
                                    </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">会籍:</td>
							<td class="kv-content"><input type="text" name="coach" size="80" placeholder="选填"></td>
						</tr>                                                
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content">
                              <input class="input" type="button" value="提交" id="tijiao" style="margin-left:150px; margin-right:10px; width:100px; height:30px;">
                             <input class="input" type="reset" value="取消"  style=" width:100px; height:30px;">
                            </td>
						</tr> 
					</tbody>
				</table>
                
		  </form>
		      </div>
	</div>
	
</body> 
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/message.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/membersjs/membrseAdd.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/seleceCity.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/css/My97DatePicker/WdatePicker.js"></script>
</html>
