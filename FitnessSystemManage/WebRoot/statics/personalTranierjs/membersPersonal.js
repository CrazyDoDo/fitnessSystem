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
								$.post("fitness/personal/addPersonalOrder.json",formOrder,tijiao);
								function tijiao(data) {
									if (data ==1) {
										$.MsgBox.Alert("消息", "购课成功");
									}else if(data==2){
										$.MsgBox.Confirm("消息", "已存在该订单,是否修改原有订单",againMessage);
											function againMessage(){
												$.post("fitness/personal/addPersonalOrder.json",formOrder+"&type=add ",add);
													function add(data){
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