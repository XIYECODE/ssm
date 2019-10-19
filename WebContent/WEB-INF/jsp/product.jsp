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
		<div class="container-fluid">
			<div class="row">
				<div class="title-height text-center border-bottom-css font-size-20">
					<!-- <div class="btn btn-cart btn-default pull-left" onclick="javascript:history.back(-1);"><span class="glyphicon glyphicon-chevron-left"></span>上一页</div> -->
					<a class="pull-left" href="${pageContext.request.contextPath}/index" style="color:blue;"><span class="glyphicon glyphicon-chevron-left"></span>上一页</a>商品详情
				</div>
				<%-- <input type="hidden" name="pid" id="pid" value="${pid}"/> --%>
			</div>
			<div class="row">
				<div class="col-md-3 hidden-sm hidden-xs">
					<div class="container"><img src="img/book2.jpg" width="250" height="300" class="product-img"/></div><br/>
				</div>
				<div class="col-md-12 hidden-md hidden-lg">
					<img src="img/book2.jpg" class="img-responsive-300 product-img"/><br/>
				</div>
				<div class="col-md-5">
					<div class="input-group">
						<div id="product-name">
							商品名
						</div>
					</div><br/>
					<div class="input-group">
						<span class="input-group-btn">
							<button class="btn btn-info width-100" type="button">
								价格
							</button>
						</span>
						<input type="text" class="form-control text-center" value="0.0" readonly="readonly" id="product-price">
					</div><br/>
					<div class="input-group">
						<span class="input-group-btn">
							<button class="btn btn-success width-100" type="button">
								优惠/折扣价
							</button>
						</span>
						<input type="text" class="form-control text-center" value="0.0" readonly="readonly" id="product-discount">
					</div><br/>
					<div class="input-group">
						<span class="input-group-btn">
							<button class="btn btn-warning width-100" type="button">
								剩余量
							</button>
						</span>
						<input type="text" class="form-control text-center" value="0" readonly="readonly"  id="product-quantity">
					</div><br/>
					<div class="input-group">
						<span class="input-group-btn">
							<button class="btn btn-danger  width-100" type="button">
								购买数量
							</button>
						</span>
						<form action="${pageContext.request.contextPath}/show/checkInfo.do">
							<input type="text" class="form-control text-center" value="0" id="product-buy-quantity" name="quantity">
							<input type="hidden" name="pid" id="pid" value="${pid}" />
						</form>
					</div><br/>
					<div class="form-group text-center">
						<div class="btn btn-cart btn-info width-100 pull-left" id="product-add"><span class="glyphicon glyphicon-shopping-cart"></span>添加</div>
						<div class="btn btn-cart btn-danger  width-100 pull-right" id="product-buy"><span class="glyphicon glyphicon-heart"></span>购买</div>
						<!-- <input type="submit" class="btn btn-cart btn-danger  width-100 pull-right" value="购买"/> -->
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-control text-center">详情信息</div>
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
			</div>
		</div>
		<script>
			$(function(){
				$(function(){
					var url = sys.contextPath+"/show/product/"+$("#pid").val();
					request.ajax(url, "", true, function(data){
						console.log(data);
						var ls = data.rows;
						$(".product-img").attr("src", (sys.contextPath+"/static/"+ls[0].image));
						$("#product-name").text(ls[0].name);
						$("#product-price").val(ls[0].price);
						$("#product-discount").val(ls[0].discount);
						$("#product-quantity").val(ls[0].quantity);
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
						var html = '<li class="list-group-item border-none"><div class="input-group">'+
												'<span class="input-group-btn">'+
													'<button class="btn btn-default width-100" type="button">生产日期</button>'+
												'</span>'+
												'<input type="text" class="form-control text-center" value="'+ls[0].dateofmanufacture+'" readonly="readonly">'+
											'</div></li>' ;
						html +=  '<li class="list-group-item border-none"><div class="input-group">'+
												'<span class="input-group-btn">'+
												'<button class="btn btn-default width-100" type="button">有效期</button>'+
											'</span>'+
											'<input type="text" class="form-control text-center" value="'+ls[0].termofvalidity+'" readonly="readonly">'+
										'</div></li>' ;
						$("#more-detail-info").append(html);
					});
				});
				
				$("#product-buy-quantity").on("input", function(){
					var cur = $(this).val().replace(/^(0+)|[^\d]+/g,'');
					if(parseInt(cur) > parseInt($("#product-quantity").val())){
						cur = $("#product-quantity").val();
					}else if(cur == ""){
						cur = 0;
					}
					$(this).val(cur);
				});
				
				$("#product-buy").on("click", function(){
					if(parseInt($("#product-quantity").val()) <= 0){
						alert("客官，库存不足！感谢您的支持");
					}else if(parseInt($("#product-buy-quantity").val()) <= 0){
						alert("客官，赏脸买一件啦！");
					}else{
						//请求更新数据
						var url = sys.contextPath+"/users/user/orderItems/checkInfo.do";
						var params = {};
						params["pid"] = $("#pid").val();
						params["quantity"] = $("#product-buy-quantity").val(); 
						request.ajax(url, params, true, function(data){
							if(data.success){
								var msg = data.msg;
								if(msg == "添加失败" || msg == "更新失败"){
									alert("好像出了点问题~~~");
									return;
								}
								window.location.href = sys.contextPath+"/users/user/orderItems/confirmOrder?pids="+$("#pid").val();
							}else{
								window.location.href = sys.contextPath+"/loginUI";
							}
						});
					}
				});
				
				$("#product-add").on("click", function(){
					if(parseInt($("#product-quantity").val()) <= 0){
						alert("客官，库存不足！感谢您的支持");
					}else if(parseInt($("#product-buy-quantity").val()) <= 0){
						alert("客官，赏脸买一件啦！");
					}else{
						//请求更新数据
						var url = sys.contextPath+"/users/user/orderItems/checkInfo.do";
						var params = {};
						params["pid"] = $("#pid").val();
						params["quantity"] = $("#product-buy-quantity").val(); 
						request.ajax(url, params, true, function(data){
							if(data.success){
								var msg = data.msg;
								if(msg == "添加成功"){
									alert("加入购物车成功啦！！！");
								}else if(msg == "添加失败" || msg == "更新失败"){
									alert("好像出了点问题~~~");
								}else if(msg == "更新成功"){
									alert("该商品已经购物车啦！！！");
								}
							}else{
								window.location.href = sys.contextPath+"/loginUI";
							}
						});
					}
				});
			});
		</script>
	</body>
</html>