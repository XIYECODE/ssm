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
					<a class="pull-left" onclick="javascript:history.back(-1);"><span class="glyphicon glyphicon-chevron-left"></span>上一页</a><span id="product-name"></span>
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
					<div class="form-control text-center">商品照片</div>
					<div class="container"><img alt="暂无" height="300" width="300" class="product-img"></div>
				</div>
			</div>
			<div class="row"><hr></div>
			<div class="row">
				<form action="${pageContext.request.contextPath}/admins/products/unPass/pass.do">
					<input type="hidden" name="pid" id="pid" value="${pid}"/>
					<button type="submit" class="btn btn-info btn-block" id="btn-pass">通过</button>
				</form>
			</div>
		</div>
		<script>
			$(function(){
				var url = sys.contextPath+"/admins/products/unPass/"+$("#pid").val();
				request.ajax(url, "", true, function(data){
					console.log(data);
					var ls = data.rows;
					$(".product-img").attr("src", (sys.contextPath+"/static/"+ls[0].image));
					$("#product-name").text(ls[0].name);
					var sc = ls[0].secondCatalog;
					var attr =  ls[0].attribute;
					$("#more-detail-info").children().remove();
					for(var i=0; i<sc.length; i++){
						if(attr[i].value == null){
							continue;
						}
						var html = '<li class="list-group-item border-none"><div class="input-group">'+
												'<span class="input-group-btn">'+
													'<button class="btn btn-default width-100" type="button">'+sc[i].scname+'</button>'+
												'</span>'+
												'<input type="text" class="form-control text-center" value="'+attr[i].value+'" readonly="readonly">'+
											'</div></li>' ;
						$("#more-detail-info").append(html);
					}
				});
				
				
				/* $("#btn-pass").on('click', function(){
					window.location.href = sys.contextPath + "/admins/products/unPass/pass.do";
				}); */
			});
		</script>
	</body>
</html>