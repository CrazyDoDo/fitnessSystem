/*用于定位当前页码*/
	var goPageIndex = 1;
	//初始化会员信息
	function nextPages(pageIndex) {
		$(".pagination").html("");
		var employeesId=$("#employeesId").val();
		var emplName = $("#emplName").val();
		$(".memcard").html("");
		$.post("fitness/customerController/getXiaoShouEmpl.json", "pageIndex=" + pageIndex + "&employeesId="
				+ employeesId+"&emplName="+emplName, showXiaoShouInfo, "JSON");
		function showXiaoShouInfo(date) {
			var emplyeesList = date.employeesList;
			for ( var i = 0; i < emplyeesList.length; i++) {
				$(".memcard")
						.append(
								"<tr class='even pointer' name='fitness/customerController/goGeRenxiaoshou?employeesName="
										+ emplyeesList[i].name+ "'>"
										+ "<td class='update'>"
										+ (i+1)+ "</td>"
										+ "<td class='update'>"
										+ emplyeesList[i].employeesId + "</td>"
										+ "<td class='update'>"
										+ emplyeesList[i].name + "</td>"
										+ "<td class='update'>"
										+ emplyeesList[i].typeName + "</td>"
										+ "<td class='update'>"
										+ emplyeesList[i].phone + "</td>"
										+ "<td class='update'>"
										+ emplyeesList[i].sum + "</td></tr>");

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
	//点击跳转员工销售详情
	$(".update").live("click",function(e){
						var title = "个人销售详情";
						var url = $(this).parent().attr("name");
						var content = "<div title='个人销售详情' data-options='closable:true'  class='basic-info'>"
								+ "<iframe class='page-iframe' src='"
								+ url
								+ "' frameborder='no'   border='no' height='480px' width='100%' scrolling='auto'></iframe></div>";
						// 使用 'exists' 方法来判断 tab 是否已经存在，如果已存在则激活 tab。如果不存在则调用 'add'
						// 方法来添加一个新的 tab 面板
						function addTab(title) {
							if ($(".easyui-tabs1").tabs("exists", title)) {
								$(".easyui-tabs1").tabs("close", title);
								$(".easyui-tabs1").tabs("add", {
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
							;
						}
						addTab(title);
	});	

	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize(); 