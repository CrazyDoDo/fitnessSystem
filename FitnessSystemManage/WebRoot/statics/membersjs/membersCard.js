	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();
	var Index=0;//定位所在页面
		//加载会员卡信息
		function showCardInfo(){
			$(".memcard").html("");
			$.post("getMembersCardList","pageIndex=1", showCard,"JSON");
			//显示会员卡信息回调函数
			function showCard(date){
			 var membersCardList=date.membersCardList;
				for ( var i = 0; i < membersCardList.length; i++) {
								$(".memcard").append(
							"<tr class='even pointer' name='membrseCadUpdate?cardId="
									+ membersCardList[i].cardId + "'>"
									+"<td><input type='checkbox' aa='1' class='flat' name='table_records' value='"+membersCardList[i].cardId+"'></td>"
									+ "<td class='update'>"
									+ membersCardList[i].cardName + "</td>"
									+ "<td class='update'>" + membersCardList[i].type
									+ "</td>" + "<td class='update'>"
									+ membersCardList[i].date + "</td>"
									+ "<td class='update'>" + membersCardList[i].price
									+ "</td>" + "<td class='update'>"
									+ membersCardList[i].discount + "</td>"
									+ "<td class='update'>"
									+ membersCardList[i].remark + "</td></tr>");
				
				
				}
				//给首页,下一页,上一页,末页赋值
				var index = 1;
				var page=date.page;
				$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  aria-controls='datatable' data-dt-idx='0' tabindex='0'>"+
						"总页数[" + page.currentPageNo + "/" + page.totalPageCount
								+ "]</a></li>");
				if (page.currentPageNo > 1) {
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a onclick='javascript:goFirst(1)' tabindex='0'>首页</a></li>");
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  onclick='javascript:goFirst("+ (page.currentPageNo - 1) + ")'>上一页</a></li>");	
				     Index=page.currentPageNo;				
				}
				if (page.currentPageNo < page.totalPageCount) {
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  onclick='javascript:goFirst("+ (page.currentPageNo + 1) + ")'>下一页</a></li>");					
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  onclick='javascript:goFirst("+ page.totalPageCount+ ")'>尾页</a></li>");	
				     Index=page.currentPageNo;					
				};
				
			}
		}
	//去首页,下一页,上一页,末页
	function goFirst(pageIndex) {
		$(".pagination").html("");
		$(".memcard").html("");
		$.ajax({
			url : "getMembersCardList",
			data : "pageIndex=" + pageIndex,
			dataType : "json",
			success : function(date) {
			 var membersCardList=date.membersCardList;
				for ( var i = 0; i < membersCardList.length; i++) {
								$(".memcard").append(
							"<tr class='even pointer' name='membrseCadUpdate?cardId="
									+ membersCardList[i].cardId + "'>"
									+"<td><input type='checkbox' aa='1' class='flat' name='table_records' value='"+membersCardList[i].cardId+"'></td>"
									+ "<td class='update'>"
									+ membersCardList[i].cardName + "</td>"
									+ "<td class='update'>" + membersCardList[i].type
									+ "</td>" + "<td class='update'>"
									+ membersCardList[i].date + "</td>"
									+ "<td class='update'>" + membersCardList[i].price
									+ "</td>" + "<td class='update'>"
									+ membersCardList[i].discount + "</td>"
									+ "<td class='update'>"
									+ membersCardList[i].remark + "</td></tr>");
				
				
				}
				//给首页,下一页,上一页,末页赋值
				var index = 1;
				var page=date.page;
				$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  aria-controls='datatable' data-dt-idx='0' tabindex='0'>"+
						"总页数[" + page.currentPageNo + "/" + page.totalPageCount
								+ "]</a></li>");
				if (page.currentPageNo > 1) {
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a onclick='javascript:goFirst(1)' tabindex='0'>首页</a></li>");
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  onclick='javascript:goFirst("+ (page.currentPageNo - 1) + ")'>上一页</a></li>");	
				     Index=page.currentPageNo;				
				}
				if (page.currentPageNo < page.totalPageCount) {
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  onclick='javascript:goFirst("+ (page.currentPageNo + 1) + ")'>下一页</a></li>");					
					$(".pagination").append(
				     "<li class='paginate_button' id='datatable_previous'>"+
				     "<a  onclick='javascript:goFirst("+ page.totalPageCount+ ")'>尾页</a></li>");
				     Index=page.currentPageNo;						
				};
			},
			error : function() {
				alert("发生错误,请联系管理员!");
			}

		});
	}		
	
	function titleUpdate(){
	var e=$(".bulk_action input[name='table_records']:checked").length;
		 if(e>0){
		  $(".column-title").hide(),$(".bulk-actions").show(),$(".action-cnt").html(e+" 条数据 ");
		 }else{
		 $(".column-title").show();
		 $(".bulk-actions").hide();
		 }
	}
		//选中变色,改变标题
		$(".flat").live("click",function(){
			titleUpdate();
		 if($(this).attr("aa")==1){
		 	$(this).parent().parent().css("background-color","#E6F9F7");
		 	$(this).attr("aa",0);
		 }else{
		 	$(this).parent().parent().css("background-color","#FFF");
		 	$(this).attr("aa",1);
		 }
		});
		
		//全选和取消全选
		$(".123").click(function(){
		    if ($(".123").attr("checked")) {  
		        $(":checkbox").attr("checked", true);  
		        $(".flat").parent().parent().css("background-color","#E6F9F7");
		         $(".flat").attr("aa",0);
		    } else {  
		        $(":checkbox").attr("checked", false);  
		        $(".flat").parent().parent().css("background-color","#FFF");
		         $(".flat").attr("aa",1);
		    } 
		    titleUpdate(); 
		})
		
		//刷新会员卡列表
		$("#update").click(
				function(){
						goFirst(Index);
				});
				
	//删除会员卡信息
	$(".antoo").click(function(){
		var info=$(this).find("span").text();
		if(confirm("是否删除这"+info)){
		$(".bulk_action input[name='table_records']:checkbox:checked").each(function(){
			var cardId=$(this).val();
			$.post("deleteMembersCard.html","cardId="+cardId,deleteMembersCard,"JSON");
			function deleteMembersCard(data){
				goFirst(Index);
			}
		});
		}else{
	        $(":checkbox").attr("checked", false);  
	        $(".flat").parent().parent().css("background-color","#FFF");
	         $(".flat").attr("aa",1);
		}
			
	});			
				
	$(document).live("ready",function(){
		showCardInfo();
	});			
	//编辑会员卡
	$(".update").live("click",
					function(e) {
						var title = "编辑会员卡";
						var url = $(this).parent().attr("name");
						function addTab(title, url) {
							var content = "<div title='编辑会员卡' data-options='closable:true'  class='basic-info'><div class='column'><span class='current'>修改会员卡信息</span></div>"
									+ "<iframe class='page-iframe' src='"
									+ url
									+ "'frameborder='no'   border='no' height='480px' width='100%' scrolling='auto'></iframe></div>";
							if ($('.easyui-tabs1').tabs('exists', title)) {
								$(".easyui-tabs1").tabs("close", title);
								$('.easyui-tabs1').tabs('add', {
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
						}
						addTab(title, url);
					});