<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>私教业务</title>
<link
	href="${pageContext.request.contextPath}/statics/css/membrseAddbase.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/statics/css2/easyui.css">
<link
	href="${pageContext.request.contextPath}/statics/css/membrsebasic.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/statics/css/My97DatePicker/skin/WdatePicker.css">
</head>
<body style="background-color:#FFF; color: #000000">
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="container">
		<div class="content">
			<div class="column">
				<span class="current">会员查询</span>
			</div>
			<form action="#" method="post" id="formOrder">
				会员卡号: <input type="text" name="membersId" id="membersId"
					style="width:200px;height:20px;line-height:25px; margin-bottom:10px; margin-right:15px;" />
				<input type="button" id="select" name="select" value="快速查询"
					style="padding-left:15px; background-color:#828282; color:#FFF;width:90px; height:28px;">
				<div id="dengji">
					<div class="column">
						<span class="current">私教购课</span>
					</div>
					<table class="kv-table">
						<tbody>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">会员姓名:</td>
								<td class="kv-content"><input type="text" size="40"
									id="name">
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">教练名称:</td>
								<td class="kv-content"><select id="personal"
									name="personalId"
									style=" width:289px; background-color:#EFEFEF">
										<option value="0">请选择</option>
										<c:forEach items="${personal}" var="item">
											<option name="${item.price}" value="${item.employeesId}">${item.name}</option>
										</c:forEach>
								</select>
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">收费标准:</td>
								<td class="kv-content"><input type="text" id="leverPrice"
									size="40" placeholder="(/小时)">
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">课类型:</td>
								<td class="kv-content"><select id="sele" name=traniingType 
									style=" width:289px; background-color:#EFEFEF">
										<option selected="selected">计时课</option>
								</select></td>
							</tr>
							<tr id="hiddent">
								<td class="kv-label"></td>
								<td class="kv-label">课时:</td>
								<td class="kv-content"><input type="text" size="40px"
									id="keshi" name="keshi" placeholder="(/小时)" />
								</td>
							</tr>
							<tr id="hiddent">
								<td class="kv-label"></td>
								<td class="kv-label">总价:</td>
								<td class="kv-content"><input type="text" size="40px"
									id="price" name="price" placeholder="(/元)" />
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label">备注:</td>
								<td class="kv-content"><textarea rows="3" id="comment"
										style="resize:none; width:289px;" name="comment"></textarea>
								</td>
							</tr>
							<tr>
								<td class="kv-label"></td>
								<td class="kv-label"></td>
								<td class="kv-content"><input class="input" type="button"
									id="tijiao" value="提交"
									style="margin-left:30px; margin-right:10px; width:100px; height:30px;">
									<input class="input" type="reset" value="取消"
									style=" width:100px; height:30px;"></td>
							</tr>
						</tbody>
					</table>
			</form>
		</div>
	</div>
	</div>
</body>
<script type="text/javascript">
	$(".input").hover(function(e) {//按钮悬浮背景变色
		$(this).css({
			color : "#FFF",
			background : "#CCC"
		});
	}, function() {
		$(this).css({
			color : "#000",
			background : "#EFEFEF"
		});
	});
	//教练收费标准
	$("#personal").change(function() {
		var price = $(this).find("option:selected").attr("name");
		$("#leverPrice").val(price);
	});
	//计算总价
	$("#keshi").blur(function() {
		var keshi = $("#keshi").val();
		var price = keshi * $("#leverPrice").val();
		$("#price").val(price);
	});

	//搜索会员信息
	$("#select").click(
			function() {
				var membersId = $("#membersId").val();
				if (!isNaN(membersId)) {
					$.post("fitness/personal/getMembersInfo", "membersId="
							+ membersId, selectMemId, "JSON");
					//搜索会员信息的回调函数
					function selectMemId(date) {
						if (date == null || date == "") {
							$.MsgBox.Alert("消息", "不存在该会员");
						}else{
							$("#name").val(date.name);

						}
					}
				}
			});

	//提交订单
	$("#tijiao")
			.click(
					function() {
						//判断是何种购课方式
						var keshi = $("#keshi").val();
						var price = keshi * $("#leverPrice").val();
						if ($("#name").val() == ""
								|| $("#personal").val() == ""
								|| $("#sele").val() == "") {
							$.MsgBox.Alert("消息", "请将信息填写完整");
						} else {
							$.MsgBox.Confirm("消息", "总价格为" + price + "元,是否提交订单",
									showMessage);
							function showMessage() {
								var formOrder=$("#formOrder").serialize();
								$.post("fitness/personal/addPersonalOrder.json",formOrder+"&type=1",tijiao);
									function tijiao(data) {
										if (data ==1) {
											$.MsgBox.Alert("消息", "购课成功");
										}else if(data==2){
											$.MsgBox.Confirm("消息", "已存在该订单,是否修改原有订单",againMessage);
												function againMessage(){
													$.post("fitness/personal/addPersonalOrder.json",formOrder+"&type=2",update);
														function update(data){
															if (data ==1) {
																$.MsgBox.Alert("消息", "购课成功");
															}else{
																$.MsgBox.Alert("消息", "购课失败,请联系管理员");
															}
														}
												}
										}else{
											$.MsgBox.Alert("消息", "购课失败,请联系管理员");
										}
									}
							}
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

