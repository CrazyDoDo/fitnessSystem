<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加岗位</title> 
</head>
<style type="text/css">
	*{ margin:0px; padding:0px;}
	.left{ text-align:right; width:100px; color:#666}
	.conent{ width:800px; background-color:#A4EAEC}
	.context{ width:800px; background-color:#BFF2AE}
	.vert{vertical-align:middle; margin-left:15px;}
	.vertical{vertical-align:middle; margin-left:25px;}
	lable{vertical-align:middle; margin-left:3px;}
	input{ height:25px; margin-top:5px;}
	input[name='kecheng']{ color: #FFF; background-color:#666;}
	input[type='checkbox']{vertical-align:middle; margin-left:25px;}
	textarea{margin-top:5px; resize:none;}
	.div{;padding-left:150px; width:900px;}
	li{list-style:none;cursor:pointer;}
</style>
<body>
	<div class="div">
    	<form action="#" method="post" id="formInfo">
    	<table>
        	<tr>
            	<td class="left">岗位名称:</td>
                <td>
                <input type="hidden" name="employeesTypeId" value="${empType.employeesTypeId}">
                <input type="text" size="80px" value="${empType.typeName}" name="typeName"/><span id="error1"  style="color:#FF0000"></span></td>
            </tr>
        	<tr>
            	<td class="left">上级岗位:</td>
                <td>
                <select name="fatheyTypeId" style="width:497px; height:25px; margin-top:10px;">
                      <option value="0">请选择....</option>
                      	  <c:forEach items="${empTypeList}" var="type">
	                         <option value="${type.employeesTypeId}" <c:if test="${type.employeesTypeId==empType.fatheyTypeId}"> selected="selected"</c:if>>${type.typeName}</option>
                          </c:forEach>
                </select>
                <span id="error2"  style="color:#FF0000"></span>
                </td>
            </tr> 
          	<tr>
            	<td class="left">薪资:</td>
                <td><input type="text" size="80px" name="price" value="${empType.price}"/>
                <span id="error3"  style="color:#FF0000"></span>
                </td>
            </tr>                   
            <tr > 
                <td class="left">岗位描述:</td>
                <td><textarea id="common" rows="3" cols="58px" name="common">${empType.common}</textarea>
                <span id="error4"  style="color:#FF0000"></span>
                </td>
            </tr>  
        	<tr>
            	<td class="left">岗位权限:</td>
                <td>
                	<input type="checkbox" value="yes" name="type" style="vertical-align:middle;" class="123"/><lable>全选</lable>
                </td>
            </tr>                                                               
        </table>
        <table>
       		<tr>
            	<td class="left"></td>
                <td class="conent"><lable>会员管理</lable></td>
            </tr>
        	<tr>
            	<td class="left"></td>
                <td>
                    <input type="checkbox" value="yes" name="peizhi"  <c:if test="${permissions.peizhi=='yes'}">checked="checked"</c:if> /><lable>会员卡配置</lable>
                    <input type="checkbox" value="yes" name="kaika" <c:if test="${permissions.kaika=='yes'}">checked="checked"</c:if> /><lable>会员开卡</lable>
                    <input type="checkbox" value="yes" name="caozuo" <c:if test="${permissions.caozuo=='yes'}">checked="checked"</c:if> /><lable>会员操作</lable>
                    <input type="checkbox" value="yes" name="xinxi" <c:if test="${permissions.xinxi=='yes'}">checked="checked"</c:if> /><lable>会员信息列表</lable>
                    <input type="checkbox" value="yes" name="huiyuanbiao" <c:if test="${permissions.huiyuanbiao=='yes'}">checked="checked"</c:if> /><lable>会员统计报表</lable>
                    <input type="checkbox" value="yes" name="gaoji" <c:if test="${permissions.gaoji=='yes'}">checked="checked"</c:if> /><lable>高级操作</lable>
                                                            
                </td>
            </tr>
            
       		<tr>
            	<td class="left"></td>
                <td class="context"><lable>客户管理</lable></td>
            </tr>
        	<tr>
            	<td class="left"></td>
                <td>
                    <input type="checkbox" value="yes" name="yewu" <c:if test="${permissions.yewu=='yes'}">checked="checked"</c:if> /><lable>业务管理</lable>
                    <input type="checkbox" value="yes" name="kehu" <c:if test="${permissions.kehu=='yes'}">checked="checked"</c:if> /><lable>客户资源管理</lable>
                    <input type="checkbox" value="yes" name="xiaoshou" <c:if test="${permissions.xiaoshou=='yes'}">checked="checked"</c:if> /><lable>销售经理</lable>
                    <input type="checkbox" value="yes" name="yeji" <c:if test="${permissions.yeji=='yes'}">checked="checked"</c:if> /><lable>业绩报表</lable>
                                                            
                </td>
            </tr> 

       		<tr>
            	<td class="left"></td>
                <td class="conent"><lable >私教管理</lable></td>
            </tr>
        	<tr>
            	<td class="left"></td>
                <td>
                    <input type="checkbox" value="yes" name="sijiao" <c:if test="${permissions.sijiao=='yes'}">checked="checked"</c:if> /><lable>私教业务</lable>
                    <input type="checkbox" value="yes" name="sijiaoxinxi" <c:if test="${permissions.sijiaoxinxi=='yes'}">checked="checked"</c:if>  /><lable>私教信息管理</lable>
                    <input type="checkbox" value="yes" name="sijiaojingli" <c:if test="${permissions.sijiaojingli=='yes'}">checked="checked"</c:if> /><lable>私教经理</lable>
                    <input type="checkbox" value="yes" name="sijiaobiao" <c:if test="${permissions.sijiaobiao=='yes'}">checked="checked"</c:if> /><lable>私教统计报表</lable>
                                                            
                </td>
            </tr>
            
       		<tr>
            	<td class="left"></td>
                <td class="context"><lable>操课管理</lable></td>
            </tr>
        	<tr>
            	<td class="left"></td>
                <td>
                    <input type="checkbox" value="yes" name="caoke" <c:if test="${permissions.caoke=='yes'}">checked="checked"</c:if> /><lable>操课管理</lable>
                    <input type="checkbox" value="yes" name="yuyue" <c:if test="${permissions.yuyue=='yes'}">checked="checked"</c:if>  /><lable>预约管理</lable>
                    <input type="checkbox" value="yes" name="tuandui" <c:if test="${permissions.tuandui=='yes'}">checked="checked"</c:if>  /><lable>团队管理</lable>
                                                            
                </td>
            </tr>                       

       		<tr>
            	<td class="left"></td>
                <td class="conent"><lable>水吧管理</lable></td>
            </tr>
        	<tr>
            	<td class="left"></td>
                <td>
                    <input type="checkbox" value="yes" name="chuwugui" <c:if test="${permissions.chuwugui=='yes'}">checked="checked"</c:if> /><lable>储物柜管理</lable>
                    <input type="checkbox" value="yes" name="shangpin" <c:if test="${permissions.shangpin=='yes'}">checked="checked"</c:if>  /><lable>商品管理</lable>
                    <input type="checkbox" value="yes" name="shuibayeji" <c:if test="${permissions.shuibayeji=='yes'}">checked="checked"</c:if> /><lable>销售报表</lable>
                                                            
                </td>
            </tr>
            
       		<tr>
            	<td class="left"></td>
                <td class="context"><lable>系统管理</lable></td>
            </tr>
        	<tr>
            	<td class="left"></td>
                <td>
                    <input type="checkbox" value="yes" name="yuangong" <c:if test="${permissions.yuangong=='yes'}">checked="checked"</c:if> /><lable>员工管理</lable>
                    <input type="checkbox" value="yes" name="gangwei" <c:if test="${permissions.gangwei=='yes'}">checked="checked"</c:if> /><lable>岗位权限</lable>
                    <input type="checkbox" value="yes" name="rizhi" <c:if test="${permissions.rizhi=='yes'}">checked="checked"</c:if> /><lable>系统日志</lable>
                </td>
            </tr>        
        </table>
	</form>
		<input type="button" id='save' value="保存" style="width:100px; margin:10px 10px 0px 280px;"/>
        <input type="button" id="clear" value="清空" name="quxiao" style="width:100px;"/>
    </div>
</body>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/message.js" type="text/javascript"></script>	
<script type="text/javascript">
	//全选和取消全选
	$(".123").click(function() {
		if (this.checked == true) {
			$("#formInfo").find(":checkbox").each(function() {
				this.checked = true;
			});
		} else if (this.checked == false) {
			$("#formInfo").find(":checkbox").each(function() {
				this.checked = false;
			});
		}
		titleUpdate();
	});
	//清空表单
	$("#clear").click(function(){
		//清空表单
		$(":input","#formInfo") 
		.not(":button, :submit, :reset, :hidden") 
		.val("") 
		.removeAttr("checked") 
		.removeAttr("selected");
	});

	$("#save").click(function(){
			if($("input[name='typeName']").val()==""){
	   				$("span[id*='error']").text("");
	    			$("#error1").text("请输入岗位名称");
	    			return ;
	    	}if($("select[name='fatheyTypeId']").val()==0 ){
	    			$("span[id*='error']").text("");
	    			$("#error2").text("请选择上级岗位");
	    			return ;
	    	} 
	    	if(isNaN($("input[name='price']").val()) || $("input[name='price']").val()==""){
	    		    $("span[id*='error']").text("");
	    			$("#error3").text("薪资请填写数字");
	    			return ;
	    	}
	    	if($("#common").val()==""){
	    			$("span[id*='error']").text("");
	    			$("#error4").text("请填写岗位描述");
	    			return ;
	    	}
		var formInfo = $("#formInfo").serialize();
		$.post("updateEmployeesType.json", formInfo, updateEmployeesType, "JSON");	
		function updateEmployeesType(data){
			if(data>0){
				$.MsgBox.Alert("提示", "修改成功");
			}else{
				$.MsgBox.Alert("提示", "修改失败,请联系管理员");
			}
		}
	});
	$(document).ready(function(e) {
		$("input[name='kecheng']").click(function(e) {
            $(this).css("background-color","#17E331");
			$(this).siblings().css("background-color","#666");
        });
    });
    
</script>
</html>

