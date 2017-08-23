<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String cardId = request.getParameter("cardId");
	request.setAttribute("cardId", cardId);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
.left {
	text-align: right;
	width: 100px;
	color: #666
}
input {
	height: 30px;
	margin-top: 5px;
}
textarea {
	margin-top: 5px;
	resize: none;
}
select {
	margin-top: 5px;
}

.div {;
	padding-left: 200px;
	width: 500px;
}

.reght {
	position: absolute;
	float: left;
	width: 100px;
	left: 1109px;
	top: 8px;
}
li {
	list-style: none;
	cursor: pointer;
}
</style>
<script src="../../statics/js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript">      
	$(document).ready(function(e) {
	$(".reght").hide();
	var aa="<%=request.getAttribute("cardId")%>";
				if (!isNaN(aa)) {
					loadCardInfo();
					$(".reght").show();
				}
				//加载会员卡信息
				function loadCardInfo() {
					$.post("membrseCadList", "cardId="
							+ aa, showCard, "JSON");
					function showCard(date) {
						$("input[name='cardName']").val(date.cardName);
						$("#select").val(date.type);
						$("input[name='cardId']").val(date.cardId);
						$("input[name='date']").val(date.date);
						$("input[name='price']").val(date.price);
						$("input[name='discount']").val(date.discount);
						$("#beizhu").val(date.remark);
					}
				}
				$("#myaccound").hover(function() {
					$("#menu_1").css("display", "block")
				}, function() {
					$("#menu_1").css("display", "none");
				});
				$("#menu_1").children().hover(function() {
					$(this).css("background-color", "#CCC")
				}, function() {
					$(this).css("background-color", "#FFF");
				});
				//添加会员卡或修改
				$("input[name='submit']").click(
						function() {
							var memcard = $("#form").serialize();
							if (!isNaN(aa)) {//执行修改会员卡信息
								$.post("updateMembersCard.html", memcard, updateCard,"JSON");
							} else {//执行添加会员卡信息
								$.post("addMembersCard.html", memcard, addCard,"JSON");
							}
							//修改会员卡回调函数
							function updateCard(date) {
								if (date == "true") {
									alert("修改成功");
								}
							}
							//添加会员卡回调函数
							function addCard(date) {
								if (date == "true") {
									alert("添加成功");
								}
							}
						});
				//删除会员卡		
				$("#deleteCard").click(function(){
						$.post("../memCardShowServlet",
									"action=delete&cardId="+aa , deleteCard);
						function deleteCard(date){
								if (date=="true") {
									alert("删除成功");
								}
							}			
				});		

			});
</script>
<body>
	<div class="div">
		<table>
			<form id="form">
					<input type="hidden" size="50px" name="cardId"/>
				<tr>
					<td class="left">卡片名称:</td>
					<td><input type="text" size="50px" name="cardName" placeholder="请输入会员卡名称"/>
					</td>
				</tr>
				<tr>
					<td class="left">卡类型:</td>
					<td><select id="select" name="type"
						style="width:319px; height:30px;">
							<option value="时效卡">时效卡</option>
							<option value="次数卡">频次卡</option>
					</select></td>
				</tr>
				<tr>
					<td class="left">有效时间:</td>
					<td><input type="text" size="50px" name="date"
						placeholder="单位(天)" />
					</td>
				</tr>
				<tr>
					<td class="left">售卡金额:</td>
					<td><input type="text" size="50px" name="price" placeholder="请输入价格"/>
					</td>
				</tr>
				<tr>
					<td class="left">折扣:</td>
					<td><input type="text" size="50px" name="discount" placeholder="请输入折扣"/>
					</td>
				</tr>
				<tr>
					<td class="left">备注:</td>
					<td><textarea id="beizhu" rows="3" cols="36" name="remark" placeholder="请输入备注"></textarea>
					</td>
				</tr>
		</table>
		<input type="button" name='submit' value="提交"
			style="width:100px; margin:10px 10px 0px 130px;" /> <input
			type="reset" value="取消" name="quxiao" style="width:100px;" />
		</form>
	</div>
</body>
</html>

