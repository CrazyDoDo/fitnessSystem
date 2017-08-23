<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>信息管理系统</title> 
    <link href="statics/css/base.css" rel="stylesheet">
    <link href="statics/css/login/login.css" rel="stylesheet">
<script type="text/javascript" src="statics/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/membersjs/login.js"></script>
</head> 
<body>
	<div class="login-hd">
		<div class="left-bg"></div>
		<div class="right-bg"></div>
		<div class="hd-inner">
			<span class="logo"></span>
			<span class="split"></span>
			<img src="statics/images/biaoti3.png" class="sys-name" height="40px">
		</div>
	</div>
	<div class="login-bd">
		<div class="bd-inner">
			<div class="inner-wrap">
				<div class="lg-zone">
					<div class="lg-box">
                    
						<div class="lg-label"><h4>用户登录</h4></div>
						<form id="user">
							<div class="lg-username input-item clearfix">
								<i class="iconfont">&#xe60d;</i>
								<input type="text" placeholder="账号/邮箱" name="username">
							</div>
							<div class="lg-password input-item clearfix">
								<i class="iconfont">&#xe634;</i>
								<input type="password" placeholder="请输入密码" name="password">
							</div>
							<div class="lg-check clearfix">
								<div class="input-item">
									<i class="iconfont">&#xe633;</i>
									<input type="text" placeholder="验证码" name="check">
								</div>
								<img src="Number.jsp" id="safeCode"/><br><a id="changeCode" style="cursor:pointer;color:#666">看不清，换一张</a>
							</div>
							<div class="tips clearfix">
								<label><input type="checkbox" checked="checked">记住用户名</label>
								
								<span style="margin-left:25px; color:#EA944D" id="error"></span>
							</div>
							<div class="enter">
								<a href="#" class="purchaser" onClick="login()">立即登录</a>
							</div>
						</form>
					</div>
				</div>
				<div class="lg-poster"></div>
			</div>
		</div>
	</div>
	<div class="login-ft">
		<div class="ft-inner">
			<div class="about-us">
				<a href="javascript:;">关于我们</a>
				<a href="javascript:;">法律声明</a>
				<a href="javascript:;">服务条款</a>
				<a href="javascript:;">联系方式</a>
			</div>
			<div class="address">地址: 北京市西城区信息大厦B座&nbsp;邮编：100032&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2016&nbsp;-&nbsp;2017&nbsp;北大青鸟-专注IT教育&nbsp;版权所有</div>
			<div class="other-info">建议使用IE8及以上版本浏览器&nbsp;&nbsp;E-mail：916477734	@qq.com</div>
		</div>
	</div>
</body> 
</html>

