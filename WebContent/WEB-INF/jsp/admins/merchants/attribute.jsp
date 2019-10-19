<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/3.3.7/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/product/style.css" />
	</head>
	<body>
		<div class="container-fluid box-body">
			<div class="row">
				<div class="title-height text-center border-bottom-css font-size-20">
					<a class="pull-left" onclick="javascript:history.back(-1);"><span class="glyphicon glyphicon-chevron-left">
					</span>上一页</a><span id="merchant-name"></span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<ul class="list-group" id="more-detail-info">
						<!--全部动态生成-->
						<li class="list-group-item margin-20">属性一：123456</li>
						<li class="list-group-item margin-20">属性一：456789</li>
						<li class="list-group-item margin-20">属性一：789123</li>
						<li class="list-group-item margin-20">
							<span class="badge">新</span>
							属性1：147258
						</li>
						<li class="list-group-item margin-20">属性2：258369</li>
						<li class="list-group-item margin-20">
							<span class="badge">新</span>
							属性3：369147
						</li>
					</ul>
				</div>
				<div class="col-md-4">
					<div class="form-control text-center">营业照</div>
					<div class="container"><img alt="暂无" height="300" width="300" class="merchant-img"></div>
				</div>
			</div>
			<div class="row"><hr></div>
			<div class="row">
				<form action="${pageContext.request.contextPath}/admins/merchants/unPass/pass.do">
					<input type="hidden" name="mid" id="mid" value="${mid}"/>
					<button type="submit" class="btn btn-info btn-block" id="btn-pass">通过</button>
				</form>
			</div>
		</div>
		<script>
			$(function(){
				var url = sys.contextPath+"/admins/merchants/unPass/"+$("#mid").val();
				request.ajax(url, "", true, function(data){
					console.log(data);

					var merchant = new Array("商家姓名", "注册店名", "商家地址", "商家邮箱", "商家申请日期",  "商家个人电话", "商店联系电话");
					var key  = new Array("name", "storeName", "address", "email", "registerTime",  "telephone", "storeTelephone");
					var ls = data.rows;
					
					$(".merchant-img").attr("src", (sys.contextPath+"/static/"+ls[0].businessPhoto));
					$("#merchant-name").text(ls[0].storeName);
					$("#more-detail-info").children().remove();
					
					for(var i=0; i<merchant.length; i++){
						var html = '<li class="list-group-item border-none"><div class="input-group">'+
												'<span class="input-group-btn">'+
													'<button class="btn btn-default width-100" type="button">'+merchant[i]+'</button>'+
												'</span>'+
												'<input type="text" class="form-control text-center" value="'+ls[0][key[i]]+'" readonly="readonly">'+
											'</div></li>' ;
						$("#more-detail-info").append(html);
					}
				});
				
				
				/* $("#btn-pass").on('click', function(){
					window.location.href = sys.contextPath + "/admins/merchants/unPass/pass.do";
				}); */
			});
		</script>
	</body>
</html>