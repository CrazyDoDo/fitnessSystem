
	        //加载所有销售人员
	        function loademployees(){
	        	$.post("fitness/membrse/getXiaoshouList.json",loadeSalesInfo,"JSON");
	        	function loadeSalesInfo(date){
	        		for ( var  i= 0; i < date.length; i++) {
	        			$("#sales").append("<option value='"+date[i].employeesId+"' emoney='"+date[i].name+"'>"+date[i].name+"</option>");
	        		}
	        	}
	     	        
	        }
		/*用于定位当前页码*/
			var goPageIndex = 1;
			//初始化会员信息
			function nextPages(pageIndex) {
				$(".pagination").html("");
				var emplName=$("#emplName").val();
				var custName = "";
				var date1 ="";
				var date2 ="";
				$(".memcard").html("");
				$.post("fitness/customerController/getCustomerList.json", "pageIndex=" + pageIndex + "&custName="
						+ custName+"&date1="+date1+"&date2="+date2+"&emplName="+emplName, showCustomer, "JSON");
				function showCustomer(date) {
					var customerList = date.customerList;
					for ( var i = 0; i < customerList.length; i++) {
						$(".memcard")
								.append(
										"<tr class='even pointer' name='fitness/customerController/updateCustomer?customerId="
												+ customerList[i].customerId
												+ "'>"
												+ "<td><input type='checkbox' aa='1' class='flat' name='table_records' value='"
										+ customerList[i].customerId + "'></td>"
												+ "<td class='update'>"
												+ (i+1)+ "</td>"
												+ "<td class='update'>"
												+ customerList[i].custName + "</td>"
												+ "<td class='update'>"
												+ customerList[i].sex + "</td>"
												+ "<td class='update'>"
												+ customerList[i].phone + "</td>"
												+ "<td class='update'>"
												+ customerList[i].startDate + "</td>"
												+ "<td class='update'>"
												+ customerList[i].state + "</td>"
												+ "<td class='update'>"
												+ customerList[i].emplName + "</td></tr>");
		
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
				loademployees();
			});
			// 去首页,下一页,上一页,末页
			function goFirst(pageIndex) {
				nextPages(pageIndex);
				goPageIndex = pageIndex;
			}
			//根据会员卡号搜索会员信息
			$("#select").click(function() {
				nextPages(1);
			});
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
				$(".flat").live("click", function() {
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
				if ($(".123").attr("checked")) {
					$(":checkbox").attr("checked", true);
					$(".flat").parent().parent().css("background-color", "#E6F9F7");
					$(".flat").attr("aa", 0);
				} else {
					$(":checkbox").attr("checked", false);
					$(".flat").parent().parent().css("background-color", "#FFF");
					$(".flat").attr("aa", 1);
				}
				titleUpdate();
			});
			
	//分配客户
	$("#fenpei").click(function() {
		var sum=$(".bulk_action input[name='table_records']:checkbox:checked").length;
		if(sum>0){
		var info = $("#sales").find("option:selected").attr("emoney");
		$.MsgBox.Confirm("提示", "是否分配给" + info, updateCustomer, nodeletememcard);
		}
	});
	function nodeletememcard() {
		$(":checkbox").attr("checked", false);
		$(".flat").parent().parent().css("background-color", "#FFF");
		$(".flat").attr("aa", 1);
		titleUpdate();
	}
	function updateCustomer() {
		var employeesId=$("#sales").val();
		$(".bulk_action input[name='table_records']:checkbox:checked").each(
				function() {
					var customerId = $(this).val();
					$.post("fitness/customerController/updateCustomerEmp.json", "customerId=" + customerId+"&employeesId="+employeesId,
							updateCustomerEmp, "JSON");
					function updateCustomerEmp(data) {
						if(data==0){
						$.MsgBox.Alert("消息","删除失败,请联系管理员");
						}
					}
				});
		nodeletememcard();
		//设置延迟加载,若不设置无法得到实时更新的数据
		setTimeout(function(){goFirst(goPageIndex);},100);
	}	

	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();