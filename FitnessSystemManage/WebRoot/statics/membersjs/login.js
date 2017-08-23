	$(function(){
    //点击换验证码
    $("#changeCode").click(function(){
        $("#safeCode").attr("src","Number.jsp?id="+Math.random());
    });	

	});
		function login(){
			var user=$("#user").serialize();
			$.post("login",user,checklogin,"JSON");
			//登陆回调函数
			function checklogin(date){
				if(date.result=="error1"){
						$("input[name='check']").val("");
					    $("#error").text("验证码不正确");
				}else{
				    if(date.result=="error2"){
						$("#error").text("用户名或密码不正确");
					}else{
						location.href="main";
						//window.open('main.jsp','','toolbar=0,menubar=0,status=0,titebar=0,fullscreen=yes',"location=0");
					}
				}
		 }
		}