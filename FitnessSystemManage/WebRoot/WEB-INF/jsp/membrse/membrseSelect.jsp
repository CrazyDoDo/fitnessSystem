<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>高级查询</title> 
    <link href="../css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../css2/easyui.css">
    <link href="../css/basic_info.css" rel="stylesheet">
    <link href="../css/My97DatePicker/skin/WdatePicker.css"> 
</head> 
	<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../css/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script> 
    <style type="text/css">
    .content input{ margin-right:5px; margin-bottom:6px;}
	.content select{ width:100px;}
    </style>
<body>
	<div class="container">
		<div style=" height:450px;" class="content">
		      	<div class="column"><span class="current">高级查询</span></div>
                <form action="#" method="post">
                卡号:<input type="text" size="20px"> 手机号:<input type="text" size="20px"> 姓名:<input type="text" size="20px">
                到期时间: <input type="text" size="15px" name="date1" onClick="WdatePicker()" class="Wdate"></input> </br>
                卡类型: <select>
                		 <option></option>
                	  </select>
                教练:<select>
                		 <option></option>
                	  </select>
                状态:<select>
                		 <option></option>
                	  </select>
                最后访问时间: <input type="text" size="15px" name="date1" onClick="WdatePicker()" class="Wdate"></input> </br>                 
                        <input type="submit" name="select" value="快速查询" style="padding-left:15px; background-color:#2577C0; color:#FFF;width:90px; height:28px;">	<input type="reset" name="reset" value="重置" style="padding-left:5px; height:28px;">
                </form>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">卡号</td>
							<td class="kv-label">姓名</td>
							<td class="kv-label">性别</td>
							<td class="kv-label">手机号码</td>
                            <td class="kv-label">卡类型</td>   
                            <td class="kv-label">开卡时间</td>  
							<td class="kv-label">到期时间</td>
							<td class="kv-label">会籍</td>
							<td class="kv-label">教练</td>
                            <td class="kv-label">最后来访时间</td>   
                            <td class="kv-label">状态</td>                                                           
						</tr>
						<tr>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">其他</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">IT设备</td>
							<td class="kv-content">其他</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">IT设备</td>                            
						</tr>					
					</tbody>
				</table>
		      </div>
	</div>
	
</body> 
</html>
<script type="text/javascript">
	$('.easyui-tabs1').tabs({
      tabHeight: 36
    });
    $(window).resize(function(){
    	$('.easyui-tabs1').tabs("resize");
    }).resize();
</script>
