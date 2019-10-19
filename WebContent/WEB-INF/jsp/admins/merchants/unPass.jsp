<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>电商管理后台</title>
    <%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Main content -->
    <section class="col-xs-12">
      <div class="box box-success">
        <div class="box-body">
          <div id="toolbar"  class="btn-group">
          	<span>
	          	<select class="btn btn-default btn-flat" name="key" id="registerTime" title="申请日期">
	            	<option value="all">所有日期</option>
				</select>
          	</span>
          </div>
          <table id="merchant_table" class="text-center"  data-show-jumpto="true"></table><!-- 如何将结果渲染到此处 -->
        </div>
      </div>
    </section>
    <script src="${pageContext.request.contextPath}/static/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/table/bootstrap-table-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/admin/merchants.js"></script>
  </body>
</html>
    