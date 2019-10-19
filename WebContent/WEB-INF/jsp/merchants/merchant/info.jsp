<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!-- springMVC标签库 -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, merchant-scalable=no" name="viewport">
    <title>电商管理后台</title>
    <%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
  </head>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Main content -->
    <section class="col-xs-12">
      <div class="box box-primary text-center" >
        <form:form action="${pageContext.request.contextPath }/merchants/merchant/${merchant.id}" commandName="merchant">
          <form:hidden path="id"/>
          
          <input type="hidden" name="_method" value="PUT">
          <div class="box-body">
            <div class="form-group">
              <label for="loginName">登录名</label>
              <form:input path="loginName" cssClass="form-control text-center" value="${merchant.loginName }" readonly="true"/>
            </div>
            <div class="form-group">
              <label for="name">姓名</label>
              <form:input path="name" cssClass="form-control text-center" value="${merchant.name }" readonly="true"/>
            </div>
            <div class="form-group">
              <label for="storeName">商店名</label>
              <form:input path="storeName" cssClass="form-control text-center" value="${merchant.storeName }" readonly="true"/>
            </div>
            <div class="form-group">
              <label for="storeTelephone">商店电话</label>
              <form:input path="storeTelephone" cssClass="form-control text-center" value="${merchant.storeTelephone }" readonly="true"/>
            </div>
            <div class="form-group">
              <label for="telephone">联系电话</label>
              <form:input path="telephone" cssClass="form-control text-center" value="${merchant.telephone }" readonly="true"/>
            </div>
            <div class="form-group">
              <label for="email">邮箱</label>
              <form:input path="email" cssClass="form-control text-center" value="${merchant.email }" readonly="true"/>
            </div>
            <div class="form-group">
              <label for="address">地址</label>
              <form:input path="address" cssClass="form-control text-center" value="${merchant.address }" readonly="true"/>
            </div>
          </div>
          <div class="box-footer">
            <button type="submit" class="btn btn-primary editInfo" onclick="return false;">编辑</button>
            <button type="submit" class="btn btn-primary hidden saveInfo">保存</button>
            <button type="button" class="btn btn-default hidden cancelnfo" onclick="return false;">取消</button>
          </div>
        </form:form>
      </div>
    </section>
    <script type="text/javascript">
    	$(function(){
    			$(".editInfo").click(function(){
    				//alert();
    				$(this).addClass("hidden");
    				$(".saveInfo").removeClass("hidden");
    				$(".cancelnfo").removeClass("hidden");
    				$(".form-control").each(function(){
    					$(this).attr("readonly", false);
    				});
    			});
    			$(".cancelnfo").click(function(){
    				$(this).addClass("hidden");
    				$(".saveInfo").addClass("hidden");
    				$(".editInfo").removeClass("hidden");
    				$(".form-control").each(function(){
    					$(this).attr("readonly", true);
    				});
    				window.location.href= "${pageContext.request.contextPath }/merchants/merchant/info";
    			});
    	});
    </script>
  </body>
</html>
    