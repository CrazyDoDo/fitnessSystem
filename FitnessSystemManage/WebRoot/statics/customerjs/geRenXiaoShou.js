/*用于定位当前页码*/
	var goPageIndex = 1;
	//初始化会员信息
	function nextPages(pageIndex) {
		$(".pagination").html("");
		var emplName=$("#employeesName").val();
		var custName = $("#custName").val();
		var date1 = "";
		var date2 ="";
		$(".memcard").html("");
		$.post("fitness/customerController/getCustomerList.json", "pageIndex=" + pageIndex + "&custName="
				+ custName+"&date1="+date1+"&date2="+date2+"&emplName="+emplName, showCustomer, "JSON");
		function showCustomer(date) {
			var customerList = date.customerList;
			for ( var i = 0; i < customerList.length; i++) {
				$(".memcard")
						.append(
								"<tr class='even pointer' >"
										+ "<td >"
										+ (i+1)+ "</td>"
										+ "<td>"
										+ customerList[i].custName + "</td>"
										+ "<td>"
										+ customerList[i].sex + "</td>"
										+ "<td>"
										+ customerList[i].phone + "</td>"
										+ "<td>"
										+ customerList[i].startDate + "</td>"
										+ "<td>"
										+ customerList[i].state + "</td>"
										+ "<td>"
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