<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<title>会员卡列表</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link href="${pageContext.request.contextPath }/statics/css/basic_info.css" rel="stylesheet">
<!-- Bootstrap -->
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
<body style="background-color:#FFF">
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="会员卡列表" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">会员列表</span><img id="update"
							src="${pageContext.request.contextPath }/statics/images/shuxin2.jpg"
							width="40" height="17"
							style="margin:0px 0px 0px 70px; cursor:pointer">
						<div class="x_content">

							<div style="margin-bottom:5px;">
								<form action="" method="post">
									卡号: <input type="text" id="membersId"> <input
										type="button" id="select" name="select" value="快速查询"
										style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
								</form>
							</div>

							<div class="table-responsive">
								<table class="table table-striped jambo_table bulk_action">
									<thead>
										<tr class="headings" style="background-color:#828282">
											<th class="column-title">卡号</th>
											<th class="column-title">姓名</th>
											<th class="column-title">性别</th>
											<th class="column-title">卡类型</th>
											<th class="column-title">开卡时间</th>
											<th class="column-title">到期时间</th>
											<th class="column-title">操作员</th>
											<th class="column-title">教练</th>
											<th class="column-title">状态</th>
											<th class="bulk-actions" colspan="9"><a class="antoo"
												style="color:#fff; font-weight:500;">删除会员信息(<span
													class="action-cnt"></span> )</a></th>
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
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- iCheck -->
<script
	src="${pageContext.request.contextPath }/statics/js/icheck.min.js"
	type="text/javascript"></script>
<!-- Custom Theme Scripts -->
<script
	src="${pageContext.request.contextPath }/statics/js/custom.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/message.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/membersjs/membrseInfoList.js"></script>

