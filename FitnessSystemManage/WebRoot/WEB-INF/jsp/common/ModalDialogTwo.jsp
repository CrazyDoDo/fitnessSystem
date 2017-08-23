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

<!--添加课程-->
<div id="addCurriculum" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加课程</h4>
            </div>
            <div class="media-body" >
	    	<form action="#" method="post" id="curriculumInfo">
		    	<table  class="kv-table">
		        	<tr>
		            	<td class="kv-label" style="width:150px">课程名称:</td>
		                <td class="kv-content"><input type="text" size="40px" name="courseName"  placeholder="必填"   title="请输入课程名称"/><span id="courseName"></span></td>
		            </tr>
		        	<tr>
		            	<td class="kv-label" style="width:150px">英文名称:</td>
		                <td class="kv-content"><input type="text" size="40px" name="courseEnglish"  placeholder="选填"  ></td>
		            </tr>  
		            <tr>
		            	<td class="kv-label" style="width:150px">上课人数:</td>
		                <td class="kv-content"><input type="text" size="40px" name="count"  placeholder="必填"  title="请输入上课人数"><span id="count"></span></td>
		            </tr>                    
		            <tr > 
		                <td class="kv-label" style="width:150px">课程描述:</td>
		                <td class="kv-content"><textarea rows="3"  name="comment" style="width: 336px;color:#000000"  placeholder="课程详细介绍"  title="请输入课程详细介绍"></textarea>
		                <span id="comment"></span></td>
		            </tr>                                                     
		        </table>
			</form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="saveCurriculum">保存</button>
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
	    	<form action="#" method="post" id="updateCurriculumInfo">
		    	<table   class="kv-table">
		        	<tr>
		            	<td class="kv-label" style="width:150px">课程名称:</td>
		                <td class="kv-content">
		                <input type="hidden" name="courseId">
		                <input type="text" size="40px" name="courseName"  placeholder="必填"   title="请输入课程名称"/><span id="courseName"></span></td>
		            </tr>
		        	<tr>
		            	<td class="kv-label" style="width:150px">英文名称:</td>
		                <td class="kv-content"><input type="text" size="40px" name="courseEnglish"  placeholder="选填"  ></td>
		            </tr>  
		            <tr>
		            	<td class="kv-label" style="width:150px">上课人数:</td>
		                <td class="kv-content"><input type="text" size="40px" name="count"  placeholder="必填"  title="请输入上课人数"><span id="count"></span></td>
		            </tr>                    
		            <tr > 
		                <td class="kv-label" style="width:150px">课程描述:</td>
		                <td class="kv-content"><textarea rows="3"  name="comment" style="width: 336px;color:#000000"  placeholder="课程详细介绍"  title="请输入课程详细介绍"></textarea>
		                <span id="comment"></span></td>
		            </tr>                                                     
		        </table>
			</form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="updateCurrInfo">保存</button>
            </div>
        </div>
    </div>
</div>

<!--添加教练代课-->
<div id="addPersonalCurr" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加教练</h4>
            </div>
            <div class="media-body" >
	    	<form action="#" method="post" id="fromAddPer">
		    	<table  class="kv-table">
		        	<tr>
		            	<td class="kv-label" style="width:150px">教练姓名:</td>
		                <td class="kv-content">
		                    <select name="personalId" id="addPersonal"  style=" width:340px; height:25px; margin-left:5px;">
		                		<option value='0'>请选择...</option>
		                		<c:forEach items="${personalList}" var="personal">
		                			<option value='${personal.employeesId}'>${personal.name}</option>
		                		</c:forEach>
		              	    </select>
		              	    <span id="error1"></span></td>
		            </tr>
		        	<tr>
		            	<td class="kv-label" style="width:150px">课程选择:</td>
		                <td class="kv-content">
							<select name="courseId" id="addCurr"  style=" width:340px; height:25px; margin-left:5px;"></select>
		              	    <span id="error2"></span>
		                </td>
		            </tr>  
                                                   
		        </table>
			</form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="savePersonalCurr">保存</button>
            </div>
        </div>
    </div>
</div>


<!--修改教练代课-->
<div id="updatePersonalCurr" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">修改教练</h4>
            </div>
            <div class="media-body">
	    	<form action="#" method="post" id="updatePer">
		    	<table class="kv-table">
		        	<tr>
		            	<td class="kv-label" style="width:150px">教练姓名:</td>
		                <td class="kv-content">
		                <input type="hidden" name="personalId" id="personalId">
		                <input type="hidden" name="personalCurrId" id="personalCurrId">
		                <input type="text" size="40px" name="personalName" id="updatePers" readonly="readonly"  placeholder="必填"   title="请输入课程名称"/>
		                </td>
		            </tr>
		        	<tr>
		            	<td class="kv-label" style="width:150px">课程选择:</td>
		                <td class="kv-content">
							<select name="courseId" id="updateCurr"  style=" width:336px; height:25px;"></select>
		                <span id="error3"></span>
		                </td>
		            </tr>                                                     
		        </table>
			</form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="updatePersonal">保存</button>
            </div>
        </div>
    </div>
</div>


<!--打开储物柜出租页面-->
<div id="openLockerRent" class="modal fade"><!-- modal固定布局，上下左右都是0表示充满全屏，支持移动设备上使用触摸方式进行滚动。。-->
    <div class="modal-dialog"><!-- modal-dialog默认相对定位，自适应宽度，大于768px时宽度600，居中-->
        <div class="modal-content"><!-- modal-content模态框的边框、边距、背景色、阴影效果。-->
            <div class="modal-header">
                <button class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">储物柜出租</h4>
            </div>
            <div class="media-body">
            <form action="#" method="post" id="formLockerOrder">
		    	<table class="kv-table">
		        	<tr>
		            	<td class="kv-label" style="width:150px">储物柜编号:</td>
		                <td class="kv-content">
		                <input type="text" size="32px" name="lockerId" id="lockerId" readonly="readonly"/>
		                </td>
		            </tr>                                                                      
		        	<tr>
		            	<td class="kv-label" style="width:150px">会员卡号:</td>
		                <td class="kv-content">
		                <input type="text" size="32px" name="membersId" id="membersId"/>
		                <span id="lockerOrderErr1" style="color:#FF0000"></span>
		                </td>
		            </tr>                                                                      
		        	<tr>
		            	<td class="kv-label" style="width:150px">截止日期:</td>
		                <td class="kv-content">
		                <input type="text" size="32px" name="overDate" id="overDate" onClick="WdatePicker()" class="Wdate"/>
		                <span id="lockerOrderErr2" style="color:#FF0000"></span>
		                </td>
		            </tr>                                                                      
	       		 </table>
	       	</form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal">关闭</button>
                <button class="btn btn-primary" id="saveLockerOrder">保存</button>
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
