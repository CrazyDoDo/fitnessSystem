<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>添加商品</title> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/membrseAddbase.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/statics/css/membrsebasic.css" rel="stylesheet">
</head> 
<body>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="添加商品" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">商品信息</span></div>
                <form action="#" method="post" id="goodsInfo">
		      	<table class="kv-table" style="margin-left:15%">
					<tbody>
						     <tr>
								<td class="kv-label">商品名称:</td>
								<td class="kv-content"><input type="text" name="goodsName" id="goodsName" size="80" >
								<span id="error1"  style="color:#FF0000"></span></td>
							</tr>
							<tr>
								<td class="kv-label">单位:</td>
								<td class="kv-content">
										<input type="text" name="goodsUnit"  id="goodsUnit" size="20" style="margin-right:5px;">
			                           	 价格:<input type="text" name="goodsPrice" id="goodsPrice"  size="20"  style=" margin:0 10px 0 10px;">
			                          	  库存:<input type="text" name="goodsCount" id="goodsCount" size="20"  style=" margin:0 0 0 10px;">
			                            <span id="error2"  style="color:#FF0000"></span>
	                            </td>
					        </tr>
							<tr>
								<td class="kv-label">商品类型:</td>
								<td class="kv-content">
		                            <select name="goodsTypeId" id="goodsTypeId" style="width:555px;">
		                            		<option value="0">请选择</option>
		                            		<c:forEach items="${goodsType}" var="type">
		                            			<option value="${type.goodsTypeId}">${type.goodsTypeName}</option>
		                            		</c:forEach>
		                            </select>
		                            <span id="error3"  style="color:#FF0000"></span>
                           		 </td>
							</tr>                                                
					</tbody>
				</table>
		      	<div class="column"><span class="current">商品编码</span></div>
		      	<table class="kv-table"  style="margin-left:15%">
					<tbody>
							<tr>
								<td class="kv-label">商品编码:</td>
								<td class="kv-content"><input type="text" name="goodsId" size="80" id="goodsId" readonly="readonly">
								<span id="error4"  style="color:#FF0000"></span></td>
							</tr>                                             
					</tbody>
				</table>

      		<div class="column"><span class="current">商品说明</span></div>
		      	<table class="kv-table"  style="margin-left:15%">
					<tbody>
							<tr>
								<td class="kv-label">商品说明:</td>
								<td class="kv-content"><textarea name="common" id="common" rows="3" style="resize:none ;width:550px;color:#000"></textarea></td>
							</tr> 					                                               
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content">
                              <input class="input" type="button" id="select" value="提交" style="margin-left:150px; margin-right:10px; width:100px; height:30px;">
                             <input class="input" type="reset" value="清空"  style=" width:100px; height:30px;">
                            </td>
						</tr> 
					</tbody>
				</table>
                
		  </form>
				</div>
				<div title="商品管理" data-options="closable:false" class="basic-info">
					<iframe class='page-iframe'
						src='goGoodsManage' frameborder='no'
						border='no' height='480px' width='100%' scrolling='auto'></iframe>
				</div>
				<div title="商品类型" data-options="closable:false" class="basic-info">
					<iframe class='page-iframe'
						src='goGoodsType' frameborder='no'
						border='no' height='480px' width='100%' scrolling='auto'></iframe>
				</div>
			</div>
		</div>
	</div>
</body> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.easyui.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/message.js" type="text/javascript"></script>
<script type="text/javascript">

	$("#goodsId").focus(function(){
		$.post("getGoodsMaxId.json", getGoodsMaxId, "JSON");
		function getGoodsMaxId(data){
			$("#goodsId").val(Number(data)+1);
		}
	});
	//添加商品
		$("#select").click(function(){
			if($("input[name='goodsName']").val()==""){
	   				$("span[id*='error']").text("");
	    			$("#error1").text("请输入商品名称");
	    			return ;
	    	}if($("input[name='goodsUnit']").val()=="" || $("input[name='goodsPrice']").val()==""
	    	||$("input[name='goodsCount']").val()==""){
	    			$("span[id*='error']").text("");
	    			$("#error2").text("单位,价格,库存均需要填写");
	    			return ;
	    	} 
	    	if( isNaN($("input[name='goodsPrice']").val()) || isNaN($("input[name='goodsCount']").val())){
	    		    $("span[id*='error']").text("");
	    			$("#error2").text("价格,库存请填写数字");
	    			return ;
	    	}
	    	if($("#goodsTypeId").val()==0){
	    			$("span[id*='error']").text("");
	    			$("#error3").text("请选择商品类型");
	    			return ;
	    	}
	    	if($("input[name='goodsId']").val()==0){
	    			$("span[id*='error']").text("");
	    			$("#error4").text("请输入商品编码");
	    			return ;
	    	}
		var formGoods=$("#goodsInfo").serialize();
		$.post("addGoods.json", formGoods,addGoods, "JSON");
			function addGoods(data) {
				if(data<=0){
					$.MsgBox.Alert("提示","添加失败,请联系管理员");
				}else{
					$.MsgBox.Alert("提示","添加成功");
					
					//清空表单
					$(":input","#goodsInfo") 
					.not(":button, :submit, :reset, :hidden") 
					.val("") 
					.removeAttr("checked") 
					.removeAttr("selected");
				}
			}
	
	});


	$(document).ready(function(e) {
        $(".input").hover(function(e) {//按钮悬浮背景变色
            $(this).css("background-color","#CCC")
        },function(){
			 $(this).css("background-color","#EFEFEF")
			});
    });

	$('.easyui-tabs1').tabs({
      tabHeight: 36
    });
    $(window).resize(function(){
    	$('.easyui-tabs1').tabs("resize");
    }).resize();
</script>
</html>



