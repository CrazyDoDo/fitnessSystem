/*用于定位当前页码*/
var goPageIndex=1;
	//初始化会员信息
function nextPages(pageIndex) {
			$(".pagination").html("");
			var membersId = $("#membersId").val();
			$(".memcard").html("");
			$.post("getMembersList", "pageIndex=" + pageIndex + "&membersId="
					+ membersId, showMembers, "JSON");
			function showMembers(date) {
				var membersList = date.membersList;
				for ( var i = 0; i < membersList.length; i++) {
					$(".memcard")
							.append(
									"<tr class='even pointer' name='goMembrseInfo?membersId="
									+ membersList[i].membersId
									+ "'>"
									+ "<td class='update'>"
									+ membersList[i].membersId
									+ "</td>" + "<td class='update'>"
									+ membersList[i].name + "</td>"
									+ "<td class='update'>"
									+ membersList[i].sex + "</td>"
									+ "<td class='update'>"
									+ membersList[i].memCardName
									+ "</td>" + "<td class='update'>"
									+ membersList[i].stratDate
									+ "</td>" + "<td class='update'>"
									+ membersList[i].stopDate + "</td>"
									+ "<td class='update'>"
									+ membersList[i].employeesName
									+ "</td>" + "<td class='update'>"
									+ membersList[i].coachName
									+ "</td>" + "<td class='update'>"
									+ membersList[i].state
									+ "</td></tr>");

				}
				// 给首页,下一页,上一页,末页赋值
				var index = 1;
				var page = date.page;
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
									+ (page.currentPageNo - 1)
									+ ")'>上一页</a></li>");
					Index = page.currentPageNo;
				}
				if (page.currentPageNo < page.totalPageCount) {
					$(".pagination").append(
							"<li class='paginate_button' id='datatable_previous'>"
									+ "<a  onclick='javascript:goFirst("
									+ (page.currentPageNo + 1)
									+ ")'>下一页</a></li>");
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
		goPageIndex=pageIndex;
	}
	//根据会员卡号搜索会员信息
	$("#select").click(function(){
		nextPages(1);
	});
		// 刷新会员列表
	$("#update").click(function() {
		goFirst(goPageIndex);
	});
	//点击跳转修改会员信息
	$(".update").live("click",function(e){
						var title = "会员详细信息";
						var url = $(this).parent().attr("name");
						var content = "<div title='修改会员信息' data-options='closable:true'  class='basic-info'>"
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