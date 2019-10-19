<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<title>电商管理后台</title>
	<%@ include file="/WEB-INF/jsp/common/extend.jspf"%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/3.3.7/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/product/style.css" />
</head>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- Main content -->
	<section class="col-xs-12">
		<div class="box box-primary text-center">
			<div class="box-body ">
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-info width-100" type="button">原密码</button>
					</span> <input type="password" class="form-control text-center" id="old-password" placeholder="输入原密码">
				</div><br />
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-info width-100" type="button">新密码</button>
					</span> <input type="password" class="form-control text-center" id="new-password" placeholder="输入新密码">
				</div><br />
				<div class="input-group">
					<span class="input-group-btn">
						<button class="btn btn-info width-100" type="button">确认密码</button>
					</span> <input type="password" class="form-control text-center" id="sure-password" placeholder="输入确认密码">
				</div><br />
			</div>
			<div class="box-footer">
				<button type="submit" class="btn btn-primary saveInfo">保存</button>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$(function() {
			$(".saveInfo").on('click', function(){
				var flag = false;
				$("input[type=password]").each(function(){
					if($(this).val() == ""){
						flag = true;
						alert($(this).attr("placeholder"));
						return false;
					}
				});
				if(flag){
					return false;
				}
				
				var old_pwd = $("#old-password").val();
				var new_pwd = $("#new-password").val();
				var sure_pwd = $("#sure-password").val();
				
				if( new_pwd != sure_pwd ){
					alert("两次密码输入不一致，请重新输入");
					return false;
				}
				
				
				var url = sys.contextPath + "/merchants/merchant/changePassword";
				var params = {};
				params["status"] = "check";
				params["password"] = old_pwd;
				request.ajax(url, params, true, function(data){
					if(data["success"]){
						params["status"] = "update";
						params["password"] = new_pwd;
						request.ajax(url, params, true, function(data){
							if(data["success"]){
								alert("更新密码成功");
							}else{
								alert("更新密码失败！");
							}
						});
					}else{
						alert("原密码错误，请重新输入！");
						$("#old-password").val("");
					}
				});
			});
		});
	</script>
</body>
</html>
