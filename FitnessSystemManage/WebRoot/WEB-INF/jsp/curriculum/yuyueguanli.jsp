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
<title>预约管理</title>
<link href="${pageContext.request.contextPath }/statics/css/base.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css2/easyui.css">
<link
	href="${pageContext.request.contextPath }/statics/css/curriculumBase.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css">
<style type="text/css">
.kv-content {
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="content">
			<div class="easyui-tabs1" style="width:100%;height:100%;">
				<div title="预约管理" data-options="closable:false" class="basic-info">
					<div class="column">
						<span class="current">预约管理</span> <img id="update"
							src="${pageContext.request.contextPath}/statics/images/shuxin2.jpg"
							width="40" height="17"
							style="margin:0px 0px 0px 70px; cursor:pointer">
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
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	//初始化会员信息
	function nextPages(state) {
		$("#infoList tr:gt(0)").remove();
		$.post("getYuyueCurriculumList.json", "state=" + state,
				showOrderCurriculum, "JSON");
		function showOrderCurriculum(data) {
			var sum = 1;//记录总共有几个时间段有课
			var date = data[0].stratdate;
			if (data[0].stratdate != null || data[0].stratdate != "") {
				var text1 = "<tr><td class='kv-content'>" + "团体教室 " + "</td>"
						+ "<td class='kv-content time'>" + data[0].stratdate
						+ "</td>";
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
								text[m - 1] = "<td class='kv-content text' id='"+data[j].orderCurrID+"' name='"+data[j].whatDay+"'><span name='"+data[j].courseId+"' class='courseId' style='color:#2476BF; font-size:14px; line-height:10px;'>"
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
						text[m] = "<td class='kv-content text'  name='"
								+ (m + 1)
								+ "'><span class='courseId' style='color:#2476BF; font-size:14px; line-height:10px;'>"
								+ "</span><br><br><span class='personal' style='color:#000;font-size:14px;'></span></td>";
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
					var text1 = "<tr><td class='kv-content'>" + "团体教室 "
							+ "</td>" + "<td class='kv-content time'>"
							+ data[i].stratdate + "</td>";
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
							text[m] = "<td class='kv-content text' name='"
									+ (m + 1)
									+ "'><span class='courseId' style='color:#2476BF; font-size:14px; line-height:10px;'>"
									+ "</span><br><br><span class='personal' style='color:#000;font-size:14px;'></span></td>";
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
		nextPages(2);
	});
	// 刷新课程信息
	$("#update").click(function() {
		nextPages(2);
	});

	//添加课程表
	$(".kv-content:gt(1)").live("click",function(e) {
					var common=$(this).find(".courseId").text();
					if(common!="" && common!=null){
						var orderId=$(this).attr("id");
						var title = "预约上课";
						var url = "goTianjiaCurriculum?orderId="+orderId;
						function addTab(title, url) {
							var content = "<div title='预约上课' data-options='closable:true'  class='basic-info'><div class='column'><span class='current'>添加课程表</span></div>"
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
					}	
					});

	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();
</script>
</html>
