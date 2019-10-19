<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!-- springMVC标签库 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家注册</title>
<%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
<style type="text/css">
	.login-box{
		width:50%;
		margin-top: 50px ;
	}
</style>
</head>
<body class="register-page">
<div class="login-box">
	<div class="login-logo">
		<a href="${pageContext.request.contextPath}/index"><b><img alt="电商服务平台" src="${pageContext.request.contextPath}/static/images/bg/webshopplatform.png" height="50"></b></a>
	</div>
	<!-- /.login-logo -->
	<div class="login-box-body">
		<p class="login-box-msg"><img alt="商家注册" src="${pageContext.request.contextPath}/static/images/bg/title.png" height="30"></p>
		<form action="${pageContext.request.contextPath}/register/mRegister/register.do" method="post"  enctype="multipart/form-data">
			<div class="row">
				<div class=col-md-6>
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
						<input type="text" name="name" class="form-control" placeholder="输入真实姓名">
				        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="text" name="telephone" class="form-control" placeholder="输入个人电话">
				        <span class="glyphicon glyphicon-earphone form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="text" name="email" class="form-control" placeholder="输入个人邮箱">
				        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="text" name="address" class="form-control" placeholder="输入个人地址">
				        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="text" name="storeName" class="form-control" placeholder="输入注册店名">
				        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="text" name="storeTelephone" class="form-control" placeholder="输入商店电话">
				        <span class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
					</div>
				</div>
				<div  class=col-md-6>
					<label>
						<input style="position:absolute;opacity:0;" type="file" name="file" id="imgInput" accept="image/gif,image/jpeg,image/x-png" placeholder="上传营业照"/>
						<img class="img" width="300" height="343" src="${pageContext.request.contextPath}/static/images/bg/upload.png"> 
						<!-- <img class="img hidden" name="image">  -->
					</label> 
				</div>
			</div>
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
				$(this).val("");
			});
			
			$(".btn").click(function(){
				var flag = true;
				$("input").each(function(){
					if($(this).val() == ""){
						alert("请"+$(this).attr("placeholder"));
						flag = false;
						return false;
					}
				});
				/* if(flag && $("input[name=sure-password]").val() != $("input[name=password]").val()){
					alert("两次密码不一致");
					flag = false;
				} */
				return flag;
			});

			$("#imgInput").change(function(){
				$(".img").attr("src", URL.createObjectURL($(this)[0].files[0]));
			});
		});
	</script>
</body>
</html>