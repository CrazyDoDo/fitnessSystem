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
    <title>教练列表</title> 
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
		      <div title="教练列表" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">教练列表</span>
		      	 <img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17"
				  style="margin:0px 0px 0px 70px; cursor:pointer">
		      	</div>
              	 <input type="button" name='add' id="addPer" value="+添加教练" style="width:120px; margin-bottom:5px; margin-left: 0px; color:#000000 "/>               
		      
		      <div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282; padding-top: 0px;padding-bottom: 1px;">
									<th style="padding-top: 0px;padding-bottom: 0px">
									<input type="checkbox" id="123all" class="123" >
									</th>
									<th class="column-title">编号</th>
									<th class="column-title">教练名称</th>
									<th class="column-title">联系电话</th>
									<th class="column-title">课程名称</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除教练(<span
											class="action-cnt"></span> )</a>
									</th>
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
		$.post("fitness/curriculum/selectPersonalCurrList.json", "pageIndex=" + pageIndex, showPersonalDrop, "JSON");
		function showPersonalDrop(date) {
			var personalCurrList = date.personalCurrList;
			for ( var i = 0; i < personalCurrList.length; i++) {
				$(".infoList")
						.append(
								"<tr class='even pointer'>"
										+ "<td style='padding-top: 0px;padding-bottom: 0px'><input type='checkbox' aa='1' class='flat' name='table_records' value='"
										+ personalCurrList[i].personalCurrId + "'></td>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update' name='"+personalCurrList[i].personalId+"'>"
										+ personalCurrList[i].personalName + "</td>"
										+ "<td class='update'>"
										+ personalCurrList[i].personalPhone + "</td>"
										+ "<td class='update'>"
										+ personalCurrList[i].courseName + "</td></tr>");

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

	//全选和取消全选
	$(".123").click(function() {
		if (this.checked==true) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = true;
			});
			$(".flat").parent().parent().css("background-color", "#E6F9F7");
			$(".flat").attr("aa", 0);
		} else if(this.checked==false) {
			$(".infoList").find(":checkbox").each(function() {
				this.checked = false;
			});
			$(".flat").parent().parent().css("background-color", "#FFF");
			$(".flat").attr("aa", 1);
		}
		titleUpdate();
	});


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
					var personalCurrId = $(this).val();
					$.post("fitness/curriculum/deletePersonalCurr.json", "personalCurrId=" + personalCurrId,
							deleteCurriculum, "JSON");
					function deleteCurriculum(data) {
					}
				});
		goFirst(goPageIndex);
		nodeletememcard();
	}
	
	
	//打开添加课程模态框
	$("#addPer").click(function(){
	   $.post("fitness/curriculum/getCurrInfo.json",getCurrInfo, "JSON");
			function getCurrInfo(data) {
					$("#addCurr").html("");
					$("#addCurr").append("<option value='0'>请选择...</option>");
				for ( var i = 0; i < data.length; i++) {
						$("#addCurr").append("<option value='"+data[i].courseId+"'>"+data[i].courseName+"</option>");
				}
			}
		$("#addPersonalCurr").modal("show");
	});
	
	//添加课程
	$("#savePersonalCurr").click(function(){
		if($("#addPersonal").val()==0){
			$("#error1").text("请选择教练");
			return ;
		}
		if($("#addCurr").val()==0){
			$("#error2").text("请选择课程");
			return ;
		}
		var formCurr=$("#fromAddPer").serialize();
		$.post("fitness/curriculum/addPersonalCurr.json",  formCurr,
							addPersonalCurr, "JSON");
			function addPersonalCurr(data) {
				if(data>0){
					goFirst(goPageIndex);
				}
				$("#addPersonalCurr").modal("hide");
			}					
	});
	
	//打开修改课程信息窗口
	$(".infoList").on("click",".update", function(){
		var personalName=$(this).parent("tr").find("td:eq(2)").text();
		var personalId=$(this).parent("tr").find("td:eq(2)").attr("name");
		var personalCurrId=$(this).parent("tr").find(".flat").val();
		$("#updatePers").val(personalName);
		$("#personalId").val(personalId);
		$("#personalCurrId").val(personalCurrId);
	    $.post("fitness/curriculum/getCurrInfo.json",getCurrInfo, "JSON");
			function getCurrInfo(data) {
					$("#updateCurr").html("");
					$("#updateCurr").append("<option value='0'>请选择...</option>");
				for ( var i = 0; i < data.length; i++) {
						$("#updateCurr").append("<option value='"+data[i].courseId+"'>"+data[i].courseName+"</option>");
				}
			}		
	    $("#updatePersonalCurr").modal("show");
	}); 
	
	//修改课程
	$("#updatePersonal").click(function(){
			if($("#updateCurr").val()==0){
				$("#error3").text("请选择课程");
				return ;
		    }
			var formCurr=$("#updatePer").serialize();
			$.post("fitness/curriculum/updatePersonalCurr.json",  formCurr,
							updatePersonalCurr, "JSON");
			function updatePersonalCurr(data) {
				if(data>0){
					goFirst(goPageIndex);
				}
				$("#updatePersonalCurr").modal("hide");
			}	
	});
	
	
	
</script>
</html>
