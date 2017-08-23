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
    <link href="${pageContext.request.contextPath}/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/membrseInfo.css" rel="stylesheet">
<style type="text/css">
	*{ margin:0px; padding:0px;}
	.left{ text-align:right; width:100px; color:#666; font-size:12px;}
	input{ height:30px; margin-bottom:5px;}
	.vertical{vertical-align:middle;}
	.div{;padding-left:200px; width:500px;}
	.reght{
	position: absolute;
	float: left;
	width: 100px;
	left: 1109px;
	top: 8px;
}
	li{list-style:none}
	.tishi{margin-left: 10px; font-size: 12px; color:#FF5151}
	
</style>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/message.js"></script>
<script type="text/javascript">
	$(document).ready(function(e) {
		//点击按钮,实现会员卡补办	
		$("#button").click(function(){
		var membersId=$("input[name='cardName']").val();
		var loss=$("input[name='loss']:checked").val();
		if($("#card").val()==""){
			$("#ka").text("请输入会员卡号");
			return ;
		}
		if(loss=="补办"){
			$.post("membrseReplace","membersId="+membersId,memLeave);
			function memLeave(data){
				if(data=="2"){
					$.MsgBox.Alert("消息", "补办成功");
					$("#ka").text("");
					$("input[name='cardName']").val("");
				}else if(data=="1"){
						$.MsgBox.Alert("消息", "未找到该会员"); 
        				return ;
				}else{
						$.MsgBox.Alert("消息", "请假失败,请联系管理员"); 
        				return ;				
				}
			}
		}else{
				$.MsgBox.Alert("消息", "若需补办会员卡,请点击是");
		}	
		});		
    });
</script>
<body>

	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%; height:100%;">
		      <div title="会员卡补办" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">会员卡补办</span></div>
	
	<div class="div">
    	<form action="#" method="post">
    	<table>
        	<tr>
            	<td class="left">会员卡号:</td>
                <td><input type="text" size="40px" name="cardName" id="card"/><span class="tishi" id="ka"></span></td>
            </tr>
            <tr>
            	<td class="left">是否补办:</td>
                <td><input type="radio" class="vertical" name="loss" value="补办" />是
                	<input type="radio" class="vertical" name="loss" value="挂失" checked="checked" />否
                </td>
            </tr>                                                        
        </table>
<input type="button" name='button' id="button" value="提交" style="width:100px; margin:10px 10px 0px 130px;"/>
        <input type="reset" value="取消" name="quxiao" style="width:100px;"/>
<form>
    </div>
		      </div>
		    </div>
		</div>
	</div>

</body>
</html>


