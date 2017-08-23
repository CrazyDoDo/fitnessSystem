<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>信息管理系统</title> 
<link href="statics/css/base.css" rel="stylesheet">
<link href="statics/css/platform.css" rel="stylesheet">
<link href="statics/css2/easyui.css" rel="stylesheet">
<style type="text/css">
	.pf-nav li{ cursor:pointer;}
</style>
</head> 
<body>
    <div class="container">
      <div id="pf-hd">
            <div class="pf-logo">
                <img src="statics/images/title.png" alt="logo" width="250" height="67">
          </div>
            
            <div class="pf-nav-wrap">
              <div class="pf-nav-ww">
                <ul class="pf-nav">
                  <li class="pf-nav-item home current" data-menu="sys-manage" name="fitness/goodsController/goGoodsXiaoshou">
                      
                          <span class="iconfont">&#xe625;</span>
                          <span class="pf-nav-title">商品出售</span>
                      
                  </li>
                  <li class="pf-nav-item project" data-menu="org-manage" name="fitness/lockerController/goLockersRent">
                     
                          <span class="iconfont">&#xe649;</span>
                          <span class="pf-nav-title">储物柜出租</span>
                      
                  </li>
                  <li class="pf-nav-item static" data-menu="main-data" name="fitness/customerController/goCustomerDengji">
                      
                          <span class="iconfont">&#xe649;</span>
                          <span class="pf-nav-title">意向会员</span>
                      
                  </li>

                  <li class="pf-nav-item manger" data-menu="supplier-dev" name="fitness/membrse/goMembersAdd">
                      
                          <span class="iconfont">&#xe625;</span>
                          <span class="pf-nav-title">快速开卡</span>
                      
                  </li>

                  <li class="pf-nav-item manger" data-menu="contract-mange">
						<a href="loginOut">
                          <span class="iconfont">&#xe609;</span>
                          <span class="pf-nav-title">切换用户</span>
                      	</a>
                  </li>

                  <li class="pf-nav-item manger" data-menu="pur-source">
                      
                          <span class="iconfont">&#xe639;</span>
                          <span class="pf-nav-title">合作伙伴</span>
                      
                  </li>
                  <li class="pf-nav-item manger" data-menu="supplier-mange">
                      <a href="index.html">
                          <span class="iconfont">&#xe620;</span>
                          <span class="pf-nav-title">操作指南</span>
                     </a>
                  </li>
                  <li class="pf-nav-item manger" data-menu="pur-source">
                     
                          <span class="iconfont">&#xe626;</span>
                          <span class="pf-nav-title">关于我们</span>
                      
                  </li>
                </ul>
              </div>
              

              <a href="javascript:;" class="pf-nav-prev disabled iconfont">&#xe606;</a>
              <a href="javascript:;" class="pf-nav-next iconfont">&#xe607;</a>
            </div>
            


            <div class="pf-user">
                <div class="pf-user-photo">
                    <img src="statics/images/main/user.png" alt="">
                </div>
                <h4 class="pf-user-name ellipsis">${userSession.name}</h4>
                <i class="iconfont xiala">&#xe607;</i>

                <div class="pf-user-panel">
                    <ul class="pf-user-opt">
                        <li class="pf-logout">
                            <a href="loginOut">
                                <i class="iconfont">&#xe60e;</i>
                                <span class="pf-opt-name">退出</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>

        <div id="pf-bd">
            <div id="pf-sider">
                <h2 class="pf-model-name">
                    <span class="iconfont">&#xe64a;</span>
                    <span class="pf-name">导航栏</span>
                    <span class="toggle-icon"></span>
                </h2>

                <ul class="sider-nav">
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe641;</span>
                            <span class="sider-nav-title">会员管理</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                            <c:if test="${perm.peizhi=='yes'}">
                          		 <li name="fitness/membrseCard/membrseCard"><a href="#">会员卡配置</a></li>
                            </c:if>
                           <c:if test="${perm.kaika=='yes'}">
                           		 <li name="fitness/membrse/goMembersAdd"><a href="#">会员开卡</a></li>
                           </c:if>    
                           <c:if test="${perm.caozuo=='yes'}">                 
                          		 <li name="fitness/membersCardOperation/goMembersCardOperation"><a href="#">会员操作</a></li>
                           </c:if> 
                           <c:if test="${perm.xinxi=='yes'}">
                           		<li name="fitness/membersInfoController/goMembrseInfoList"><a href="#">会员信息列表</a></li>
                           </c:if> 
                           <c:if test="${perm.huiyuanbiao=='yes'}">
                           		<li name="fitness/membrse/goMembrseTongji"><a href="#">会员统计报表</a></li>
                           </c:if> 
                           <c:if test="${perm.gaoji=='yes'}">
                           		<li name="fitness/membersLeaveController/goMembrseLeave"><a href="#">高级操作</a></li>
                           </c:if> 
                           
                        </ul>
                     </li>
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe60d;</span>
                            <span class="sider-nav-title">客户管理</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                           <c:if test="${perm.yewu=='yes'}">
                           		<li name="fitness/customerController/goCustomerDengji"><a href="#">客户登记</a></li>
                           </c:if> 
                           <c:if test="${perm.kehu=='yes'}">
                           		<li name="fitness/customerController/goCustomerTable"><a href="#">客户资源管理</a></li>
                           </c:if> 
                           <c:if test="${perm.xiaoshou=='yes'}">
                           		<li name="fitness/customerController/goCustomerFenpei"><a href="#">销售经理</a></li>
                           </c:if> 
                           <c:if test="${perm.yeji=='yes'}">
                          		 <li name="fitness/customerController/goXiaoshouYeJi"><a href="#">客户统计报表</a></li>
                           </c:if> 
                        </ul>
                     </li>
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe626;</span>
                            <span class="sider-nav-title">私教管理</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                       	   <c:if test="${perm.sijiao=='yes'}">
                          		 <li  name="fitness/personal/goPersonalXunlian"><a href="#">私教业务</a></li>
                           </c:if>
                           <c:if test="${perm.sijiaoxinxi=='yes'}">
                           		<li name="fitness/siJiaoDengJi/goSijiaoguanli"><a href="#">私教信息管理</a></li>
                           </c:if>
                           <c:if test="${perm.sijiaojingli=='yes'}">
                           		<li name="fitness/siJiaoDengJi/goPersonaldengji"><a href="#">私教经理</a></li>
                           </c:if>
                           <c:if test="${perm.sijiaobiao=='yes'}">
                          		 <li name="fitness/siJiaoDengJi/goShoukemingxi"><a href="#">私教统计报表</a></li>
                           </c:if>
                        </ul>
                     </li>
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe611;</span>
                            <span class="sider-nav-title">操课管理</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                         <ul class="sider-nav-s">
                       	   <c:if test="${perm.caoke=='yes'}">
                          		 <li name="fitness/curriculum/goCurriculuManage"><a href="#">课表管理</a></li>
                           </c:if>
                           <c:if test="${perm.yuyue=='yes'}">
                          		 <li name="fitness/curriculum/goYuyueguanli"><a href="#">预约管理</a></li>
                           </c:if>
                           <c:if test="${perm.tuandui=='yes'}">
                          		 <li name="fitness/curriculum/goCurriculumType"><a href="#">团队管理</a></li>
                           </c:if>
                        </ul>
                     </li>
                     
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe625;</span>
                            <span class="sider-nav-title">水吧管理</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                           <c:if test="${perm.chuwugui=='yes'}">
                          		 <li name="fitness/lockerController/goXiaoShowTongji"><a href="#">储物柜管理</a></li>
                           </c:if>
                           <c:if test="${perm.shangpin=='yes'}">
                          		 <li name="fitness/goodsController/goAddGoods"><a href="#">商品管理</a></li>
                           </c:if>
                           <c:if test="${perm.shuibayeji=='yes'}">
                           		<li name="fitness/goodsController/goLockersJilu"><a href="#">销售报表</a></li>
                           </c:if>
                        </ul>
                     </li>
                     
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe674;</span>
                            <span class="sider-nav-title">系统管理</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                         <ul class="sider-nav-s">
                           <c:if test="${perm.yuangong=='yes'}">
                          		 <li name="fitness/emoloyeesController/goEmployeesTable"><a href="#">员工管理</a></li>
                           </c:if>
                           <c:if test="${perm.gangwei=='yes'}">
                           		<li name="fitness/emoloyeesController/goStationTable"><a href="#">岗位权限</a></li>
                           </c:if>
                           <c:if test="${perm.rizhi=='yes'}">
                          		 <li name="fitness/emoloyeesController/goSystemLogTable"><a href="#">系统日志</a></li>
                           </c:if>
                        </ul>
                     </li>   
                                       
                 </ul> 
            </div>

            <div id="pf-page">
                <div class="easyui-tabs1" style="width:100%;height:100%;">
                  <div title="首页" style="padding:10px 5px 5px 10px;">
                    <iframe class="page-iframe" src="homePage" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe>
                  </div>
                </div>
            </div>
        </div>

        <div id="pf-ft">
            <div class="system-name">
              <i class="iconfont">&#xe6fe;</i>
              <span>信息管理系统&nbsp;</span>
            </div>
            <div class="copyright-name">
              <span>北大青鸟&nbsp;2017&nbsp;&nbsp;916477734@qq.com&nbsp;版权所有</span>
              <i class="iconfont" >&#xe6ff;</i>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="statics/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="statics/js/main.js"></script>
    <script type="text/javascript" src="statics/membersjs/home.js"></script>
</body> 
</html>

