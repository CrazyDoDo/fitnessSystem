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
    <title>销售统计</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/basic_info.css" rel="stylesheet">
    <style type="text/css">
		.infoList{cursor:pointer;}	
    </style> 
</head> 
<body style="background-color:#FFF">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
        	<div class="easyui-tabs1" style="width:100%;height:100%;">
		      <div title="销售统计" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">销售统计</span></div>
                <form action="#" method="post" id="formOrder">
            			   销售日期: <input type="text" size="25px" name="date1" onClick="WdatePicker()" class="Wdate">至</input>
                		<input type="text" size="25px" name="date2" onClick="WdatePicker()" class="Wdate"></input>
                       <input type="button" id="select" name="select" value="快速查询"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
						<input type="reset" name="select" value="重置"
							style="padding-left:15px; background-color:#828282; color:#FFF;width:70px; height:28px;">
                </form>
		      	<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282; padding-top: 0px;padding-bottom: 1px;">
									<th class="column-title"></th>
									<th class="column-title">销售日期</th>
									<th class="column-title">销售金额</th>
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
		var formOrder=$("#formOrder").serialize();
		$.post("fitness/goodsController/getGoodsMoneyList.json",formOrder+"&pageIndex=" + pageIndex, showPersonalDrop, "JSON");
		function showPersonalDrop(date) {
			var goodsList = date.goodsOrderList;
			for ( var i = 0; i < goodsList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer' name='fitness/goodsController/goXiaoShouMingxi?date="+goodsList[i].date+"'>"
										+ "<td class='update'></td>"
										+ "<td class='update'>"
										+ goodsList[i].date + "</td>"
										+ "<td class='update'>"
										+ goodsList[i].money + "</td></tr>");

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
	// 按条件搜索信息
	$("#select").click(function() {
		goFirst(goPageIndex);
	});
	
 	//选中变色,改变标题
	$(".infoList").on("click",".flat", function() {
		titleUpdate();
		if ($(this).attr("aa") == 1) {
			$(this).parent().parent().css("background-color", "#E6F9F7");
			$(this).attr("aa", 0);
		} else {
			$(this).parent().parent().css("background-color", "#FFF");
			$(this).attr("aa", 1);
		}
	}); 


	
		//点击跳转修改会员信息
	$(".update").live("click",function(e){
						var title = "预约跟进";
						var url = $(this).parent("tr").attr("name");
						var content = "<div title='预约跟进' data-options='closable:true'  class='basic-info'>"
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
