$(document).ready(function(e) {
	
		$("#myaccound").hover(function(){
					$("#menu_1").css("display","block")},
				function(){
					$("#menu_1").css("display","none");
			})
		$("#menu_1").children().hover(function(){
					$(this).css("background-color","#CCC")},
				function(){
					$(this).css("background-color","#FFF");
			});	
    });
    //提交修改
   $("#tijiao").click(function(){
   		var formInfo=$("#formInfo").serialize();
   		var name= $("input[name='personalLever']").val();
   		var price= $("input[name='personalPrice']").val();
   		if(name=="" || price==""){
   			$.MsgBox.Alert("消息","请填写等级和价格");
   		}else{
   		
   		   			$.MsgBox.Confirm("消息","是否修改该等级",showmessage);
   					function showmessage(){
   			  $.post("updatePersonalLever.json", formInfo, updateLever,"JSON");
   			      function updateLever(data){
   			      		if(data==1){
   			      			$.MsgBox.Alert("消息","修改成功");
   			      		}else{
   			      			$.MsgBox.Alert("消息","修改失败,请联系管理员");
   			      		}
   			      }
   			}
   		}
   }); 

    