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
<title>销售业绩统计</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link href='${pageContext.request.contextPath }/statics/css/basic_info.css' rel="stylesheet">
</head>
<style type="text/css">
.content input {
	margin-right: 5px;
	margin-bottom: 6px;
}

.content select {
	width: 100px;
}
	span{color:#000000}
</style>
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<div class="container">
		<div style=" height:450px;" class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="销售业绩统计" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">销售报表</span>
					</div>
					<form action="#" method="post" id="formInfo">
						<span>工号:</span><input type="text" size="20px" id="employeesId"> 
						<span>员工姓名:</span><input type="text" size="20px" id="emplName"> 
						<input type="button" id="select" name="select" value="快速查询"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
						<input type="reset" id="newreset" name="select" value="重置"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:70px; height:28px;">
					</form>
					<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th class="column-title">编号</th>
									<th class="column-title">工号</th>
									<th class="column-title">姓名</th>
									<th class="column-title">职位</th>
									<th class="column-title">手机号</th>
									<th class="column-title">累计客户</th>
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
			</div>
		</div>
	</div>

</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/customerjs/xiaoshouYeJi.js"></script>


