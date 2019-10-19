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
          <!-- 添加搜索条件 -->
          <div class="box-body">
            <div class="row">
              <form id="searchForm" action="" onsubmit="return false;">
                <div class="col-xs-2">
                   <select class="form-control" name="key" id="query_key">
                     <option value="loginName">登录名</option>
                   </select>
                </div>
                
                <div class="col-xs-2">
                  <input type="text" id="query_value" name="value" class="form-control" placeholder="关键字">
                </div>
                <div class="col-xs-2">
                   <button type="submit" class="btn bg-primary btn-flat"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询</button>
                </div>
              </form>
            </div>
          </div>
          
          <div id="toolbar"  class="btn-group">
            <a href="${pageContext.request.contextPath }/admins/saveUI" type="button" class="btn bg-maroon btn-flat"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加</a>
            <button type="button" data-ope="delete" class="btn bg-olive btn-flat" id="del_admin"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除</button>
            <button type="button" data-ope="edit" class="btn bg-orange btn-flat"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
          </div>
          <table id="admin_table" class="text-center"  data-show-jumpto="true"></table><!-- 如何将结果渲染到此处 -->
        </div>
      </div>
    </section>
    <script src="${pageContext.request.contextPath}/static/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/table/bootstrap-table-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/admin/admin.js"></script>
    
    <script type="text/javascript">
        /* <!-- 监听页面渲染完毕,jquery -->
        $(function(){
        	
        	//监听查询按钮的点击
        	//jquery
        	$("#searchForm").on("submit",function(){
                var param = $(this).serializeObject();  //获取搜索框的映射对象
        		if(param.key && param.value){
        			var key = param.key;
        			var value = param.value;
        		    delete param['key'];
        		    delete param['value'];
        			param[key] = value;
        		}else{
        			var key = "名称";
        			if(param.key == "loginName")
        				key = "登录名";
            		alert(key+"的搜索关键字不能为空！"); 
            		return false;
        		}
        		$table.bootstrapTable('refresh',{query:param}); //table 插件的方法
        		return false;
        	});
        	
        	
        	// 监听编辑按钮
        	$("#toolbar > button").on("click", function(){
        		var $it = $(this);						//jQuery对象
        		var ope = $it.data("ope");			//获取标签中的data-ope的值
        		var idArray = $table.bootstrapTable("getAllSelections");
        		console.log(idArray);
        		// 未勾选
        		if(idArray.length == 0){
        			alert("至少选择一条记录！");
        			return;
        		}
        		// 清洗只获得id
        		idArray = $.map(idArray, function(item){
        			return item.id;
        		});
        		
        		if("edit" == ope){
        			window.location.href = sys.contextPath+"/admins/"+idArray[0]+"/editUI";// ${pageContext.request.contextPath}放在js中不好，当js代码从页面抽离出来时，就会失效
        		}else if("delete" == ope){
        			var ids = idArray.join(",");
        			request.ajax(sys.contextPath+"/admins/"+ids, "_method=DELETE", true, function(){
        				$table.bootstrapTable('refresh');		//渲染页面
        			});
        		}
        	});
        	
        	
        	//发送请求
        	 var queryUrl = 'http://localhost:8080/WebShopPlatform/admins';
         	  $table = $('#admin_table').bootstrapTable({
         		  // 以下规则基本固定
         		 url: queryUrl,                      //请求后台的URL（*）
                 method: 'GET',                      //请求方式（*）
                 toolbar: '#toolbar',                //工具按钮用哪个容器
                 striped: true,                      //是否显示行间隔色，使表格带有条纹
                 cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                
                 pagination:true,                   //是否显示分页（*），在表格底部显示分页工具栏
                 sortable: true,                     //是否启用排序
                 sortOrder: "asc",                   //排序方式
                 sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                 
                 pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
                 pageSize: 10,                       //每页的记录行数（*）
                 pageList: [10, 20, 50, 100,],        //可供选择的每页的行数（*）
                 smartDisplay : false,					//当实际数据少于pageList中的某一个值时，默认（true）可选项为该值及小于该值的列表
                 clickToSelect: true,                //是否启用点击选中行
                 uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                 //showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
                 //search: true,                      //是否显示表格搜索
                // strictSearch: true,
                 showColumns: true,                  //是否显示所有的列（选择显示的列）
                 showRefresh: true,                  //是否显示刷新按钮
                 
                 //得到查询的参数
                 queryParams : function (params) {
                	 // alert(params.limit); 
                      var temp = {
                    	  //limit : params.limit,
                		  pageSize : params.limit,
                          pageStart : (params.offset / params.limit) + 1,		//页码 
    	                  sort : params.sort,      //排序列名  
                          sortOrder : params.order //排位命令（desc，asc） 
                      };
                    return temp;
                 },
                 // 表格显示列
                 columns: [{
                     checkbox: true,  
                     visible: true                  //是否显示复选框  
                 },{
                     field: 'loginName',
                     title: '登录名'
                 },{
                     field: 'telephone',
                     title: '联系电话'
                 },{
                     field: 'email',
                     title: '邮箱'
                 },{
                     field: 'address',
                     title: '地址'
                 }],
                 // 以下两个目前没用
                 formatLoadingMessage : function(){
                	 return "请稍等，正在加载中...";
                 },
                 formatNoMatch : function(){
                	 return "无符合条件的记录";
                 },
                 
                 onLoadError: function () {
                   //加载失败触发
                	 $('#admin_table').bootstrapTable('removeAll');
                 },
                 responseHandler: function(res) {
                	 //console.log(res);
                     return {
                         "total": res.total,//总页数
                         "rows": res.rows   //数据
                      };
                 }
             });
        }); */
    </script>
  </body>
</html>
    