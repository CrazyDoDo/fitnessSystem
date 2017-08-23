		$(document).ready(function(e) {
	        $(".input").hover(function(e) {//按钮悬浮背景变色
	            $(this).css({ color: "#FFF", background: "#0F52DD"});
	        },function(){
				$(this).css({ color: "#000", background: "#EFEFEF"});
			});
			
			$("#selectId").click(function(e) {
				var memId=$("#membrseId").val();
				if(!isNaN(memId)){
        		$.post("fitness/memInfoSelect","membersId="+memId,selectMemId,"JSON");
        		//搜索会员信息的回调函数
        		function selectMemId(date){
        			if(date=="isAjax"){
        				//window.open("403.jsp");
        				//刷新父窗体
        				window.parent.location.href="403.jsp";	
        				return;
        			}
        			else if(date==null){
						alert("不存在该会员");
						return ;
				    }
					else{
					$("#state").val(date.state);
        			$("input[name='name']").val(date.name);
        			$("#showSex").val(date.sex);
        			$("input[name='birthday']").val(date.birthday);
        			$("input[name='phone']").val(date.phone);
        			$("input[name='ID']").val(date.iD);
        			$("input[name='weChat']").val(date.weChat);
        			$("input[name='address']").val(date.address);
        			$("input[name='email']").val(date.email);
        			$("input[name='professional']").val(date.professional);
        			$("#image").attr("src","statics/images/guide/"+date.image);	
         		
				   }
        		}
        		$.post("fitness/swipingInfoSelect","membersId="+memId,showMem,"JSON");			
        		
        		//展示会员刷卡记录
        		function showMem(date){
        			var sum=date[0].memsum+1;//记录累计刷卡次数
        			$("#showmemInfo tr:gt(0)").remove();
        			for ( var i = 0; i < date.length; i++) {
						$("#showmemInfo").append("<tr>"+
							"<td class='content'>"+date[i].membersId+"</td>"+
							"<td class='content'>"+date[i].membersName+"</td>"+
							"<td class='content'>"+date[i].stratDate+"</td>"+
							"<td class='content'>"+(sum--)+"</td>"+
							"<td class='content'>"+date[i].employeesName+"</td>"+                         
						"</tr>");
						
					}
        		} 
        	}else{
				alert("请输入正确的会员卡号");
			}	
    		});
	    });