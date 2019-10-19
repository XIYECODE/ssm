<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!-- springMVC标签库 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加入商品</title>
<%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
</head>
<body>
	<form action="${pageContext.request.contextPath}/merchants/merchant/products/uploadPic" method="post"  enctype="multipart/form-data">
		<div class="container-fluid box-body">
			<div class="row">
				<div class="col-md-8 input-product-info">
					<div class="form-group">
						<label for="name">商品名(必填)</label>
						<input type="text" name="name" class="form-control" placeholder="输入商品名"/>
					</div>
					<div class="form-group">
						<label for="name">库存(必填)</label>
						<input type="text" name="quantity" class="form-control" placeholder="输入数量"/>
					</div>
					<div class="form-group">
						<label for="price">价格(必填)</label>
						<input type="text" name="price" class="form-control" placeholder="输入价格"/>
					</div>
					<div class="form-group">
						<label for="discount">折扣价(必填)</label>
						<input type="text" name="discount"  class="form-control"  placeholder="输入折扣价"/>
					</div>
					<div class="form-group">
						<label for="dateofmanufacture">生产日期(必填)</label>
						<input type="text" name="dateofmanufacture" class="form-control"  placeholder="输入生产日期"/>
					</div>
					<div class="form-group">
						<label for="termofvalidity">有效期(必填，以天为单位)</label>
						<input type="text" name="termofvalidity" class="form-control"  placeholder="输入有效期"/>
					</div>
				</div>
				<div class="col-md-4">
					<div class="container"><input type="file" name="file" class="imgInput"></div>
					<div class="container"><img alt="回显照片"  height="300" width="300" class="img"></div>
				</div>
			</div>
			<div class="row"><div class="col-lg-6"><select class="catalog"></select><input type="hidden" name="ckid" class="ckid-value"/></div><br/></div>
			<div class="row">
				<div class="row selectsecondcatalog">
					<!-- 新增属性 -->
					<!-- <div class="col-md-3"><div class="input-group"><span class="input-group-addon"><input type="checkbox"></span><input type="text" class="form-control"></div></div> -->
				</div>
			</div>
		</div>
		<div class="box-footer">
			<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="">添加</button>
		</div>
	</form>
	<script type="text/javascript">
		$(function(){
			//选择分类
			var url = sys.contextPath + "/catalog.do";
			request.ajax(url, "", true, function(data) {
				var ls = data.rows;
				$(".catalog").prepend("<option value='0'>请选择商品分类</option>");
				for ( var i in ls) {
					$(".catalog").append('<option value="'+ ls[i].cid+ '">'+ ls[i].cname+ '</option>');
				}
			});
			//
			$(document).on("change", ".catalog", function() {
				var value = $(this).children('option:selected').val();
				var $select = $(".selectsecondcatalog");
				if (value == 0) {
					$select.children().remove();
					return;
				}
				// 
				var url1 = sys.contextPath + "/secondCatalog.do";
				var params = {"cid" : value};
				request.ajax(url1, params, true, function(data) {
					// 移除上一次记录
					$select.children().remove();
					// 加载新的信息
					var ls = data.rows;
					for ( var i in ls) {
						$select.append('<div class="col-md-2"><div class="input-group"><span class="input-group-addon"><input type="checkbox" disabled="disabled" value="' + ls[i].scid+ '"></span><input type="text" class="form-control" placeholder="' + ls[i].scname + '"></div></div>');
						//$select.append('<option value="' + ls[i].scid+ '">' + ls[i].scname + '</option>');
					}
					$('input[type="text"]').bind('input propertychange', function() {
						var $check = $(this).parent().find('input[type="checkbox"]');
						if($(this).val() != ""){
							$check.prop("checked", true);
						}else{
							$check.prop("checked", false);
						}
					}); 
				});
			});
			$(".btn").click(function(){
				//选择分类
				var value = $(".catalog").children('option:selected').val();
				if(value == "0"){
					alert("请选择商品分类");
					return false;
				}
				//基本属性不能为空·
				var flag = false;
				$(".input-product-info").find('input[type="text"]').each(function(){
					if($(this).val() == ""){
						alert($(this).attr("placeholder"));
						flag = true;
						return false;
					}
				});
				if(flag == true){
					return false;
				}
				//
				$(".ckid-value").val(value);
				//扩展属性
				var sidAndVal = "";
				$(".selectsecondcatalog").find('input[type="text"]').each(function(){
					var $check = $(this).parent().find('input[type="checkbox"]');
					if($(this).val() != ""){
						//alert($check.val())
						var temp = $check.val()+":"+$(this).val();
						//alert(temp)
						sidAndVal += temp+"-";
					}
				});
				//alert(sidAndVal)
				if(sidAndVal != ""){
					$("form").append('<input type="hidden" name="sidAndVals" value="'+sidAndVal+'" />');
					console.log($("form"))
				}
			});
			
			
			//验证输入
			$("input[name=termofvalidity] , input[name=quantity]").on('input', function(){
                $(this).val($(this).val().replace(/^(0+)|[^\d]+/g,''));  
            });
			$("input[name=price], input[name=discount]").on('input', function(){
                $(this).val($(this).val().replace(/^(0|\.+)|[^\d.]+/g,''));
            });
		});
		$(".imgInput").change(function(){
			$(".img").attr("src", URL.createObjectURL($(this)[0].files[0]));
		});
	</script>
</body>
</html>