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
	<style>
		.div-border-padding{
			border-top: 1px solid #eee; 
			padding: 10px;
		}
	</style>
</head>
<body>
	<div class="title-height text-center border-bottom-css font-size-20 bg-color-title-info">
		<a class="pull-left" onclick="javascript:window.location.href=document.referrer;"><span class="glyphicon glyphicon-chevron-left"></span>上一页</a>确认订单
	</div>
	<div class="col-md-12">
		<!-- <div class="form-control text-center btn-info">确认订单</div> -->
		<ul class="list-group" id="order-item-list">
			<!--全部动态生成-->
		</ul>
		<div class="row container-fluid">
			<div class="form-control text-center btn-warning">收件人信息</div><br/>
			<div class="input-group">
				<span class="input-group-btn">
					<button class="btn btn-info width-100" type="button">姓名</button>
				</span>
				<input type="text" class="form-control" id="recipientName" placeholder="填写收件人">
			</div><br/>
			<div class="input-group">
				<span class="input-group-btn">
					<button class="btn btn-info width-100" type="button">地址</button>
				</span>
				<input type="text" class="form-control" id="recipientAddress" placeholder="填写收件地址">
			</div><br/>
			<div class="input-group">
				<span class="input-group-btn">
					<button class="btn btn-info width-100" type="button">电话</button>
				</span>
				<input type="text" class="form-control" id="recipientTelephone" placeholder="填写联系人电话">
			</div><br/>
		</div>
		<input type="button" id="submit-orderItem" class="btn btn-success width-full" value="提交"/>
		<input type="hidden" id="pids" value="${pids}"/>
	</div>
	<!-- ================================================================= -->
	<script type="text/javascript">
		$(function(){
			if($("#pids").val() == ""){
				// 订单无商品时跳转某一页面
			}
			//alert($("#pids").val())
			$(function(){
				//获取数据进行部署
				var url = sys.contextPath + "/users/user/orderItems/buildOrderItem";
				var param = {"pids":$("#pids").val()};
				console.log(param)
				request.ajax(url, param, true, function(data){
					$("#order-item-list").children().remove();
					var lss = data.rows;
					var html = "";
					console.log(lss)
					for(var i in lss[0]){
						/* 
				html +='<li class="list-group-item">'+
								'<div class="container-fluid">'+
									'<div class="row">'+
										'<div class="col-md-2"><img src="'+lss[1][i].img+'" class="img-responsive"></div>'+
										'<div class="col-md-4 text-center">'+lss[1][i].name+'</div>'+
										'<div class="col-md-5">'+
											'<div class="col-xs-4 text-center">商店名<div class="div-border-padding">'+lss[2][i].storeName+'</div></div>'+
											'<div class="col-xs-4 text-center">价钱<div class="div-border-padding">'+lss[1][i].price+'</div></div>'+
											'<div class="col-xs-4 text-center">数量<div class="div-border-padding">'+lss[0][i].quantity+'</div></div>'+
										'</div>'+
										'<div class="col-md-1"><input type="button" class="btn btn-danger width-full" value="删除"/></div>'+
									'</div>'+
								'</div>'+
							'</li>'
						*/
						html += '<li class="list-group-item">'+
											'<div class="container-fluid">'+
											'<div class="row">'+
												'<div class="col-md-2"><img src="'+(sys.contextPath+"/static/"+lss[1][i].image)+'" class="img-responsive-100"></div>'+
												'<div class="col-md-4 text-center">'+lss[1][i].name+'</div><input type="hidden" name="pid" value="'+lss[1][i].id+'"/>'+
												'<div class="col-md-5">'+
													'<div class="col-xs-4 text-center">商店名<div class="div-border-padding">'+lss[2][i].storeName+'</div></div>'+
													'<div class="col-xs-4 text-center">价钱<div class="div-border-padding">'+lss[1][i].price+'</div></div>'+
													'<div class="col-xs-4 text-center">数量<div class="div-border-padding">'+lss[0][i].quantity+'</div></div>'+
												'</div>'+
												'<div class="col-md-1"><input type="button" class="btn btn-danger width-full" value="删除"/></div>'+
											'</div>'+
										'</div>'+
									'</li>';
					}
					$("#order-item-list").append(html);
				});
			});
			
			$("#submit-orderItem").on("click", function(){
				var url = sys.contextPath + "/users/user/orderItems/submitOrder.do";
				var params ={};
				var flag = true;
				// 必须填写信息
				$("input[type=text]").each(function(){
					if($(this).val() == ""){
						alert("未"+$(this).attr("placeholder"));
						flag = false;
						// 下面的语句只是针对当前对象退出，即$("input[type=text]")，而并非退出$("#submit-orderItem")
						return flag;
					}else{
						params[$(this).attr("id")] = $(this).val();
					}
				});
				if(flag == false){
					return;
				}
				// 提交数据
					//保存商品id
				var pids = "";
				
				$("input[type=hidden][name=pid]").each(function(){
					if($(this).val() == ""){
						flag = false;
						return false;
					}
					pids += $(this).val() + ",";
				});
				if(!flag){
					alert("已经没有订单可以提交啦~~~");
					return false;
				}
				
				params["pids"] = pids;
					//提交后台
				request.ajax(url, params, true, function(data){
					alert(data.msg);
					//window.location.reload();
					window.location.href = sys.contextPath + "/users/user/tip";
				});
			});
			
			$("body").on("click", "input[type=button][value=删除]", function(){
				if(confirm("是否将该商品移出订单")){
					var id = $(this).closest(".row").find("input[type=hidden][name=pid]").val();
					var param = {"pids" : id};
					var pids = $("#pids").val().replace(id+",", "");
					var url = sys.contextPath + "/users/user/orderItems/confirmOrder/delete.do";
					request.ajax(url, param, true, function(data){
						alert(data.msg);
						// 重新加载页面
						var url1 = sys.contextPath + "/users/user/orderItems/confirmOrder";
						if(pids != ""){
							url1 += "?pids="+pids;
						}
						window.location.href = url1;
					});
				}
			});
			
			
			$("#recipientTelephone").on('input', function(){
				var cur = $(this).val().replace(/^(0+)|[^\d]+/g,'');
				if(cur.length > 11){
					cur = cur.substr(0, 11);
				}
				$(this).val(cur);
			});
			
		});
	</script>
</body>
</html>