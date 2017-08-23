	//提交跟进信息
	$("#tijiao").click(function() {
		var form=$("#formInfo").serialize();
		var radio = $("input[name='state']:checked").val();
		var date2=$("input[name='date1']").val();
		if(radio==2){
			$.post("updatePersoanlDrop", form, tijiso);
			function tijiso(data) {
					if(data==1){
					$.MsgBox.Alert("提示","修改成功");
					}else{
					$.MsgBox.Alert("提示","操作失败,请联系管理员");
					}
			}		
		}
		else if(radio==3){
				 
 				$.post("updatePersoanlDrop", form, tijiso);
				function tijiso(data) {
 				if(data==1){
 						$.MsgBox.Alert("提示","删除成功");
 						
							$(':input','#formInfo')  
							 .not(':button, :submit, :reset, :hidden')  
							 .val('')  
							 .removeAttr('checked')  
							 .removeAttr('selected'); //清空表单
					}else{
						$.MsgBox.Alert("提示","操作失败,请联系管理员");
					}
			}	 
		}
	});

	$(document).ready(function(e) {
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
	});