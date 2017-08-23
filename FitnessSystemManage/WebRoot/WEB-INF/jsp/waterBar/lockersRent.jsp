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
    <title>储物柜管理</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/curriculumtianjia.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css"> 
        <style type="text/css">
		.infoList{cursor:pointer;}	
    </style>
</head> 
<body style="background-color:#FFF">
	<jsp:include page="../common/ModalDialogTwo.jsp"></jsp:include>
	<div class="container"  style="width: 100% ;padding-left:0px">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
		      <div title="储物柜出租" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">储物柜管理</span>
		      	 <img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17"
				  style="margin:0px 0px 0px 70px; cursor:pointer">
		      	</div>
              	 <input type="button" name='add' id="nullLocker" value="+闲置储物柜" style="width:120px; margin-bottom:5px; margin-left: 0px; color:#000000 "/>               
              	 <input type="button" name='add' id="rentLocker" value="+已租储物柜" style="width:120px; margin-bottom:5px; margin-left: 0px; color:#000000 "/>               
		      
		      <div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282; padding-top: 0px;padding-bottom: 1px;">
									<th class="column-title"> </th>
									<th class="column-title">编号</th>
									<th class="column-title">储物柜类型</th>
									<th class="column-title">状态</th>
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
</html>
<script type="text/javascript">
/*用于定位当前页码*/
	var goPageIndex = 1;
	var state="";
	//初始化会员信息
	function nextPages(pageIndex) {
		$(".pagination").html("");
		$(".infoList").html("");
		
		$.post("fitness/lockerController/getLockerList.json", "pageIndex=" + pageIndex+"&state="+state, showPersonalDrop, "JSON");
		function showPersonalDrop(date) {
			var lokcerList = date.lokcerList;
			for ( var i = 0; i < lokcerList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer'><td></td>"
										+ "<td class='update' name='"+lokcerList[i].lockerId+"'>"
										+ "V-"+lokcerList[i].lockerId+ "</td>"
										+ "<td class='update'>"
										+ lokcerList[i].lockerType + "</td>"
										+ "<td class='update'>"
										+ lokcerList[i].state + "</td></tr>");

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
	
	$("#nullLocker").click(function(){
		state="'空闲'";
		goFirst(goPageIndex);
	});
	$("#rentLocker").click(function(){
		state="'已租'";
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
	
	 	//选中变色,改变标题
	$(".infoList").on("click",".update", function() {
		$("span[id*='lockerOrderErr']").text("");
		$("#lockerId").val($(this).parent("tr").find("td:eq(0)").attr("name"));
		//清空表单
		$("#overDate").val("");
		$("#membersId").val("");
		$("#openLockerRent").modal("show");
	});
	
	$("#saveLockerOrder").click(function(){
		if($("#membersId").val()==""){
	    			$("span[id*='lockerOrderErr']").text("");
	    			$("#lockerOrderErr1").text("请输入卡号");
	    			return ;
	    
	    }if($("#overDate").val()==""){
	    			$("span[id*='lockerOrderErr']").text("");
	    			$("#lockerOrderErr2").text("请输入日期");
	    			return ;
	    }
		var form=$("#formLockerOrder").serialize();
		$.post("fitness/lockerController/addLockerOrder.json", form, addLockerOrder, "JSON");
			function addLockerOrder(data){
				if(data>0){
					setTimeout(function(){$.MsgBox.Alert("提示","购买成功");},300);
				}else if(data==-1){
					$("#lockerOrderErr1").text("查无该会员");
					return;
				}
				else{
					setTimeout(function(){$.MsgBox.Alert("提示","购买失败");},300);
				}
				goFirst(goPageIndex);	
				$("#openLockerRent").modal("hide");
			}
	});

</script>

