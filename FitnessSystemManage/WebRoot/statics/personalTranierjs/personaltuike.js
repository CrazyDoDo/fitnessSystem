
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
		
	//验证信息
	$("#tuike").blur(function(){
		if($("#tuike").val()>$("#shengyu").val()){
			alert("退课课时不能大于剩余课时");
			$("#tuike").val("");
		}
	});
	
	//计算总价
	$("#tuike").blur(function() {
		var price=$("#personal").find("option:selected").attr("name");
		var keshi=$("#tuike").val();
		$("#money").val(keshi*price);
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
						if (date.name == null || date.name == "") {
						    $.MsgBox.Alert("消息","不存在该会员");
						} else {
							$("#name").val(date.name);
							
						}
					}
				}
			});	
		
	//查看在该教练手上的剩余课时
	$("#personal").change(function(){
	 var membersId=$("#membersId").val();
	 var personalId=$("#personal").val();
		$.post("fitness/personal/getPersonalTraniingInfo.json","personalId="+personalId+"&membersId="+membersId,loadeCoachInfo,"JSON");
		        	function loadeCoachInfo(data){
					$("#shengyu").val(data.remainHour);
					$("#traniingId").val(data.trainingId);
        	}	 
	});	
	
	//修改私教订单
	$("#tijiao").click(function(){
	//判断是何种购课方式
		var formTuike=$("#formTuike").serialize();
		if($("#name").val()=="" || $("#tuike").val()==""){
			$.MsgBox.Alert("消息", "请将信息填写完整");
		}else{
				$.MsgBox.Confirm("消息","退课价格为"+$("#money").val()+"元,是否提交订单",showMessage)
				  function showMessage(){
					var memId=$("#code").val();
					var personalId=$("#personal").val();
					var comment=$("#comment").val();
					$.post("fitness/personal/addPersonalTuike.json", formTuike, tijiao);
					function tijiao(data) {
					if(data==1){
						$.MsgBox.Alert("消息","退课成功");
					}else{
						$.MsgBox.Alert("消息","退课失败");
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