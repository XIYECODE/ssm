<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!-- springMVC标签库 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
</head>
<body class="register-page">
<div class="login-box">
	<div class="login-logo">
		<a href="${pageContext.request.contextPath}/index"><b><img alt="电商服务平台" src="${pageContext.request.contextPath}/static/images/bg/webshopplatform.png" height="50"></b></a>
	</div>
	<div class="login-box-body">
		<div class="form-group text-center">
	        <a href="${pageContext.request.contextPath}/register/uRegister"><img alt="用户注册" src="${pageContext.request.contextPath}/static/images/bg/uRegister.png" height="50"></a>
		</div>
		<div class="form-group text-center">
	        <a href="${pageContext.request.contextPath}/register/mRegister"><img alt="商家注册" src="${pageContext.request.contextPath}/static/images/bg/mRegister.png" height="40"></a>
		</div>
	</div>
</div>
</body>
</html>