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
    <title>预约上课表</title> 
    <link href="../css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../css2/easyui.css">
    <link href="../css/personalBase.css" rel="stylesheet">
    <link href="../css/My97DatePicker/skin/WdatePicker.css"> 
</head> 
	<script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="../css/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script> 
<body>
	<div class="container">
		<div class="content">
		      	<div class="column"><span class="current">预约上课表</span></div>
                <form action="#" method="post">
                预约时间: <input type="text" size="15px" name="date1" onClick="WdatePicker()" class="Wdate">至</input>
                		<input type="text" size="15px" name="date2" onClick="WdatePicker()" class="Wdate"></input>
                        <input type="submit" name="select" value="查询">
                        <input type="reset" value="重置">
                </form>
		      	<table class="kv-table">
					<tbody>
                    	<tr>
                        	<td class="kv-label" colspan="5">会员(-)</td>
                            <td class="kv-label" colspan="4">预约上课(-)</td>
                        </tr>
						<tr>
							<td class="kv-label">姓名</td>
							<td class="kv-label">性别</td>
							<td class="kv-label">手机号</td>
							<td class="kv-label">健身教练</td>
                            <td class="kv-label">目标</td>  
                            <td class="kv-label">预约上课时间</td>
							<td class="kv-label">课时单价</td>
							<td class="kv-label">状态</td>
                            <td class="kv-label">操作员</td>                                                        
						</tr>
						<tr>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">其他</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">贸易商</td>    
                            <td class="kv-content">其他</td>
							<td class="kv-content">贸易商</td>
							<td class="kv-content">贸易商</td>      
                            <td class="kv-content">其他</td>
							<td class="kv-content">贸易商</td>                  
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

