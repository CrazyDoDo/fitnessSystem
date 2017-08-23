<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>私教等级列表</title>
<link href="${pageContext.request.contextPath}/statics/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
<link href="${pageContext.request.contextPath}/statics/css/basic_info.css" rel="stylesheet">
</head>
<body  style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="私教等级列表" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">私教等级列表</span><img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17" style="margin:0px 0px 0px 70px; cursor:pointer">
					</div>
                	<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th><input type="checkbox" id="123all" class="123">
									</th>
									<th class="column-title">编号</th>
									<th class="column-title">等级</th>
									<th class="column-title">课程单价</th>
									<th class="column-title">操作员</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除私教等级(<span
											class="action-cnt"></span>)</a>
									</th>
								</tr>
							</thead>

							<tbody class="memcard">
							</tbody>
						</table>
					</div>
					<div class="dataTables_paginate paging_simple_numbers"
						id="datatable_paginate" style="height:20px; margin-bottom:30px;">
						<ul class="pagination">

						</ul>
					</div>
					
				</div>
				<div title="添加私教等级" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">添加私教等级</span>
					</div>
					<iframe class='page-iframe' src='fitness/siJiaoDengJi/goTianjiadengji'
						frameborder='no' border='no' height='480px' width='100%'
						scrolling='auto'></iframe>
				</div> 
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/personalTranierjs/personalDengji.js"></script>
</html>


