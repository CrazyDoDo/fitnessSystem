$(document).ready(function(e) {
        //加载初始化信息
        function loademployees(){
        	$.post("getPersonalList.json",loadeCoachInfo,"JSON");
        	$.post("getXiaoshouList.json",loadeSalesInfo,"JSON");
        	$.post("getLastMembers.json",loadeMemIdInfo,"JSON");
        	$.post("getMembersCardList.json",loadeMemcardInfo,"JSON");
        	function loadeCoachInfo(date){
        		for ( var  i= 0; i < date.length; i++) {
					$("#coach").append("<option value='"+date[i].employeesId+"'>"+date[i].name+"</option>");
				}
        	}
        	function loadeSalesInfo(date){
        		for ( var  i= 0; i < date.length; i++) {
        			$("#sales").append("<option value='"+date[i].employeesId+"'>"+date[i].name+"</option>");
        		}
        	}
        	function loadeMemIdInfo(date){
        			var memId=date+1;
					$("input[name='membersId']").val(memId);
        	} 
        	function loadeMemcardInfo(date){
        		for ( var  i= 0; i < date.length; i++) {
        			$("#select").append("<option value='"+date[i].cardId+"' title='"+date[i].date+"'>"+date[i].cardName+"</option>");
        		}
        	}       	
        }
        loademployees();  
    });
$("#select").change(function(e){
var date2=$("#select").find("option:selected").attr("title");//获取选中的option的title值
showTime(date2);
});	

 
function showTime(day){ 
    var dayTime=day*24*60*60*1000; //参数天数的时间戳
    var nowTime=new Date().getTime(); //当天的时间戳
    var t = new Date(nowTime+dayTime).toLocaleDateString(); //把两个时间戳转换成普通时间
    $("#overDate").val(t);
}	
		var path="";
		//按钮悬浮背景变色
        $(".input").hover(function(e) {
            $(this).css({ color: "#FFF", background: "#CCC"});
        },function(){
			$(this).css({ color: "#000", background: "#EFEFEF"});
			});
		//添加图片	
		$("#file").blur(function(){
			uploadPic();
		});	
	    function uploadPic() {  
        // 上传设置  
        var options = {  
                // 规定把请求发送到那个URL  
                url: "uploadImage.html",  
                // 请求方式  
                type: "post",
                // 服务器响应的数据类型  
                dataType: "json",  
                // 请求成功时执行的回调函数  
                success: function(data, status, xhr) {  
                if(data.fileUploadError!=null && data.fileUploadError!=""){
					$("#error").html(data.fileUploadError);  
					$("input[name='image']").val("");  
					$("#image").attr("src","");            
                }else{
                    // 图片显示地址  
                    path=data;
                    $("input[name='image']").val(path);
                    $("#image").attr("src", "../../statics/images/guide/"+path); 
                    $("#error").html("");
                   }  
                }  
        };  
        $("#jvForm").ajaxSubmit(options); 
        } 
        $("#tijiao").click(function(){
        	var form=$("#jvForm").serialize();
        	var address1=$("#province").val();
        	var address2=$("#city").val();
        	var address3=$("#detailed").val();
        	if($("input[name='name']").val()==""){
        		$.MsgBox.Alert("消息", "请输入会员姓名"); 
        		return ;
        	}else if($("input[name='phone']").val()==""){
        		$.MsgBox.Alert("消息", "请输入手机号"); 
        		return ;       		
        	}else if(isNaN($("input[name='phone']").val())==true){
        		$.MsgBox.Alert("消息", "手机号全部由数字组成"); 
        		return ;          		
        	}
        	else if($("input[name='image']").val()==""){
        		$.MsgBox.Alert("消息", "请采集会员照片"); 
        		return ;         		
        	};
        	/* $.getJSON("addMembers.json",form, submitForm); */
        	$.post("addMembers.html","address1="+address1+"&address2="+address2+"&address3="+address3+"&"+form,submitForm,"JSON");
             	function submitForm(data){
        		if(data.delResult=="true"){
        			alert("开卡成功");
        		}else{
        			alert("开卡失败,请联系管理员");
        		}
        	} 
        	
       }); 