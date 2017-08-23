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
<title>预发布课表</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link
	href="${pageContext.request.contextPath }/statics/css/curriculumtianjia.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css">
<style type="text/css">
.button1 {
	color: #FFF;
	background-color: #666;
	text-align: right;
	float: right;
	font-size: 16px;
}

.button2 {
	color: #FFF;
	background-color: #666;
	text-align: right;
	float: right;
	margin-left: 5px;
	margin-right: 15px;
	font-size: 16px;
}

.button2,.button1 {
	cursor: pointer;
}

.kv-content {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../common/ModalDialog.jsp"></jsp:include>
	<div class="container" style="width: 100% ;padding-left:0px">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="预发布课表" data-options="closable:false" class="basic-info">

					<div class="column">
						<span class="current">预发布课表</span> <img id="update"
							src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg"
							width="40" height="17"
							style="margin:0px 0px 0px 70px; cursor:pointer">
							 <span class="button1" name="tianjiakecheng.jsp">+&nbsp;添加课程表</span>
					</div>
					<table class="kv-table">
						<tbody id="infoList">
							<tr>
								<td class="kv-label">课程类型</td>
								<td class="kv-label">上课时间</td>
								<td class="kv-label">星期一</td>
								<td class="kv-label">星期二</td>
								<td class="kv-label">星期三</td>
								<td class="kv-label">星期四</td>
								<td class="kv-label">星期五</td>
								<td class="kv-label">星期六</td>
								<td class="kv-label">星期日</td>
							</tr>
						</tbody>
					</table>
					<input type="submit" name='submit' id="submit" value="更新课表"
						style="width:100px; margin:10px 10px 0px 550px;" />
				</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
	//初始化会员信息
	function nextPages() {
		$("#infoList tr:gt(0)").remove();
		$.post("fitness/curriculum/getYuyueCurriculumList.json", "state=3", showOrderCurriculum,
				"JSON");
		function showOrderCurriculum(data) {
			var sum = 1;//记录总共有几个时间段有课
			var date = data[0].stratdate;
			if (data[0].stratdate != null || data[0].stratdate != "") {
				var text1 = "<tr><td class='kv-content'>"
						+ "团体教室 " + "</td>" + "<td class='kv-content time'>"
						+ data[0].stratdate + "</td>";
				//使用数组存入上课信息,设置七天的数组长度,分别存入对应天数的信息;					
				var text = [];
				text.push("");
				text.push("");
				text.push("");
				text.push("");
				text.push("");
				text.push("");
				text.push("");
				for ( var j = 0; j < data.length; j++) {
					if (data[0].stratdate == data[j].stratdate) {
						for ( var m = 1; m < 8; m++) {
							if (m == data[j].whatDay) {
								text[m - 1] = "<td  class='kv-content text' id='"+data[j].orderCurrID+"' name='"+data[j].whatDay+"'><span name='"+data[j].courseId+"' class='courseId' style='color:#2476BF; font-size:14px; line-height:10px;'>"
										+ data[j].courseName
										+ "</span><br><br><span name='"+data[j].personalId+"' class='personal' style='color:#000;font-size:14px;'>"
										+ data[j].personalName + "</span></td>";
								break;
							}
						}
					}
				}
				var text2 = "";
				for ( var m = 0; m < 7; m++) {
					if (text[m] == "" || text[m] == null) {
						text[m] = "<td class='kv-content text'  name='"+(m+1)+"'><span class='courseId' style='color:#2476BF; font-size:14px; line-height:10px;'>"+
									"</span><br><br><span class='personal' style='color:#000;font-size:14px;'></span></td>";
					}
					text2 += text[m];
				}

				var text3 = text1 + text2 + "</tr>";//拼接字符串,append到表单中;							
				$("#infoList").append(text3);
				text1 = "";
				text2 = "";
				text3 = "";//将拼接的字符串清空;

			}
			for ( var i = 0; i < data.length; i++) {
				if (date == data[i].stratdate) {
					sum = sum;
				} else {
					date = data[i].stratdate;
					sum++;
					var text1 = "<tr><td class='kv-content'>"+ "团体教室 "+ "</td>"
								+ "<td class='kv-content time'>"+ data[i].stratdate + "</td>";
					//使用数组存入上课信息,设置七天的数组长度,分别存入对应天数的信息;					
					var text = [];
					text.push("");
					text.push("");
					text.push("");
					text.push("");
					text.push("");
					text.push("");
					text.push("");
					for ( var j = 0; j < data.length; j++) {
						if (data[i].stratdate == data[j].stratdate) {
							for ( var m = 1; m < 8; m++) {
								if (m == data[j].whatDay) {
									text[m - 1] = "<td class='kv-content text' id='"+data[j].orderCurrID+"' name='"+data[j].whatDay+"'><span name='"+data[j].courseId+"' class='courseId' style='color:#2476BF; font-size:14px; line-height:10px;'>"
											+ data[j].courseName
											+ "</span><br><br><span name='"+data[j].personalId+"' class='personal' style='color:#000;font-size:14px;'>"
											+ data[j].personalName
											+ "</span></td>";
									break;
								}
							}
						}
					}
					var text2 = "";
					for ( var m = 0; m < 7; m++) {
						if (text[m] == "" || text[m] == null) {
						text[m] = "<td class='kv-content text' name='"+(m+1)+"'><span class='courseId' style='color:#2476BF; font-size:14px; line-height:10px;'>"+
									"</span><br><br><span class='personal' style='color:#000;font-size:14px;'></span></td>";
						}
						text2 += text[m];
					}

					var text3 = text1 + text2 + "</tr>";//拼接字符串,append到表单中;							
					$("#infoList").append(text3);
					text1 = "";
					text2 = "";
					text3 = "";//将拼接的字符串清空;

				}
			}

		}
	}
	//初始化课程信息
	$(function() {
		nextPages();
	});
	// 刷新课程信息
	$("#update").click(function() {
		nextPages();
	});
	
	var $clickTime;
	//对上课时间进行修改或保存
	$("#infoList").on
		("click",".time",function(e){
			var time=$(this).text();
				$clickTime=$(this);
			if(time=="" || time==null){
				 $("#addTime").modal("show");
			}else{
				 $("#updateDate1").val(time.substr(0, 5));
				 $("#updateDate2").val(time.substr(6, 5));
				 $("#updateTime").modal("show");
			}
	});
	
	//添加新的课程表
	$(".button1").click(function(){
		var common="<tr><td class='kv-content'>"+ "团体教室 "+ "</td>"
					+ "<td class='kv-content time'>00:00-00:00</td>";
		var text="";			
		for ( var m = 0; m < 7; m++) {
			text+= "<td class='kv-content text' name='"+(m+1)+"'><span class='curriculum' style='color:#2476BF; font-size:14px; line-height:10px;'>"+
					  "</span><br><br><span class='personal' style='color:#000;font-size:14px;'></span></td>";
		}
			common += text+"</tr>";
		$("#infoList").append(common);
	});

	var $clickcommon;
	//对上课内容进行修改或保存
	 $(".kv-table").on
		("click",".text",function(e){
			 $clickcommon=$(this);
			var common=$(this).text();
			if(common=="" || common==null){
				$("#addCurriculum").modal("show");
			}else{	
				var courseId=$(this).children(".courseId").attr("name");
				$("#updateCurr option[value='"+courseId+"']").attr("selected",true);
				$("#updatepersonalName").val($(this).children(".personal").text());
				$("#updateCurriculum").modal("show");
			
			}	 
			 
			
	}); 
	//修改上课时间段
	$("#updateDate").click(function(){
		//获取修改后的时间,time1为上课时间 time2为结束时间
		var time1=$("#updateDate1").val()+"-"+$("#updateDate2").val();
		 var orderId=[];
		 $clickTime.parent("tr").find("td:gt(1)").each(function(){
		 	if($(this).text()!="")
		 		orderId.push($(this).attr("id"));
		 	});
		//ajax进行局部刷新
		$.post("fitness/curriculum/updateOrderCurrTime.json","orderIds="+orderId+"&stratdate="+time1, updateOrderCurrTime,"JSON"); 
			function updateOrderCurrTime (data){
				$clickTime.text(time1);	
				$("#updateTime").modal("hide");	
			}
	});
	
		
	//添加上课时间段
	$("#addDate").click(function(){
		//获取新添加后的时间,time1为上课时间 time2为结束时间
		var time1=$("#addDate1").val()+"-"+$("#addDate2").val();
		$clickTime.text(time1);
		$("#addTime").modal("hide");		
	});
	
	//添加课程的选项改变后教练姓名随之改变
	$("#addCurr").change(function(){
		var courseId=$(this).val();
		$.post("fitness/curriculum/getPersonalCurr.json", "courseId="+courseId, getPersonalCurr,"JSON");
		function getPersonalCurr(data){
			$("#addPersonalName").val(data.personalName);
			$("#addPersonalName").attr("name",data.personalId);
		}
		if(courseId==0)
			$("#addPersonalName").val("");
	});
	
	//修改课程的选项改变后教练姓名随之改变
	$("#updateCurr").change(function(){
		var courseId=$(this).val();
		$.post("fitness/curriculum/getPersonalCurr.json", "courseId="+courseId, getPersonalCurr,"JSON");
		function getPersonalCurr(data){
			$("#updatepersonalName").val(data.personalName);
			$("#updatepersonalName").attr("name",data.personalId);
		}
		if(courseId==0)
			$("#updatepersonalName").val("");
	});
	
	
	//修改课程
	$("#updateCommon").click(function(){
		var courseId=$("#updateCurr").val();
		var personalId=$("#updatepersonalName").attr("name");
		var orderId=$clickcommon.attr("id");
		$.post("fitness/curriculum/updateOrderPersonal.json", "courseId="+courseId+"&personalId="+personalId+"&orderId="+orderId, updateOrderPersonal,"JSON");
		function updateOrderPersonal(data){
			$clickcommon.find(".courseId").text($("#updateCurr option:selected").text());
			$clickcommon.find(".personal").text($("#updatepersonalName").val());
			$("#updateCurriculum").modal("hide");	
		}
	});
	
	//添加课程
	$("#addCommon").click(function(){
		var courseId=$("#addCurr").val();
		var personalId=$("#addPersonalName").attr("name");
		var whatDay=$clickcommon.attr("name");
		var strtaDate=$clickcommon.siblings(".time").text();
		$.post("fitness/curriculum/addOrderPersonal.json", "courseId="+courseId+"&personalId="+personalId+"&whatDay="+whatDay+"&strtaDate="+strtaDate, updateOrderPersonal,"JSON");
		function updateOrderPersonal(data){
			if(data>0)
				nextPages();
			$("#addCurriculum").modal("hide");	
		}	 
	});
	
	//删除课程
	$("#deleteCommon").click(function(){
		var orderId=$clickcommon.attr("id");
		$.post("fitness/curriculum/deleteOrderCurr.json", "orderId="+orderId, deleteOrderCurr,"JSON");
		function deleteOrderCurr(data){
			if(data>0)
				nextPages();
			$("#updateCurriculum").modal("hide");	
		}		
	});
	
	
	//更新课表
	$("#submit").click(function(){
		$.MsgBox.Confirm("消息","是否更新课表,一旦更新后不可修改",submitCurriculum);
		function submitCurriculum(){
			$.post("fitness/curriculum/updateCurriculum.json", updateCurriculum,"JSON");
				function updateCurriculum(data){
				if(data>0){
					$.MsgBox.Alert("消息","更新成功");
					nextPages();
				}	
				else
					$.MsgBox.Alert("消息","更新失败,请联系管理员");
						
				}
		}
	
	});
	
</script>
</html>
