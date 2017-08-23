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
    <title>课程管理</title> 
    <link href="${pageContext.request.contextPath }/statics/css/base.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css2/easyui.css">
    <link href="${pageContext.request.contextPath }/statics/css/curriculumtianjia.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css"> 
        <style type="text/css">
		.infoList{cursor:pointer;}	
    </style>
</head> 
<body  style="background-color:#FFF">
<jsp:include page="../common/ModalDialogTwo.jsp"></jsp:include>
	<div class="container" style="width: 100% ;padding-left:0px" >
		<div class="content" >
			<div class="easyui-tabs1" style="width:100%;height:100%;">
		      <div title="课程管理" data-options="closable:false" class="basic-info">
		      	<div class="column"><span class="current">课程列表</span>
		      	<img id="update" src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg" width="40" height="17" style="margin:0px 0px 0px 70px; cursor:pointer">
		      	</div>
              	  <input type="button" id='add' value="+添加课程" style="width:120px; margin-bottom:5px; margin-left: 0px;color:#000000"/>               
		      	
		      	<div class="table-responsive">
						<table class="table table-striped jambo_table bulk_action">
							<thead>
								<tr class="headings" style="background-color:#828282; padding-top: 0px;padding-bottom: 1px;">
									<th style="padding-top: 0px;padding-bottom: 0px">
									<input type="checkbox" id="123all" class="123" >
									</th>
									<th class="column-title">编号</th>
									<th class="column-title">课程名称</th>
									<th class="column-title">课程英文名称</th>
									<th class="column-title">课程分类</th>
									<th class="column-title">课程描述</th>
									<th class="column-title">容纳人数</th>
									<th class="bulk-actions" colspan="9"><a class="antoo"
										style="color:#fff; font-weight:500;">删除课表(<span
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
		$.post("fitness/curriculum/getcurriculumList.json", "pageIndex=" + pageIndex, showPersonalDrop, "JSON");
		function showPersonalDrop(date) {
			var curriculumList = date.curriculumList;
			for ( var i = 0; i < curriculumList.length; i++) {
			var common=curriculumList[i].comment.substr(0, 10)+".....";
				$(".infoList")
						.append(
								"<tr class='even pointer'>"
										+ "<td style='padding-top: 0px;padding-bottom: 0px'><input type='checkbox' aa='1' class='flat' name='table_records' value='"
										+ curriculumList[i].courseId + "'></td>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update'>"
										+ curriculumList[i].courseName + "</td>"
										+ "<td class='update'>"
										+ curriculumList[i].courseEnglish + "</td>"
										+ "<td class='update'>"
										+ curriculumList[i].curriculumType + "</td>"
										+ "<td class='update'>"
										+ common + "</td>"
										+ "<td class='update'>"
										+ curriculumList[i].count + "</td></tr>");

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
					var courseId = $(this).val();
					$.post("fitness/curriculum/deleteCurriculum.json", "courseId=" + courseId,
							deleteCurriculum, "JSON");
					function deleteCurriculum(data) {
					}
				});
		goFirst(goPageIndex);
		nodeletememcard();
	}
	
	//打开添加课程模态框
	$("#add").click(function(){
		$("#addCurriculum").modal("show");
	});
	
	//添加课程
	$("#saveCurriculum").click(function(){
		if($("input[name='courseName']").val()==""){
			$("#comment").text("");
			$("#count").text("");
			$("#courseName").text("请输入课程名称");
			return ;
		}
		if($("input[name='count']").val()=="" || isNaN($("input[name='count']").val())){
			$("#courseName").text("");
			$("#comment").text("");
			$("#count").text("请输入上课人数");
			return ;
		}
		if($("textarea").val()==""){
			$("#courseName").text("");
			$("#count").text("");
			$("#comment").text("请输入课程详细介绍");
			return ;
		}
		var formCurr=$("#curriculumInfo").serialize();
		$.post("fitness/curriculum/addCurriculum.json",  formCurr,
							addCurriculum, "JSON");
			function addCurriculum(data) {
				if(data>0){
					goFirst(goPageIndex);
				}
				$("#addCurriculum").modal("hide");
			}
			
		//清空表单
	   	$(":input","#curriculumInfo") 
		.not(":button, :submit, :reset, :hidden") 
		.val("") 
		.removeAttr("checked") 
		.removeAttr("selected");					
	});
	
	//打开修改课程信息窗口
	$(".infoList").on("click",".update", function(){
		var courseId=$(this).parent("tr").find(".flat").val();
		$.post("fitness/curriculum/getCurriculumInfo.json", "courseId=" + courseId,
							getCurriculumInfo, "JSON");
		function getCurriculumInfo(data) {
			$("#updateCurriculumInfo").find("input[name='courseName']").val(data.courseName);
			$("#updateCurriculumInfo").find("input[name='courseEnglish']").val(data.courseEnglish);
			$("#updateCurriculumInfo").find("input[name='count']").val(data.count);
			$("#updateCurriculumInfo").find("input[name='courseId']").val(courseId);
			$("#updateCurriculumInfo").find("textarea").val(data.comment);
	    }
	    $("#updateCurriculum").modal("show");
	}); 
	
	//修改课程
	$("#updateCurrInfo").click(function(){
			var formCurr=$("#updateCurriculumInfo").serialize();
			$.post("fitness/curriculum/updateCurriculumInfo.json",  formCurr,
							addCurriculum, "JSON");
			function addCurriculum(data) {
				if(data>0){
					goFirst(goPageIndex);
				}
				$("#updateCurriculum").modal("hide");
			}	
	});
	
	
	
</script>
</html>
