<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!-- springMVC标签库 -->
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
	<div class="title-height text-center border-bottom-css font-size-20 bg-color-title-info">
		<a class="pull-left" onclick="javascript:history.back(-1);"><span class="glyphicon glyphicon-chevron-left"></span>上一页</a>购物车
	</div>
	<div class="col-md-12">
		<table class="table text-center	 table-responsive ">
			<thead>
	             <tr><th style="width:15%"><input type="checkbox"/>全选</th><th style="width:30%">商品</th><th style="width:25%">商店名</th><th style="width:15%">价钱</th><th style="width:15%">数量</th></tr>
	         </thead>
	         <tbody>
	         	<tr><td><input type="checkbox"/></td><td><img alt="" src="">商品名</td><td>有来有往</td><td>25</td><td><input type="text"/></td></tr>
	         </tbody>
		</table>
		<ul class="list-group" id="order-item-list"></ul>
		<div class="navbar-fixed-bottom">
			<div class="pull-left" style="font-size: 20px; color: red; margin: 20px;">总计(元)：<label id="totalprice">0</label></div>
			<div class="pull-right" style="margin: 20px;">
				<input type="button" class="btn btn-success" id="buy-now" value="购买"/>
				<input type="button" class="btn btn-danger" id="remove-cart" value="删除"/>
			</div>
		</div>
		
	</div>
	<!-- ================================================================= -->
	<script type="text/javascript">
		$(function(){
			//alert($("#pids").val())
			$(function(){
				//清除数据
				$("input[type=checkbox][name!=pid]").prop("checked", false);
				//获取数据进行部署
				var url = sys.contextPath + "/users/user/orderItems/buildCart";
				var param = {"pids":$("#pids").val()};
				console.log(param)
				request.ajax(url, param, true, function(data){
					$("#order-item-list").children().remove();
					$("table").find("tbody").children().remove();
					var lss = data.rows;
					/* var html = ""; */
					var html1 = "";
					console.log(lss)
					for(var i in lss[0]){
						/* html += '<li class="list-group-item">'+
											'<div class="container-fluid">'+
											'<div class="row">'+
												'<div class="col-md-2"><img src="'+(sys.contextPath+"/static/"+lss[1][i].image)+'" class="img-responsive"></div>'+
												'<div class="col-md-4 text-center">'+lss[1][i].name+'</div><input type="hidden" name="quantity" value="'+lss[1][i].quantity+'"/>'+
												'<div class="col-md-5">'+
													'<div class="col-xs-4 text-center">'+lss[2][i].storeName+'</div>'+
													'<div class="col-xs-4 text-center">'+lss[1][i].price+'</div>'+
													'<div class="col-xs-4 text-center"><input type="text" class="form-control text-center" value="'+lss[0][i].quantity+'" id="product-buy-quantity"></div>'+
												'</div>'+
												'<div class="col-md-1"><input type="checkbox" name="pid" id="pid" value="'+lss[1][i].id+'" /></div></div>'+
											'</div>'+
										'</div>'+
									'</li>'; */
						html1 +='<tr class="gf"><td><input type="checkbox" name="pid" id="pid" value="'+lss[1][i].id+'" /><input type="hidden" name="quantity" value="'+lss[1][i].quantity+'"/></td><td><img src="'+(sys.contextPath+"/static/"+lss[1][i].image)+'" class="img-responsive-100">'+lss[1][i].name+'</td><td>'+lss[2][i].storeName+'</td><td name="price">'+lss[1][i].price+'</td><td><input type="text" class="form-control text-center" value="'+lss[0][i].quantity+'" ></td></tr>'
							
					}
					/* $("#order-item-list").append(html); */
					$("table").find("tbody").append(html1);
				});
			});
			//按钮事件
			$("#buy-now").on("click", function(){
				var pids = "";
				var quantities = "";
				$("input[type=checkbox][name=pid]").each(function(){
					if($(this).prop("checked")){
						var num = $(this).closest(".gf").find("input[type=text]").val();
						if(num != 0){
							pids += $(this).val()+",";
							quantities += num+",";
						}else{
							alert("勾选项不能为0");
							return false;
						}
					}
				});
				if(pids != ""){
					window.location.href = sys.contextPath+"/users/user/orderItems/cart/"+pids+"="+quantities;
				}
			});
			
			$("#remove-cart").on("click", function(){
				if(confirm("确定删除所选商品")){
					var pids = "";
					$("input[type=checkbox][name=pid]:checked").each(function(){
							pids += $(this).val()+",";
					});
					var param = {"pids":pids};
					var url = sys.contextPath+"/users/user/orderItems/cart/delete.do";
					request.ajax(url, param, true, function(data){
						if(data.success){
							alert("删除成功");
						}else{
							alert("删除失败");
						}
						window.location.reload();
					});
				}
			});
			
			
			//全选与全不选
			$("input[type=checkbox][name!=pid]").on("click", function(){
				var $all = $(this);
				$("input[type=checkbox][name=pid]").each(function(){
					$(this).prop("checked", $all.prop("checked"));
				});
			});
			//监听输入框输入事件
			$("body").on("input", "input[type=text]", function(){
				var cur = $(this).val().replace(/^(0+)|[^\d]+/g,'');
				var quantity = $(this).closest(".gf").find("input[type=hidden][name=quantity]").val();
				if(parseInt(cur) > parseInt( $(this).val())){
					cur =  $(this).val();
				}else if(cur == ""){
					cur = 0;
				}else if(parseInt(cur) > parseInt(quantity)){
					cur = quantity;
				}
				$(this).val(cur);
				//获取总价
				var sum = 0;
				$("input[type=checkbox][name=pid]:checked").each(function(){
					var quantity = $(this).closest(".gf").find("input[type=text]").val();
					var price = $(this).closest(".gf").find("[name=price]").text();
					sum = (Number(sum) + Number(quantity*price)).toFixed(2);
				});
				$("#totalprice").text(sum);
			});
			//监听勾选事件
			$("body").on('click', "input[type=checkbox]", function(){
				var sum = 0;
				$("input[type=checkbox][name=pid]:checked").each(function(){
					var quantity = $(this).closest(".gf").find("input[type=text]").val();
					var price = $(this).closest(".gf").find("[name=price]").text();
					sum = (Number(sum) + Number(quantity*price)).toFixed(2);
				});
				$("#totalprice").text(sum);
			});
			
			
		});
	</script>
</body>
</html>