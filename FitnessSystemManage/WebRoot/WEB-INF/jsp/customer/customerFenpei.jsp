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
<title>销售经理</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link
	href='${pageContext.request.contextPath }/statics/css/basic_info.css'
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css">
</head>
<style type="text/css">
.content input {
	margin-right: 5px;
	margin-bottom: 6px;
}
</style>
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div style=" height:450px;" class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="客户资源分配" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">客户资源分配</span>
						 <img id="update"
							src="${pageContext.request.contextPath }/statics/images/shuxin2.jpg"
							width="40" height="17"
							style="margin:0px 0px 0px 70px; cursor:pointer">
					</div>
					<form action="#" method="post">
						销售员: <input type="text" size="20px" id="emplName"> <input
							type="button" id="select" name="select" value="快速查询"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
						分配新销售: <select name="xiaoshou" style="width:150px; height: 25px;"
							id="sales">
							<option value="88888">请选择</option>
						</select> <input type="button" name="fenpei" id="fenpei" value="分配"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
					</form>
										<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th><input type="checkbox" id="123all" class="123">
									</th>
									<th class="column-title">编号</th>
									<th class="column-title">客户姓名</th>
									<th class="column-title">性别</th>
									<th class="column-title">手机号</th>
									<th class="column-title">登记时间</th>
									<th class="column-title">状态</th>
									<th class="column-title">操作员</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">客户信息(<span
											class="action-cnt"></span> )</a>
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
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/customerjs/customerFenpei.js"></script>
</html>
