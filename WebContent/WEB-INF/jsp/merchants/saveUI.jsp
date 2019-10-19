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
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title"><a href="javascript:history.back();">&lt;&lt; 返回</a></h3>
        </div>
        <form:form action="${pageContext.request.contextPath }/merchants/${empty merchant.id ? '' : merchant.id }" commandName="merchant">
          <form:hidden path="id"/>
          
          <input type="hidden" name="_method" value="${empty merchant.id ? 'POST' : 'PUT' }"/>
          <div class="box-body">
            <div class="form-group">
              <label for="loginName">登录名</label>
              <form:input path="loginName" cssClass="form-control" value="${merchant.loginName }" placeholder="输入登录名"/>
            </div>
            <div class="form-group">
              <label for="name">姓名</label>
              <form:input path="name" cssClass="form-control" value="${merchant.name }" placeholder="输入姓名"/>
            </div>
            <div class="form-group">
              <label for="storeName">商店名</label>
              <form:input path="storeName" cssClass="form-control" value="${merchant.storeName }" placeholder="输入商店名"/>
            </div>
            <div class="form-group">
              <label for="storeTelephone">商店电话</label>
              <form:input path="storeTelephone" cssClass="form-control" value="${merchant.storeTelephone }" placeholder="输入商店电话"/>
            </div>
            <div class="form-group">
              <label for="telephone">联系电话</label>
              <form:input path="telephone" cssClass="form-control" value="${merchant.telephone }" placeholder="输入联系电话"/>
            </div>
            <div class="form-group">
              <label for="email">邮箱</label>
              <form:input path="email" cssClass="form-control" value="${merchant.email }" placeholder="输入邮箱"/>
            </div>
            <div class="form-group">
              <label for="address">地址</label>
              <form:input path="address" cssClass="form-control" value="${merchant.address }" placeholder="输入地址"/>
            </div>
          </div>
          <div class="box-footer">
            <button type="submit" class="btn btn-primary">${empty merchant.id ? '添加' : '更新' }</button>
          </div>
        </form:form>
      </div>
    </section>
  </body>
</html>
    