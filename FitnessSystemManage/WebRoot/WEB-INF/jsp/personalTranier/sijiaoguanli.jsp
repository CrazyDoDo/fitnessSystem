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
    <title>私教管理</title> 
    <link href="${pageContext.request.contextPath}/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/basic_info.css" rel="stylesheet">
</head> 
<body  style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
		      <div title="私教管理" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">私教管理</span>
		      	<img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17" style="margin:0px 0px 0px 70px; cursor:pointer"></div>
                <form action="#" method="post">
                工号: <input type="text" name="employeesId" id="employeesId" style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;">
                姓名: <input type="text" name="name" id="name" style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;">
<input type="button" id="select" name="select" value="快速查询"
					style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;"> 
                </form>		
                
                	<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282">
									<th class="column-title">编号</th>
									<th class="column-title">姓名</th>
									<th class="column-title">性别</th>
									<th class="column-title">手机号</th>
									<th class="column-title">教练等级</th>
									<th class="column-title">入职时间</th>
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

<script type="text/javascript">

/*用于定位当前页码*/
	var goPageIndex = 1;
	//初始化会员信息
	function nextPages(pageIndex) {
		$(".pagination").html("");
		$(".memcard").html("");
		var employeesId=$("#employeesId").val();
		var name=$("#name").val();
		$.post("fitness/siJiaoDengJi/getPersonalInfo.json", "pageIndex=" + pageIndex+"&employeesId="+employeesId+"&name="+name , showPersonalLever, "JSON");
		function showPersonalLever(date) {
			var personalInfoList = date.employeesList;
			for ( var i = 0; i < personalInfoList.length; i++) {
				$(".memcard")
						.append(
								"<tr class='even pointer' name='fitness/siJiaoDengJi/goUpdatepersonal?employeesId="
										+ personalInfoList[i].employeesId
										+ "'>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update'>"
										+ personalInfoList[i].name+ "</td>"
										+ "<td class='update'>"
										+ personalInfoList[i].sex + "</td>"
										+ "<td class='update'>"
										+ personalInfoList[i].phone + "</td>"
										+ "<td class='update'>"
										+ personalInfoList[i].leverName + "</td>"
										+ "<td class='update'>"
										+ personalInfoList[i].stratDate + "</td></tr>");

			}
			// 给首页,下一页,上一页,末页赋值
			var index = 1;
			var page = date;
			$(".pagination")
					.append(
							"<li class='paginate_button' id='datatable_previous'>"
									+ "<a  aria-controls='datatable' data-dt-idx='0' tabindex='0'>"
									+ "总页数[" + page.currentPageNo + "/"
									+ page.totalPageCount + "]</a></li>");
			if (page.currentPageNo > 1) {
				$(".pagination")
						.append(
								"<li class='paginate_button' id='datatable_previous'>"
										+ "<a onclick='javascript:goFirst(1)' tabindex='0'>首页</a></li>");
				$(".pagination").append(
						"<li class='paginate_button' id='datatable_previous'>"
								+ "<a  onclick='javascript:goFirst("
								+ (page.currentPageNo - 1) + ")'>上一页</a></li>");
				Index = page.currentPageNo;
			}
			if (page.currentPageNo < page.totalPageCount) {
				$(".pagination").append(
						"<li class='paginate_button' id='datatable_previous'>"
								+ "<a  onclick='javascript:goFirst("
								+ (page.currentPageNo + 1) + ")'>下一页</a></li>");
				$(".pagination").append(
						"<li class='paginate_button' id='datatable_previous'>"
								+ "<a  onclick='javascript:goFirst("
								+ page.totalPageCount + ")'>尾页</a></li>");
				Index = page.currentPageNo;
			}
			;
		}
	}
	//初始化会员信息
	$(function() {
		nextPages(1);
	});
	// 去首页,下一页,上一页,末页
	function goFirst(pageIndex) {
		nextPages(pageIndex);
		goPageIndex = pageIndex;
	}
	// 刷新会员列表
	$("#update").click(function() {
		goFirst(goPageIndex);
	});
	
	//根据会员卡号搜索会员信息
	$("#select").click(function() {
		nextPages(1);
	});
		
	function titleUpdate() {
		var e = $(".bulk_action input[name='table_records']:checked").length;
		if (e > 0) {
			$(".column-title").hide(), $(".bulk-actions").show(), $(
					".action-cnt").html(e + " 条数据 ");
		} else {
			$(".column-title").show();
			$(".bulk-actions").hide();
		}
	}
	//选中变色,改变标题
	$(".flat").live("click", function() {
		titleUpdate();
		if ($(this).attr("aa") == 1) {
			$(this).parent().parent().css("background-color", "#E6F9F7");
			$(this).attr("aa", 0);
		} else {
			$(this).parent().parent().css("background-color", "#FFF");
			$(this).attr("aa", 1);
		}
	});

	//全选和取消全选
	$(".123").click(function() {
		if ($(".123").attr("checked")) {
			$(":checkbox").attr("checked", true);
			$(".flat").parent().parent().css("background-color", "#E6F9F7");
			$(".flat").attr("aa", 0);
		} else {
			$(":checkbox").attr("checked", false);
			$(".flat").parent().parent().css("background-color", "#FFF");
			$(".flat").attr("aa", 1);
		}
		titleUpdate();
	})


	//删除会员卡信息
	$(".antoo").click(function() {
		var info = $(this).find("span").text();
		$.MsgBox.Confirm("提示", "是否删除这" + info, deletePersonalDrop, nodeletememcard);
	});
	function nodeletememcard() {
		$(":checkbox").attr("checked", false);
		$(".flat").parent().parent().css("background-color", "#FFF");
		$(".flat").attr("aa", 1);
		titleUpdate();
	}
	function deletePersonalDrop() {
		$(".bulk_action input[name='table_records']:checkbox:checked").each(
				function() {
					var leverId = $(this).val();
					$.post("fitness/siJiaoDengJi/deletePersonallever.json", "leverId=" + leverId,
							deleteMembersCard, "JSON");
					function deleteMembersCard(data) {
					}
				});
		goFirst(goPageIndex);
		nodeletememcard();
	}
	//点击跳转修改私教等级
	$(".update").live("click",function(e){
						var title = "修改私教信息";
						var url = $(this).parent().attr("name");
						var content = "<div title='修改私教信息' data-options='closable:true'  class='basic-info'>"
								+ "<iframe class='page-iframe' src='"
								+ url
								+ "' frameborder='no'   border='no' height='480px' width='100%' scrolling='auto'></iframe></div>";
						// 使用 'exists' 方法来判断 tab 是否已经存在，如果已存在则激活 tab。如果不存在则调用 'add'
						// 方法来添加一个新的 tab 面板
						function addTab(title) {
							if ($(".easyui-tabs1").tabs("exists", title)) {
								$(".easyui-tabs1").tabs("close", title);
								$(".easyui-tabs1").tabs("add", {
									title : title,
									content : content,
									closable : true
								});
							} else {
								$('.easyui-tabs1').tabs('add', {
									title : title,
									content : content,
									closable : true
								});
							}
							;
						}
						addTab(title);
	});	
    
	$('.easyui-tabs1').tabs({
      tabHeight: 36
    });
    $(window).resize(function(){
    	$('.easyui-tabs1').tabs("resize");
    }).resize(); 
</script>
</html>
