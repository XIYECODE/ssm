<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>用户管理中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/skins/_all-skins.css"><!-- 主题样式 -->
</head>
<body class="hold-transition skin-blue sidebar-mini" style="overflow:hidden;">
  <%-- <%@include file="/WEB-INF/jsp/common/header.jspf" %> --%>
  <header class="main-header">
     <a href="#" target="_blank" class="logo">
         <span class="logo-mini">个人中心</span>
         <span class="logo-lg"><img src="${pageContext.request.contextPath }/static/img/top_logo.png" style="margin-bottom: 5px; width:230px; height: 50px; margin-left: -10px;"/> </span>
     </a>
     <nav class="navbar navbar-static-top">
         <a class="sidebar-toggle">
             <span class="sr-only">切换</span>
         </a><!-- <span class="index_top"><strong>电商服务平台</strong></span> -->
         <div class="navbar-custom-menu">
             <ul class="nav navbar-nav">
                 <li class="dropdown user user-menu">
                     <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                         <img src="${pageContext.request.contextPath }/static/img/user2-160x160.jpg" class="user-image" alt="User Image">
                         <span class="hidden-xs">${user.loginName }</span>
                     </a>
                     <ul class="dropdown-menu pull-right">
                         <li><a class="menuItem" data-id="21" href="${pageContext.request.contextPath }/users/user/info"><i class="fa fa-user"></i>个人信息</a></li>
                         <!-- <li><a href="javascript:void();"><i class="fa fa-trash-o"></i>清空缓存</a></li>
                         <li><a href="javascript:void();"><i class="fa fa-paint-brush"></i>皮肤设置</a></li> -->
                         <li><a href="${pageContext.request.contextPath }/index"><i class="fa fa-paint-brush"></i>返回商品页</a></li>
                         <li><a href="${pageContext.request.contextPath }/loginUI/loginOut"><i class="ace-icon fa fa-power-off"></i>安全退出</a></li>
                     </ul>
                 </li>
             </ul>
         </div>
     </nav>
 </header>
  <!--左边导航-->
  <div class="main-sidebar">
    <div class="sidebar">

      <form action="#" method="get" class="sidebar-form">
          <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                  <a class="btn btn-flat"><i class="fa fa-search"></i></a>
              </span>
          </div>
      </form>
      <input type="hidden" id="contextPath" value="${pageContext.request.contextPath }"/>
      <ul class="sidebar-menu" id="sidebar-menu">
          <!--<li class="header">导航菜单</li>-->
      </ul>
    </div>
  </div>
  <!--中间内容-->
  <div id="content-wrapper" class="content-wrapper">
    <div class="content-tabs">
      <!-- <button class="roll-nav roll-left tabLeft">
        <i class="fa fa-backward"></i>
      </button> -->
      <nav class="page-tabs menuTabs">
        <div class="page-tabs-content" style="margin-left: 0px;">
          <a href="javascript:;" class="menuTab active" data-id="welcome">欢迎</a><!-- 如何解决当前定位问题？ -->
        </div>
      </nav>
      <!-- <button class="roll-nav roll-right tabRight">
        <i class="fa fa-forward" style="margin-left: 3px;"></i>
      </button> -->
      <div class="btn-group roll-nav roll-right">
        <button class="dropdown tabClose" data-toggle="dropdown">
            页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-right">
          <li><a class="tabReload" href="javascript:void();">刷新当前</a></li>
          <li><a class="tabCloseCurrent" href="javascript:void();">关闭当前</a></li>
          <li><a class="tabCloseAll" href="javascript:void();">全部关闭</a></li>
          <li><a class="tabCloseOther" href="javascript:void();">关闭其他</a></li>
        </ul>
      </div>
      <button class="roll-nav roll-right fullscreen"><i class="fa fa-arrows-alt"></i></button>
    </div>
    <div class="content-iframe" style="overflow: hidden;">
      <div class="mainContent" id="content-main" style="margin: 10px; margin-bottom: 0px; padding: 0;">
        <iframe class="LRADMS_iframe" width="100%" height="100%" src="welcome" data-id="welcome" style="border:none;"></iframe>
      </div>
    </div>
  </div>
  <script src="${pageContext.request.contextPath }/static/js/jquery/jQuery-2.2.0.min.js"></script>
  <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/static/js/user/index.js"></script>
</body>
</html>