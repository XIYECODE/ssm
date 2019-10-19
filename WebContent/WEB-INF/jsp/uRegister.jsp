<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!-- springMVC标签库 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
</head>
<body class="register-page">
<div class="login-box">
	<div class="login-logo">
		<a href="${pageContext.request.contextPath}/index"><b><img alt="电商服务平台" src="${pageContext.request.contextPath}/static/images/bg/webshopplatform.png" height="50"></b></a>
	</div>
	<!-- /.login-logo -->
	<div class="login-box-body">
		<p class="login-box-msg"><img alt="用户注册" src="${pageContext.request.contextPath}/static/images/bg/utitle.png" height="30"></p>
		<form action="${pageContext.request.contextPath}/register/uRegister/register.do" method="post">
			<!-- <div class="row">
				<div class=col-md-6> -->
					<div class="form-group has-feedback">
						<input type="text" name="loginName" class="form-control" placeholder="输入注册账号">
				        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<!-- <div class="form-group has-feedback">
						<input type="password" name="password" class="form-control" placeholder="输入注册密码">
				        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="sure-password" class="form-control" placeholder="输入确认密码">
				        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div> -->
					<div class="form-group has-feedback">
						<input type="text" name="email" class="form-control" placeholder="输入个人邮箱">
				        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group row text-center">
					<input type="radio" name="sex" id="man" value="男" checked="checked">男
					<input type="radio" name="sex" id="woman" value="女">女
						<!-- <div class="col-sm-6 text-right"><input type="radio" name="sex" id="man" value="2" checked>男</div>
						<div class="col-sm-6"><input type="radio" name="sex" id="woman" value="1">女</div> -->
					</div><!-- 
				</div>
			</div> -->
			<div class="box-footer row">
				<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="">注册</button>
			</div>
		</form>
	</div>
  <!-- /.login-box-body -->
</div>
	<script type="text/javascript">
		$(function(){
			$("input").each(function(){
				if($(this).attr("type") == "radio")
					$("input[type=radio]").eq(0).prop("checked", true);
				else
					$(this).val("");
			});
			
			$("input[name=loginName]").on('blur', function(){
				request.ajax(sys.contextPath+"/register/loginName/check.do", {"loginName":$(this).val()}, true, function(data){
					if(data == "true"){
						alert("该用户名已存在");
						$("input[name=loginName]").val("");
					}
				});
			})
			
			$(".btn").click(function(){
				var flag = true;
				$("input[type != radio]").each(function(){
					if($(this).val() == ""){
						alert("请"+$(this).attr("placeholder"));
						flag = false;
						return false;
					}
				});
				return flag;
			});
		});
	</script>
</body>
</html>