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
    <title>课程类型</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/curriculumBase.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css"> 
        <style type="text/css">
		.kv-content{cursor:pointer;}	
    </style>
</head> 
<body>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
		      <div title="课程类型" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">课程类型</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">分类名称</td>
							<td class="kv-label">场地容量</td>
						</tr>
						<tr>
                            <td class="kv-content">团体教室</td> 
                            <td class="kv-content">50</td>
						</tr>
					</tbody>
				</table>
		      </div>
                  <div title="课程管理" data-options="closable:false">
                                <iframe class='page-iframe' src='goCurriculumguanli' frameborder='no'border='no' height='480px' width='100%' scrolling='auto'></iframe>
                  </div> 
                  <div title="教练管理" data-options="closable:false">
                                <iframe class='page-iframe' src='goPersonalManage' frameborder='no'border='no' height='480px' width='100%' scrolling='auto'></iframe>
                  </div> 
		    </div>
		</div>
	</div>
	
</body> 
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

	$('.easyui-tabs1').tabs({
      tabHeight: 36
    });
    $(window).resize(function(){
    	$('.easyui-tabs1').tabs("resize");
    }).resize();
</script>
</html>
