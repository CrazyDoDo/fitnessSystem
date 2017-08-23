	$(function() {
		//提交客户信息	
		$("#tijiao").click(function() {
        var address=$("#province").val()+$("#city").val()+$("#detailed").val();
		var name=$("input[name='custName']").val();
		var phone=$("input[name='phone']").val();
		if(name ==""){
        		$.MsgBox.Alert("消息", "请输入客户姓名"); 
        		return ;
        }else if(phone ==""){
        		$.MsgBox.Alert("消息", "请输入手机号"); 
        		return ;       		
        }else if(isNaN(phone)==true){
        		$.MsgBox.Alert("消息", "手机号全部由数字组成"); 
        		return ;          		
        }		
			var form = $("#formInfo").serialize();
			$.post("cusomerAdd","address="+address+"&"+ form, addCustomer);
			function addCustomer(data) {
				if (data.retu == "true") {
				$.MsgBox.Alert("消息", "登记成功");
					$("#formInfo").form("clear");//添加后清除表单内容
				}else {
				$.MsgBox.Alert("消息", "登记失败,请联系管理员");
				}
			}		
		});
	});
	//为提交按钮设置悬浮和离开背景色
	   $("#tijiao").hover(function() {
					$(this).css("background-color", "#CCC");
				}, function() {
					$(this).css("background-color", "#E9E9E9");
				});
	//为取消按钮设置悬浮和离开背景色			
	   $("#quxiao").hover(function() {
					$(this).css("background-color", "#CCC");
				}, function() {
					$(this).css("background-color", "#E9E9E9");
				});	

	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();