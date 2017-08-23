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
    <title>训练计划卡</title> 
    <link href="${pageContext.request.contextPath}/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/basic_info.css" rel="stylesheet">
</head> 
<body  style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
          <div class="easyui-tabs1" style="width:100%;height:100%;">
        	<div title="训练计划卡" data-options="closable:false" class="basic-info">
                 <div class="column"><span class="current">会员查询</span>
                 <img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17" style="margin:0px 0px 0px 70px; cursor:pointer"></div>
                <form action="#" method="post">
                会员卡号: <input type="text" name="code" id="membersId" style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;">
                时间范围: <input type="text" size="25px" id="date1" onClick="WdatePicker()" class="Wdate"/>&nbsp;至
                 <input type="text" size="25px" id="date2" onClick="WdatePicker()" class="Wdate"/>
				 <input type="button" id="select" name="select" value="快速查询"
					style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;"> 
				 <input type="reset" name="select" value="重置"
					style="padding-left:15px; background-color:#828282; color:#FFF;width:70px; height:28px;"> 
                </form>
                	<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th><input type="checkbox" id="123all" class="123">
									</th>
									<th class="column-title">会员卡号</th>
									<th class="column-title">会员姓名</th>
									<th class="column-title">电话</th>
									<th class="column-title">教练姓名</th>
									<th class="column-title">上课时间</th>
									<th class="column-title">备注</th>
									<th class="column-title">状态</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除会员预约(<span
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
            <div title="私教购课" data-options="closable:false">
                                <iframe class='page-iframe' src='fitness/personal/goMembrsePersonal' frameborder='no'border='no' height='480px' width='100%' scrolling='auto'></iframe>
                  </div>
                    <div title="私教退课" data-options="closable:false">
                    
                                <iframe class='page-iframe' src='fitness/personal/goPersonaltuike' frameborder='no'border='no' height='480px' width='100%' scrolling='auto'></iframe>
                  </div>                    
                  <div title="预约上课" data-options="closable:false">
                                <iframe class='page-iframe' src='fitness/personal/goPersonalYewu' frameborder='no'border='no' height='480px' width='100%' scrolling='auto'></iframe>
                  </div>
              </div> 
		</div>
	</div>
	
</body> 
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/personalTranierjs/personalXunlian.js"></script>

