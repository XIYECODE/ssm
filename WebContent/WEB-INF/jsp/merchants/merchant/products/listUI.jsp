<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>商品管理</title>
    <%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <!-- Main content -->
    <section class="col-xs-12">
      <div class="box box-success">
        <div class="box-body">
          <!-- 添加搜索条件 -->
          <div class="box-body">
            <div class="row">
              <form id="searchForm" action="" onsubmit="return false;">
                <div class="col-xs-2">
                   <select class="form-control" name="key" id="query_key">
                     <option value="name">商品名</option>
                     <option value="merchantname">商家名</option>
                   </select>
                </div>
                <input type="hidden" id="status" value="${status}"/>
                <div class="col-xs-2">
                  <input type="text" id="query_value" name="value" class="form-control" placeholder="关键字">
                </div>
                <div class="col-xs-2">
                   <button type="submit" class="btn bg-primary btn-flat"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询</button>
                </div>
              </form>
            </div>
          </div>
          <table id="product_table" class="text-center"  data-show-jumpto="true"></table><!-- 如何将结果渲染到此处 -->
        </div>
      </div>
    </section>
    <script src="${pageContext.request.contextPath}/static/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/table/bootstrap-table-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/merchant/product.js"></script>
  </body>
</html>
    