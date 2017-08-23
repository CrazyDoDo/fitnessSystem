$(document).ready(function(e) {
		var path="";
        $(".input").hover(function(e) {//按钮悬浮背景变色
            $(this).css({ color: "#FFF", background: "#CCC"});
        },function(){
			$(this).css({ color: "#000", background: "#EFEFEF"});
			});
        //加载初始化信息
        function loademployees(){
        	$.post("../membrse/getXiaoshouList.json",loadeSalesInfo,"JSON");
        	function loadeSalesInfo(date){
        		for ( var  i= 0; i < date.length; i++) {
        			$("#sales").append("<option value='"+date[i].employeesId+"'>"+date[i].name+"</option>");
        		}
        	}
     	        
        }
        loademployees();  
    });
    
       $("#tijiao").click(function(){
        	var form=$("#jvForm").serialize();
        	var phone=/^[1][358][0-9]{9}/;
        	if($("input[name='name']").val()==""){
        		$.MsgBox.Alert("消息", "请输入客户姓名"); 
        		return ;
        	}else if($("input[name='phone']").val()==""){
        		$.MsgBox.Alert("消息", "请输入手机号"); 
        		return ;       		
        	}else if(isNaN($("input[name='phone']").val())==true ||! phone.test($("input[name='phone']").val())){
        		$.MsgBox.Alert("消息", "手机号格式不正确"); 
        		return ;          		
        	}
        	$.post("updateCustomerInfo.json",form,submitForm,"JSON");
             	function submitForm(data){
        		if(data!="0"){
        		$.MsgBox.Alert("消息", "修改成功"); 
        		
        		}else{
        		
        		$.MsgBox.Alert("消息", "修改失败,请联系管理员"); 
        		}
        	} 
        	
       });   
       
   	$('.easyui-tabs1').tabs({
		tabHeight : 36
	});
	$(window).resize(function() {
		$('.easyui-tabs1').tabs("resize");
	}).resize();