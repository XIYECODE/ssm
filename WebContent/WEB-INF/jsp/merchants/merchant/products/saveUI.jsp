<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%><!-- springMVC标签库 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, product-scalable=no"
	name="viewport">
<title>电商管理后台</title>
<%@ include file="/WEB-INF/jsp/common/extend.jspf"%>
</head>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- Main content -->
	<section class="col-xs-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">
					<a href="javascript:window.location.href=document.referrer;">&lt;&lt; 上一级</a>
				</h3>
			</div>
			<form action="${pageContext.request.contextPath }/merchants/merchant/products/${product.id}" method="post" enctype="multipart/form-data">
				<%-- <input type="hidden" name="id" value="${product.id}" /> --%><!-- <input type="hidden" name="_method" value="PUT" /> -->
				<div class="container-fluid box-body">
					<div class="row">
						<div class="col-md-8 input-product-info">
							<div class="form-group">
								<label for="name">商品名</label> <input type="text" name="name" class="form-control" value="${product.name }" placeholder="输入商品名" />
							</div>
							<div class="form-group">
								<label for="quantity">库存</label> <input type="text" name="quantity" class="form-control" value="${product.quantity }" placeholder="输入数量" />
							</div>
							<div class="form-group">
								<label for="price">价格</label> <input type="text" name="price" class="form-control" value="${product.price }" placeholder="输入价格" />
							</div>
							<div class="form-group">
								<label for="discount">折扣价</label> <input type="text" name="discount"  class="form-control" value="${product.discount }" placeholder="输入折扣价" />
							</div>
							<div class="form-group">
								<label for="dateofmanufacture">生产日期</label> <input type="text" name="dateofmanufacture" name="termofvalidity" class="form-control" value="${product.dateofmanufacture }" placeholder="输入生产日期" />
							</div>
							<div class="form-group">
								<label for="termofvalidity">有效期</label> <input type="text" name="termofvalidity" class="form-control" value="${product.termofvalidity }" placeholder="输入有效期" />
							</div>
							<input type="hidden" name="image" value="${product.image}"/>
							<input type="hidden" name="isPassed" value="${product.isPassed}"/>
						</div>
						<div class="col-md-4">
							<div class="container"><input type="file" name="file" class="imgInput"></div>
							<div class="container"><img alt="回显照片" src="${pageContext.request.contextPath}/static/${product.image}" height="300" width="300" class="img"></div>
						</div>
					</div>
					<div class="row"><div class="col-lg-6  when-update"><select class="catalog"></select><input type="hidden" name="ckid" class="ckid" value="${product.ckid}"/></div><br/></div>
					<div class="row">
						<div class="row selectsecondcatalog">
							<!-- 新增属性 -->
							<!-- <div class="col-md-3"><div class="input-group"><span class="input-group-addon"><input type="checkbox"></span><input type="text" class="form-control"></div></div> -->
						</div>
					</div>
				</div>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary btn-lg btn-block">更新</button>
				</div>
			</form>
			<%-- <form:form action="${pageContext.request.contextPath }/merchants/merchant/products/${empty product.id ? '' : product.id }" commandName="product">
          <form:hidden path="id"/>
          <input type="hidden" name="_method" value="${empty product.id ? 'POST' : 'PUT' }"/>
          <div class="box-body">
            <div class="form-group">
              <label for="name">商品名</label>
              <form:input path="name" cssClass="form-control" value="${product.name }" placeholder="输入商品名"/>
            </div>
            <div class="form-group">
              <label for="price">价格</label>
              <form:input path="price" cssClass="form-control" value="${product.price }" placeholder="输入价格"/>
            </div>
            <div class="form-group">
              <label for="discount">折扣价</label>
              <form:input path="discount" cssClass="form-control" value="${product.discount }" placeholder="输入折扣价"/>
            </div>
            <div class="form-group">
              <label for="dateofmanufacture">生产日期</label>
              <form:input path="dateofmanufacture" cssClass="form-control" value="${product.dateofmanufacture }" placeholder="输入生产日期"/>
            </div>
            <div class="form-group">
              <label for="termofvalidity">有效期</label>
              <form:input path="termofvalidity" cssClass="form-control" value="${product.termofvalidity }" placeholder="输入有效期"/>
            </div>
          </div>
          <div class="box-footer">
            <button type="submit" class="btn btn-primary">${empty product.id ? '添加' : '更新' }</button>
          </div>
        </form:form> --%>
		</div>
	</section>
	<script type="text/javascript">
		$(function(){
			//选择分类
			var url = sys.contextPath + "/catalog.do";
			if($("input[name=isPassed]").val() == 2){
				$("button").text("更新上架");
			}
			
			request.ajax(url, "", true, function(data) {
				var ls = data.rows;
				var cid = $(".ckid").val();
				
				if(cid != ""){
					//更新
					$(".catalog").remove();
					for ( var i in ls) {
						if(ls[i].cid == cid)
							$(".when-update").append('当前分类：'+ ls[i].cname);
					}
					getSecondCatalog();
				}else{
					//待定整合---添加
					$(".catalog").prepend("<option value='0'>请选择商品分类</option>");
					for ( var i in ls) {
						$(".catalog").append('<option value="'+ ls[i].cid+ '">'+ ls[i].cname+ '</option>');
					}
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
				// 添加三级目录时，获取二级目录信息
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
				// 更新商品信息需要重新审核
				$("input[name=isPassed]").val(0);
			});
		});
		//选择图片回显
		$(".imgInput").change(function(){
			$(".img").attr("src", URL.createObjectURL($(this)[0].files[0]))
		});
		//更新模块下回去二级目录
		function getSecondCatalog(){
			var url1 = sys.contextPath + "/secondCatalog.do";
			var params = {"cid" : $(".ckid").val()};
			var $select = $(".selectsecondcatalog");
			request.ajax(url1, params, true, function(data) {
				// 移除上一次记录
				$select.children().remove();
				// 加载新的信息
				var secondcatalog = "";
				if('${secondcatalog}' != null){
					secondcatalog = $.parseJSON('${secondcatalog}');
				}
				var ls = data.rows;
				for ( var i in ls) {
					//
					var value = "";
					if(secondcatalog != null){
						for(var j=0 ; j<secondcatalog.length ; j++){
							if(secondcatalog[j].skid == ls[i].scid && secondcatalog[j].value != undefined){
								value = secondcatalog[j].value;
							}
						}
					}
					//生成所有二级属性
					$select.append('<div class="col-md-2"><div class="input-group"><span class="input-group-addon"><input type="checkbox" disabled="disabled" value="' + ls[i].scid+ '"></span><input type="text" class="form-control" placeholder="' + ls[i].scname + '" value="'+value+'"></div></div>');
					//根据已有属性勾选，上下两句不能互换
					if(value != ""){
						var $lt = $select.find('input[type="checkbox"]').last();
						$lt.prop("checked", true);
					}
					
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
		}
	</script>
</body>
</html>
