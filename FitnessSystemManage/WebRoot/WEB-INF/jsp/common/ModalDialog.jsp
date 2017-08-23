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
  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" type="text/css"></link>

 </head>
  <style type="text/css">
	*{ margin:0px; padding:0px;}
	.left{ text-align:right; width:100px; color:#666}
	input{ height:25px; margin-top:5px; margin-right:5px; margin-left:5px;}
	input[name='kecheng']{ color: #FFF; background-color:#666;}
	textarea{margin-top:5px; resize:none;}
	select{margin-top:5px;}
	li{list-style:none;cursor:pointer;}
</style>
<body>
    
<!--弹出的模态框-->

<!--添加上课时间-->
<div id="addTime" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加上课时间</h4>
            </div>
            <div class="media-body">
    	<table>

            <tr > 
                <td style=" text-align:right; width:100px; color:#666">课程时段:</td>
                <td><input type="text" size="12px" id="addDate1"/>至<input type="text" size="12px" id="addDate2"/><span style="color:#666; font-size:14px;">(24小时制&nbsp;例19:30-20:30)</span></td>
             </tr>                                                          
        </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="addDate">保存</button>
            </div>
        </div>
    </div>
</div>


<!--修改上课时间-->
<div id="updateTime" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改上课时间</h4>
            </div>
            <div class="media-body">
    	<table>

            <tr > 
                <td style=" text-align:right; width:100px; color:#666">课程时段:</td>
                <td><input type="text" size="12px" id="updateDate1"/>至<input type="text" size="12px" id="updateDate2"/><span style="color:#666; font-size:14px;">(24小时制&nbsp;例19:30-20:30)</span></td>
             </tr>                                                          
        </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="updateDate">修改</button>
            </div>
        </div>
    </div>
</div>


<!--添加课程-->
<div id="addCurriculum" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加课程</h4>
            </div>
            <div class="media-body">
		    	<table>
		            <tr > 
		                <td class="left">课程:</td>
		                <td>
		                <select name="curriculum" id="addCurr"  style=" width:320px; height:25px; margin-left:5px;">
		                	<option value='0'>请选择...</option>
		                	<c:forEach items="${perAndCurr}" var="curr">
		                		<option value='${curr.courseId}'>${curr.courseName}</option>
		                	</c:forEach>
		                </select>
		                </td>
		            </tr> 
		        	<tr>
		            	<td class="left">教练:</td>
		                <td>
						<input type="text" id="addPersonalName" style=" width:320px; height:25px; margin-left:5px;" readonly="readonly">               
		                </td>
		            </tr>                                                                               
		        </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="addCommon">保存</button>
            </div>
        </div>
    </div>
</div>


<!--修改课程-->
<div id="updateCurriculum" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改课程</h4>
               
            </div>
            <div class="media-body">
		    	<table>
		            <tr > 
		                <td class="left">课程:</td>
		                <td id="aa">
		                <select name="kecheng" id="updateCurr" style=" width:320px; height:25px; margin-left:5px;">
		               	    <option value='0'>请选择...</option>
		                	<c:forEach items="${perAndCurr}" var="curr">
		                		<option value="${curr.courseId}" >${curr.courseName}</option>
		                	</c:forEach> 
		                	
		                </select>
		                  
		                </td>
		            </tr> 
		        	<tr>
		            	<td class="left">教练:</td>
		                <td>
		                <input type="text" id="updatepersonalName" style=" width:320px; height:25px; margin-left:5px;" readonly="readonly">
		                </td>
		            </tr>                                                                               
		        </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="deleteCommon">删除</button>
                <button class="btn btn-primary" id="updateCommon">修改</button>
            </div>
        </div>
    </div>
</div>


<!--会员预约上课-->
<div id="MembersOrderCurr" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">会员预约</h4>
            </div>
            <div class="media-body">
		    	<table>
		        	<tr>
		            	<td class="left">会员卡号:</td>
		                <td>
		                <input type="text" id="membersId" style=" width:320px; height:25px; margin-left:5px;"><span id="error" style="color:#FF2D2D"></span>
		                </td>
		            </tr>                                                                               
		        </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="addMembersOrder">保存</button>
            </div>
        </div>
    </div>
</div>
 
   <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/bootstrap.js"></script>	
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/message.js"></script>
  </body>
</html>
