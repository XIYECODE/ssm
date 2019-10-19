<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %><!-- springMVC标签库 -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
        <form:form action="${pageContext.request.contextPath }/admins/${empty admin.id ? '' : admin.id }" commandName="admin">
          <form:hidden path="id"/>
          
          <input type="hidden" name="_method" value="${empty admin.id ? 'POST' : 'PUT' }"/>
          <div class="box-body">
            <div class="form-group">
              <label for="loginName">登录名</label>
              <form:input path="loginName" cssClass="form-control" value="${admin.loginName }" placeholder="输入登录名"/>
            </div>
            <div class="form-group">
              <label for="telephone">联系电话</label>
              <form:input path="telephone" cssClass="form-control" value="${admin.telephone }" placeholder="输入联系电话"/>
            </div>
            <div class="form-group">
              <label for="email">邮箱</label>
              <form:input path="email" cssClass="form-control" value="${admin.email }" placeholder="输入邮箱"/>
            </div>
            <div class="form-group">
              <label for="address">地址</label>
              <form:input path="address" cssClass="form-control" value="${admin.address }" placeholder="输入地址"/>
            </div>
          </div>
          <div class="box-footer">
            <button type="submit" class="btn btn-primary">${empty admin.id ? '添加' : '更新' }</button>
          </div>
        </form:form>
      </div>
    </section>
  </body>
</html>
    