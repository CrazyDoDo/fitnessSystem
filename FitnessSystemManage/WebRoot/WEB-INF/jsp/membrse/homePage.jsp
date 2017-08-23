<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>首页会员登记</title> 
    <link href="statics/css/membrseAddbase.css" rel="stylesheet">
    <link href="statics/css/membrseAddbasic.css" rel="stylesheet">
    <link href="statics/css/My97DatePicker/skin/WdatePicker.css">
    <link href="statics/css/style.css" rel="stylesheet">
    <link href="statics/css/normalize.css" rel="stylesheet">
	<style type="text/css">
    .container .content table.kv-table td.content{height:26px;font-size:12px;width:130px;border: 1px #CCCCCC solid; text-align:center;height:		     29px;padding:5px 0;border-bottom:1px solid #cacaca;padding-left:20px;}
	
	.label{padding:0 10px;width:130px;background:#f5f5f5;border:1px solid #cacaca; text-align:center;
	height:29px;padding:5px 0;border-bottom:1px solid #cacaca;font-size:12px;padding-left:20px}
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/modernizr.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/css/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/membersjs/homePage.js"></script>
</head> 
<body>
	<div class="container">
		<div class="content">
              	<div class="column"><span class="current">会员卡号</span></div>
				<div class="div">
                	  <form class="search" action="">
                      <input type="search" placeholder="会员卡号" required id="membrseId">
                      <button type="button" id="selectId">搜索</button>
                      </form>
                </div>
               <div class="column"><span class="current">会员基本信息</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">会员状态:</td>
							<td class="kv-content"><input type="text" name="state" size="80" id="state"></td>
						</tr> 
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="name" size="55">
                            	<select style="width:140px;background:#f5f5f5" id="showSex">
                                	<option name="man" value="男">男</option>
                                    <option name="wman" value="女">女</option>
                                </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">生日:</td>
							<td class="kv-content"><input type="text" name="birthday" size="80"></td>
						</tr>
						<tr>
							<td class="kv-label">手机:</td>
							<td class="kv-content"><input type="text" name="phone" size="80"></td>
						</tr>                                                
						<tr>
							<td class="kv-label">身份证:</td>
							<td class="kv-content"><input type="text" name="ID" size="80"></td>
						</tr>
						<tr>
							<td class="kv-label">微信:</td>
							<td class="kv-content"><input type="text" name="weChat" size="80"></td>
						</tr>                         
						<tr>
							<td class="kv-label">邮箱:</td>
							<td class="kv-content"><input type="text" name="email" size="80"></td>
						</tr> 
						<tr>
							<td class="kv-label">联系地址:</td>
							<td class="kv-content"><input type="text" name="address" size="80"></td>
						</tr>
						<tr>
							<td class="kv-label">职业:</td>
							<td class="kv-content"><input type="text" name="professional" size="80"></td>
						</tr>                                                  
					</tbody>
                <div class="tupian">
                	<img src="" width="250px" height="250px" id="image">
                </div>
				</table>
      		<div class="column"><span class="current">会员来访纪录</span></div>
		      	<table class="kv-table" style="margin:auto">
					<tbody id="showmemInfo">
						<tr>
							<td class="label">会员卡号</td>
							<td class="label">会员姓名</td>
							<td class="label">到访时间</td>
							<td class="label">累积刷卡次数</td>
                            <td class="label">操作员</td>                                                             
						</tr>
	                                       
					</tbody>
				</table>
                
		  </form>
		      </div>
	</div>
	
</body> 
</html>


