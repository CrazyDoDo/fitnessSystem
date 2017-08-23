<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ModalDialog.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link
	href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath }/statics/css/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link href="${pageContext.request.contextPath }/statics/css/green.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link
	href="${pageContext.request.contextPath }/statics/css/custom.min.css"
	rel="stylesheet">
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/membrseAddbase.css" rel="stylesheet">
   	<link href="${pageContext.request.contextPath}/statics/css/membrsebasic.css" rel="stylesheet">
 </head>
  <style type="text/css">
	*{ margin:0px; padding:0px;}
	.left{ text-align:right; width:100px; color:#666}
	input{ height:25px; margin-top:5px; margin-right:5px; margin-left:5px;color:#000000}
	input[name='kecheng']{ color: #FFF; background-color:#666;}
	textarea{margin-top:5px; resize:none;}
	select{margin-top:5px;color:#000000}
	li{list-style:none;cursor:pointer;}
</style>
<body>
    
<!--弹出的模态框-->
<!--修改商品信息-->
<div id="updateGoodsModal" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog modal-lg"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改商品信息</h4>
            </div>
            <div class="media-body">
	    	 <form action="#" method="post" id='goodsInfo'>
			      	<table class="kv-table">
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
			      	<table class="kv-table">
						<tbody>
							<tr>
								<td class="kv-label">商品编码:</td>
								<td class="kv-content"><input type="text" name="goodsId" size="80" id="goodsId" readonly="readonly">
								<span id="error4"  style="color:#FF0000"></span></td>
							</tr>                                             
						</tbody>
					</table>
	
			      	<table class="kv-table">
						<tbody>
							<tr>
								<td class="kv-label">商品说明:</td>
								<td class="kv-content"><textarea name="common" id="common" rows="3" style="resize:none ;width:550px;color:#000"></textarea></td>
							</tr> 						                                               
						</tbody>
					</table>
			  </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="updateGoods">保存</button>
            </div>
        </div>
    </div>
</div>


<!--添加商品类型-->
<div id="addGoodsType" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加商品类型</h4>
            </div>
            <div class="media-body">
		    	<table class="kv-table">
		        	<tr>
		            	<td class="kv-label" style="width:150px">分类名称:</td>
		                <td class="kv-content"><input type="text" size="50px" name="goodsType" id="goodsType"/>
		                <span id="error5" style="color:#FF0000">不能为空</span>
		                </td>
		            </tr>                                                                      
	       		 </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="saveGoodsType">保存</button>
            </div>
        </div>
    </div>
</div>

<!--修改商品类型-->
<div id="updateGoodsType" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改商品类型</h4>
            </div>
            <div class="media-body">
		    	<table class="kv-table">
		        	<tr>
		            	<td class="kv-label" style="width:150px">分类名称:</td>
		                <td class="kv-content">
		                <input type="hidden" id="typeId">
		                <input type="text" size="50px" name="goodsType" id="typeName"/>
		                <span id="error6" style="color:#FF0000"></span>
		                </td>
		            </tr>                                                                      
	       		 </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="updateType">保存</button>
            </div>
        </div>
    </div>
</div>



<!--商品出售-->
<div id="goodsXiaoShou" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">商品出售</h4>
            </div>
            <div class="media-body">
	            <form action="#" method="post" id='formOrder'>
			    	<table class="kv-table">
							<tr>
				            	<td class="kv-label"  style="width:150px">商品名称:</td>
				                <td class="kv-content">
				                <input type="text" size="50px" name="goodsName"/>
				                <input type="hidden" name="goodsId">
				                </td>
				            </tr>
				        	<tr>
				            	<td class="kv-label"  style="width:150px">会员卡号:</td>
				                <td class="kv-content"><input type="text" size="50px" name="membersId"/>
				                <span id="error7" style="color:#FF0000"></span></td>
				            </tr>
				        	<tr>
				            	<td class="kv-label"  style="width:150px">单价:</td>
				                <td class="kv-content">
				                <input type="text" size="20px" name="goodsPrice" readonly="readonly" />
				                                   数量:
				                <input type="text" size="20px" name="goodsSum" id="goodsSum"/>
				                <span id="error8" style="color:#FF0000"></span>
				                </td>
				            </tr>
				        	<tr>
				            	<td class="kv-label"  style="width:150px">金额:</td>
				                <td class="kv-content"><input type="text" size="50px" name="money" readonly="readonly"/></td>
				            </tr>                                                                        
		       		 </table>
		        </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="saveXiaoShou">保存</button>
            </div>
        </div>
    </div>
</div>

  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/bootstrap.js"></script>	
    <script type="text/javascript"
	  src="${pageContext.request.contextPath}/statics/css/My97DatePicker/WdatePicker.js"></script>	
<!-- iCheck -->
<script
	src="${pageContext.request.contextPath }/statics/js/icheck.min.js"
	type="text/javascript"></script>
<!-- Custom Theme Scripts -->
<script
	src="${pageContext.request.contextPath }/statics/js/custom.min.js"
	type="text/javascript"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/message.js"></script>
  </body>
</html>
