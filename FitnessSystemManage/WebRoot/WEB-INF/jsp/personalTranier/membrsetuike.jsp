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
    <title>会员退课详情</title> 
    <link href="../css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="../css2/easyui.css">
     <link href="../css/personalBase.css" rel="stylesheet">
    <link href="../css/My97DatePicker/skin/WdatePicker.css"> 
</head> 
<body>
	<div class="container">
		<div class="content">
		      <div title="会员退课详情" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">会员退课详情</span></div>
                <form action="#" method="post">
                会员卡号: <input type="text" name="code" id="memId" style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;">
                会员姓名: <input type="text" name="memName" style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;"/>&nbsp;
                教练姓名:<select style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;" id="select" >
                	<option value="0">请选择</option>
                </select>
<input type="button" id="selectOrder" name="select" value="快速查询"
					style="padding-left:15px; background-color:#2577C0; color:#FFF;width:90px; height:28px;"> &nbsp;&nbsp;
<input type="reset" name="select" value="重置"
					style="padding-left:15px; background-color:#2577C0; color:#FFF;width:70px; height:28px;">   
                </form>
		      	<table class="kv-table">
					<tbody id="showcustInfo">
						<tr>
							<td class="kv-label">会员卡号</td>
							<td class="kv-label">会员姓名</td>
							<td class="kv-label">教练姓名</td>
							<td class="kv-label">所退课时</td>
							<td class="kv-label">退课金额</td>
                            <td class="kv-label">退课日期</td>                                                           
						</tr>				
					</tbody>
				</table>
		      </div>
		</div>
	</div>
	
</body> 
</html>
    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
//初始化加载信息
$(function(){	
//加载教练信息
		function loadCoach(){
		$.post("../membrseAddCardServlet","action=loadCoach",loadeCoachInfo,"JSON");
		        	function loadeCoachInfo(data){
        		for ( var  i= 0; i < data.length; i++) {
					$("#select").append("<option  name="+data[i].price+" value='"+data[i].employeesId+"'>"+data[i].name+"</option>");
				}
        	}
		}

	loadCoach();
	//显示订单列表
	function loadPersonalOrder(){
			if($("input[name='code']").val()==""){
			var memId=0;
			}
			else{
			var memId=$("input[name='code']").val();
			}		
			var personalId=$("#select").val();
			var memName=$("input[name='memName']").val();
			$.post("../personalTableServlet", "action=loadtuike&memId=" + memId
					+ "&personalId="+personalId+ "&memName="+memName+"&pageIndex="+1, loadTrading, "JSON");
			function loadTrading(data) {
				var list = data.tuikeList;
				$("#showcustInfo tr:gt(0)").remove();
				for ( var i = 0; i < list.length; i++) {
					$("#showcustInfo").append("<tr>" 
							+ "<td class='kv-content'>"
									+ list[i].membersId + "</td>"
									+ "<td class='kv-content'>" + list[i].memName
									+ "</td>" + "<td class='kv-content'>"
									+ list[i].personalName + "</td>"
									+ "<td class='kv-content'>" + list[i].hour+"</td>"
									+ "<td class='kv-content'>" + list[i].money+"</td>"
									+ "<td class='kv-content'>" + list[i].date+"</td>"
									 + "</tr>");
				}
				//给首页,下一页,上一页,末页赋值
				var index = 1;
				$("#ccc").append(
						"总页数[" + data.currPageNo + "/" + data.totalPageCount
								+ "]");
				if (data.currPageNo > 1) {
					$("#ccc").append(
							"<a onclick='javascript:goFirst(1)'>首页</a>");
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ (data.currPageNo - 1) + ")'>上一页</a>");
				}
				if (data.currPageNo < data.totalPageCount) {
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ (data.currPageNo + 1) + ")'>下一页</a>");
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ data.totalPageCount + ")'>末页</a>");
				}
				;				
			}
		}
		loadPersonalOrder();
	});
	
	//去首页,下一页,上一页,末页
	function goFirst(pageIndex) {
	$("#ccc").html("");
			if($("input[name='code']").val()==""){
			var memId=0;
			}
			else{
			var memId=$("input[name='code']").val();
			}	
			var personalId=$("#select").val();
			var memName=$("input[name='memName']").val();
			if(isNaN(memId)){
				alert("会员卡号由五位数字组成");
			}else{
			$.post("../personalTableServlet", "action=loadtuike&memId=" + memId
					+ "&personalId="+personalId+ "&memName="+memName+"&pageIndex="+pageIndex, loadTrading, "JSON");
			function loadTrading(data) {
				var list = data.tuikeList;
				$("#showcustInfo tr:gt(0)").remove();
				for ( var i = 0; i < list.length; i++) {
					$("#showcustInfo").append("<tr>" 
							+ "<td class='kv-content'>"
									+ list[i].membersId + "</td>"
									+ "<td class='kv-content'>" + list[i].memName
									+ "</td>" + "<td class='kv-content'>"
									+ list[i].personalName + "</td>"
									+ "<td class='kv-content'>" + list[i].hour+"</td>"
									+ "<td class='kv-content'>" + list[i].money+"</td>"
									+ "<td class='kv-content'>" + list[i].date+"</td>"
									 + "</tr>");
				}
				//给首页,下一页,上一页,末页赋值
				var index = 1;
				$("#ccc").append(
						"总页数[" + data.currPageNo + "/" + data.totalPageCount
								+ "]");
				if (data.currPageNo > 1) {
					$("#ccc").append(
							"<a onclick='javascript:goFirst(1)'>首页</a>");
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ (data.currPageNo - 1) + ")'>上一页</a>");
				}
				if (data.currPageNo < data.totalPageCount) {
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ (data.currPageNo + 1) + ")'>下一页</a>");
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ data.totalPageCount + ")'>末页</a>");
				};
			}
		}
		
	}
	
		//搜索订单信息
	$("#selectOrder").click(
			function() {
			$("#ccc").html("");
			if($("input[name='code']").val()==""){
			var memId=0;
			}
			else{
			var memId=$("input[name='code']").val();
			}	
			var personalId=$("#select").val();
			var memName=$("input[name='memName']").val();
			if(isNaN(memId)){
				alert("会员卡号由五位数字组成");
			}else{
			$.post("../personalTableServlet", "action=loadtuike&memId=" + memId
					+ "&personalId="+personalId+ "&memName="+memName+"&pageIndex="+1, loadTrading, "JSON");
			function loadTrading(data) {
				var list = data.tuikeList;
				$("#showcustInfo tr:gt(0)").remove();
				for ( var i = 0; i < list.length; i++) {
					$("#showcustInfo").append("<tr>" 
							+ "<td class='kv-content'>"
									+ list[i].membersId + "</td>"
									+ "<td class='kv-content'>" + list[i].memName
									+ "</td>" + "<td class='kv-content'>"
									+ list[i].personalName + "</td>"
									+ "<td class='kv-content'>" + list[i].hour+"</td>"
									+ "<td class='kv-content'>" + list[i].money+"</td>"
									+ "<td class='kv-content'>" + list[i].date+"</td>"
									 + "</tr>");
				}
				//给首页,下一页,上一页,末页赋值
				var index = 1;
				$("#ccc").append(
						"总页数[" + data.currPageNo + "/" + data.totalPageCount
								+ "]");
				if (data.currPageNo > 1) {
					$("#ccc").append(
							"<a onclick='javascript:goFirst(1)'>首页</a>");
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ (data.currPageNo - 1) + ")'>上一页</a>");
				}
				if (data.currPageNo < data.totalPageCount) {
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ (data.currPageNo + 1) + ")'>下一页</a>");
					$("#ccc").append(
							"<a onclick='javascript:goFirst("
									+ data.totalPageCount + ")'>末页</a>");
				}
				;				
			}
			}
			});	
	$('.easyui-tabs1').tabs({
      tabHeight: 36
    });
    $(window).resize(function(){
    	$('.easyui-tabs1').tabs("resize");
    }).resize();
</script>

