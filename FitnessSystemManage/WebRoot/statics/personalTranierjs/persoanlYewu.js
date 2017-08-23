	//搜索会员信息
	$("#select").click(
			function() {
				var membersId = $("#membersId").val();
				if (!isNaN(membersId)) {
					$.post("fitness/personal/getMembersInfo", "membersId="
							+ membersId, selectMemId, "JSON");
					//搜索会员信息的回调函数
					function selectMemId(date) {
						if (date== null || date == "") {
						    $.MsgBox.Alert("消息","不存在该会员");
						} else {
							$("input[name='name']").val(date.name);
							$("input[name='phone']").val(date.phone);
							
						}
					}
				}
			});
	
	//教练收费标准
	$("#personalId").change(function() {
			var personalId = $("#personalId").val();
			var membersId=$("#membersId").val();
			$.post("fitness/personal/getPersonalTraniingInfo.json","personalId="+personalId+"&membersId="+membersId,showMessage,"JSON");
			function showMessage(data){
				if(data==null)
					$("#sumHour").val(0);
				else	
				$("#sumHour").val(data.remainHour);
			}
	});
	
	//预约私教订单
	$("#tijiao")
			.click(
					function() {
						var date = $("#date").val();
						var personalId = $("#personalId").val();
						var fromDrop=$("#formDrop").serialize();
						if (personalId == 0 || date == null) {
							$.MsgBox.Alert("消息","请选择教练,和上课时间");
						}else if($("#sumHour").val()==0)
							$.MsgBox.Alert("消息","该教练的课时已上完,请续课");
						 else {
							$.MsgBox.Confirm("消息","预约时间为" + date + "日,是否提交订单",addPersonalDrop);
							function addPersonalDrop(){ 
								$.post("fitness/personal/addPersonalDrop.json",fromDrop,tijiao);
								function tijiao(data) {
									if (data == 1) {
									$.MsgBox.Alert("消息","预约成功");
									} else {
									$.MsgBox.Alert("消息","预约失败");
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