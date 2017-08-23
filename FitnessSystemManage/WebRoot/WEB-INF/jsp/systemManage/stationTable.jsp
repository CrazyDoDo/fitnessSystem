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
    <title>岗位列表</title> 
    <link href="${pageContext.request.contextPath}/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath}/statics/css/basic_info.css" rel="stylesheet">
</head> 
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="岗位列表" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">岗位列表</span><img id="update"
							src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg"
							width="40" height="17"
							style="margin:0px 0px 0px 70px; cursor:pointer">
					</div>
					<input type="button" id="addEmployees" value="+添加岗位" style="width:100px; height:25px; margin-bottom:5px"/>  
					<form action="#" method="post" id="formInfo" style="margin-bottom:5px;">
						<span style="font-size:12px">岗位名称:</span> <input type="text"
							name="typeName" size="20px" style="height:20px;">
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
									<th class="column-title">编号</th>
									<th class="column-title">岗位名称</th>
									<th class="column-title">所属上级</th>
									<th class="column-title">说明</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除岗位(<span
											class="action-cnt"></span>)</a></th>
								</tr>
							</thead>

							<tbody class="infoList">
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
		$(".infoList").html("");
		var formInfo = $("#formInfo").serialize();
		$.post("fitness/emoloyeesController/getEmployeesTypeList.json", "pageIndex="
				+ pageIndex + "&" + formInfo, getemployeesTypeList, "JSON");
		function getemployeesTypeList(date) {
			var employeesTypeList = date.employeesTypeList;
			for ( var i = 0; i < employeesTypeList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer'>"
										+ "<td style='padding-top: 5px'><input type='checkbox' aa='1' class='flat' name='table_records' value='"
										+ employeesTypeList[i].employeesTypeId + "'></td>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update'>"
										+ employeesTypeList[i].typeName
										+ "</td>" + "<td class='update'>"
										+ employeesTypeList[i].fatheyName
										+ "</td>" + "<td class='update'>" 
										+ employeesTypeList[i].common
										+ "</td></tr>");

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

	// 快速搜索会员列表
	$("#select").click(function() {
		goFirst(1);
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
	$(".infoList").on("click", ".flat", function() {
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
		if (this.checked == true) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = true;
			});
			$(".flat").parent().parent().css("background-color", "#E6F9F7");
			$(".flat").attr("aa", 0);
		} else if (this.checked == false) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = false;
			});
			$(".flat").parent().parent().css("background-color", "#FFF");
			$(".flat").attr("aa", 1);
		}
		titleUpdate();
	});

	//删除租柜信息
	$(".antoo").click(
			function() {
				var info = $(this).find("span").text();
				$.MsgBox.Confirm("提示", "是否删除这" + info, deletePersonalDrop,
						nodeletememcard);
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
					var employeesTypeId = $(this).val();
					var typeName= $(this).parents("tr").find("td:eq(2)").text();
 					$.post("fitness/emoloyeesController/deleteEmployeesType.json",
							"employeesTypeId=" + employeesTypeId+"&typeName="+typeName, deleteEmployeesType,
							"JSON");
					function deleteEmployeesType(data) {
					} 
				});
		goFirst(goPageIndex);
		nodeletememcard();
	}
	
	//添加员工
	$("#addEmployees").click(function(){
						var title = "添加岗位信息";
						var url = "fitness/emoloyeesController/goAddStation";
						function addTab(title, url) {
							var content = "<div title='添加岗位信息' data-options='closable:true'  class='basic-info'><div class='column'><span class='current'>添加员工信息</span></div>"
									+ "<iframe class='page-iframe' src='"
									+ url
									+ "'frameborder='no'   border='no' height='430px' width='100%' scrolling='auto'></iframe></div>";
							if ($('.easyui-tabs1').tabs('exists', title)) {
								$(".easyui-tabs1").tabs("close", title);
								$('.easyui-tabs1').tabs('add', {
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
					}	
						addTab(title, url);
	});
	
	//修改员工信息
	$(".update").live("click",function(e) {
						var title = "更改岗位信息";
						var url = "fitness/emoloyeesController/goUpdateStation?employeesTypeId="+$(this).parent("tr").find(".flat").val();
						function addTab(title, url) {
							var content = "<div title='更改员工信息' data-options='closable:true'  class='basic-info'><div class='column'><span class='current'>更改员工信息</span></div>"
									+ "<iframe class='page-iframe' src='"
									+ url
									+ "'frameborder='no'   border='no' height='430px' width='100%' scrolling='auto'></iframe></div>";
							if ($('.easyui-tabs1').tabs('exists', title)) {
								$(".easyui-tabs1").tabs("close", title);
								$('.easyui-tabs1').tabs('add', {
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
						}
						addTab(title, url);
					});

	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();
</script>
</html>


