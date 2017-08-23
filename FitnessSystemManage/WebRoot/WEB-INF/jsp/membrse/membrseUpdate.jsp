<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String memcardId = request.getParameter("memcardId");
	request.setAttribute("memcardId", memcardId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>会员开卡</title> 
    <link href="${pageContext.request.contextPath }/statics/css/membrseAddbase.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/membrseAddbasic.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/My97DatePicker/skin/WdatePicker.css"> 
</head> 
<body>
	<div class="container">
		<div class="content">
              	<div class="column"><span class="current">会员卡类型</span></div>
                <form  id="jvForm"  method="get">
		      	<table class="kv-table">
					<tbody>
                    	<tr>
							<td class="kv-label">会员卡号:</td>
							<td class="kv-content"><input type="text" name="membersId" size="52" value="${members.membersId}"></td>
						</tr> 
					</tbody>
				</table>
               <div class="column"><span class="current">会员基本信息</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">会员状态:</td>
							<td class="kv-content"><input type="text" name="state" size="80" value="${members.state}"></td>
						</tr> 
						<tr>
							<td class="kv-label">姓名:</td>
							<td class="kv-content"><input type="text" name="name" size="55" value="${members.name}">
                            	<select style="width:160px;background:#f5f5f5" name="sex" id="showSex">
                            	<c:if test="${members.sex eq ('男')}">
                                	<option value="男" selected="selected">男</option>
                                    <option value="女">女</option>
                                </c:if>
                                <c:if test="${members.sex eq ('女')}">
                                	<option value="男" >男</option>
                                    <option value="女" selected="selected">女</option>
                                </c:if>                          
                                </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">生日:</td>
							<td class="kv-content"><input type="text" size="80" name="birthday" onClick="WdatePicker()" class="Wdate" style="background-color:#EFEFEF;" value="${members.birthday}" ></td>
						</tr>
						<tr>
							<td class="kv-label">手机:</td>
							<td class="kv-content"><input type="text" name="phone" size="80" value="${members.phone}"></td>
						</tr>                                                
						<tr>
							<td class="kv-label">身份证:</td>
							<td class="kv-content"><input type="text" name="ID" size="80" value="${members.iD}"></td>
						</tr>
						<tr>
							<td class="kv-label">微信:</td>
							<td class="kv-content"><input type="text" name="weChat" size="80" value="${members.weChat}"></td>
						</tr>                         
						<tr>
							<td class="kv-label">邮箱:</td>
							<td class="kv-content"><input type="text" name="email" size="80" value="${members.email}"></td>
						</tr> 
						<tr>
							<td class="kv-label">联系地址:</td>
							<td class="kv-content"><input type="text" name="address" size="80" value="${members.address}"></td>
						</tr> 
						<tr>
							<td class="kv-label">职业:</td>
							<td class="kv-content"><input type="text" name="professional" size="80" value="${members.professional}"></td>
						</tr>                                                  
					</tbody>
					
                <div class="tupian">
                	<img src="${pageContext.request.contextPath}/statics/images/guide/${members.image}" width="250px" height="250px" id="image">
                	<input type="file" id="file" name="images" value="${members.image}" style="width:250px"/>
                	<input type="hidden" value="${members.image}" name="image"><br/>
                	<span id="error" style="color:#FF0000"></span>            	
                </div>
				</table>

      		<div class="column"><span class="current">会员分配</span></div>
		      	<table class="kv-table">
					<tbody>
						<tr>
							<td class="kv-label">销售:</td>
							<td class="kv-content">
									<select style="width:250px;background:#f5f5f5" name="employeesId" id="sales">
									<option value="0">${members.employeesName}</option>
                                    </select>
                                    <span class="kv-label">私教:</span><select style="width:252px;background:#f5f5f5" name="coachId"  id="coach">
                                	<option value="0">${members.coachName}</option>
                                    </select>
                            </td>
						</tr>
						<tr>
							<td class="kv-label">会籍:</td>
							<td class="kv-content"><input type="text" name="coach" size="80"></td>
						</tr>                                                
						<tr>
							<td class="kv-label"></td>
							<td class="kv-content">
                              <input class="input" type="button" value="提交" id="tijiao" style="margin-left:150px; margin-right:10px; width:100px; height:30px;">
                             <input class="input" type="reset" value="取消"  style=" width:100px; height:30px;">
                            </td>
						</tr> 
					</tbody>
				</table>
                
		  </form>
		      </div>
	</div>
	
</body> 
</html>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/message.js"></script>    
	<script type="text/javascript" src="${pageContext.request.contextPath }/statics/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
		var path="";
        $(".input").hover(function(e) {//按钮悬浮背景变色
            $(this).css({ color: "#FFF", background: "#CCC"});
        },function(){
			$(this).css({ color: "#000", background: "#EFEFEF"});
			});
        //加载初始化信息
        function loademployees(){
        	var memId="<%=request.getAttribute("memcardId")%>";
        	$.post("getPersonalList.json",loadeCoachInfo,"JSON");
        	$.post("getXiaoshouList.json",loadeSalesInfo,"JSON");
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
     	        
        }
        loademployees();  
    });
    
		//添加图片	
		$("#file").blur(function(){
			uploadPic();
		});	
	    function uploadPic() {  
	    var membersId=$("input[name='cardId']").val();
        // 上传设置  
        var options = {  
                // 规定把请求发送到那个URL  
                url: "uploadImage.html?membersId="+membersId,  
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
/*         	else if($("input[name='image']").val()==""){
        		$.MsgBox.Alert("消息", "请采集会员照片"); 
        		return ;         		
        	}; */
        	/* $.getJSON("addMembers.json",form, submitForm); */
        	$.post("updateMembersInfo.html",form,submitForm,"JSON");
             	function submitForm(data){
        		if(data.delResult=="true"){
        		$.MsgBox.Alert("消息", "修改成功"); 
        		
        		}else{
        		
        		$.MsgBox.Alert("消息", "修改失败,请联系管理员"); 
        		}
        	} 
        	
       });     

</script>
