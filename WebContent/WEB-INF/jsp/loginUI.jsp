<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>登录界面</title>
  <%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="${pageContext.request.contextPath}/index"><b><img alt="电商服务平台" src="${pageContext.request.contextPath}/static/images/bg/webshopplatform.png" height="50"></b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">登录</p>

    <form action="${pageContext.request.contextPath}/loginUI/login" method="post">
      <div class="form-group has-feedback">
        <input type="text" name="loginName" class="form-control" placeholder="账号">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
      	<select name="loginId" class="input-sm form-control text-center">
      		<option value="0">客户</option>
      		<option value="1">商家</option>
      		<option value="2">管理员</option>
      	</select>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
      <div class="row">
        <div class="col-xs-12">
           <!-- request  el   -->
           ${errorMsg}
        </div>
      </div>
    </form>
    <!-- /.social-auth-links -->
  </div>
  <!-- /.login-box-body -->
</div>
</body>
</html>