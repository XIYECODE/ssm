var $table;
$(function(){
	$("#searchForm").on("submit", function(){
        var param = $(this).serializeObject();  //获取搜索框的映射对象
		if(param.key && param.value){
			var key = param.key;
			var value = param.value;
		    delete param['key'];
		    delete param['value'];
			param[key] = value;
		}/*else{
			if(param.key != ""){
				var key = "商家名";
				if(param.key == "name")
					key = "商品名";
	    		alert(key+"的搜索关键字不能为空！"); 
	    		return false;
			}
		}*/
		$table.bootstrapTable('refresh',{query:param}); //table 插件的方法
		return false;
	});
	
	
	/* 监听编辑按钮 */
	$("#toolbar > button").on("click",  function(){
		var $it = $(this);						//jQuery对象
		var ope = $it.data("ope");			//获取标签中的data-ope的值
		var idArray = $table.bootstrapTable("getAllSelections");
		if(idArray.length == 0){
			alert("至少选择一条记录！");
			return;
		}
		//清洗只获得id
		idArray = $.map(idArray, function(item){
			return item.id;
		});
		
		if("edit" == ope){
			window.location.href = sys.contextPath+"/products/"+idArray[0]+"/editUI";// ${pageContext.request.contextPath}放在js中不好，当js代码从页面抽离出来时，就会失效
		}else if("delete" == ope){
			var ids = idArray.join(",");
			request.ajax(sys.contextPath+"/products/"+ids, "_method=DELETE", true, function(){
				$table.bootstrapTable('refresh');		//渲染页面
			});
		}
	} );
	
	
	//发送请求
	 var queryUrl = 'http://localhost:8080/WebShopPlatform/products';
 	  $table = $('#product_table').bootstrapTable({
 		  /* 以下规则基本固定 */
 		 url: queryUrl,                           //请求后台的URL（*）
         method: 'GET',                        //请求方式（*）
         toolbar: '#toolbar',                  //工具按钮用哪个容器
         striped: true,                           //是否显示行间隔色，使表格带有条纹
         cache: false,                            //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        
         pagination:true,                      //是否显示分页（*），在表格底部显示分页工具栏
         sortable: true,                         //是否启用排序
         sortOrder: "asc",                      //排序方式
         sidePagination: "server",          //分页方式：client客户端分页，server服务端分页（*）
         
         pageNum: 1,                      //初始化加载第一页，默认第一页,并记录
         pageSize: 10,                           //每页的记录行数（*）
         pageList: [10, 20, 50, 100,],       //可供选择的每页的行数（*）
         smartDisplay : false,					//当实际数据少于pageList中的某一个值时，默认（true）可选项为该值及小于该值的列表
         clickToSelect: true,                  //是否启用点击选中行
         uniqueId: "id",                         //每一行的唯一标识，一般为主键列
         //showToggle: true,                 //是否显示详细视图和列表视图的切换按钮
         //search: true,                         //是否显示表格搜索
        // strictSearch: true,
         showColumns: true,                 //是否显示所有的列（选择显示的列）
         showRefresh: true,                   //是否显示刷新按钮
         
         /*  */
         //得到查询的参数
         queryParams : function (params) {//此处的名称跟query的名称相同，否则是无法传给后台并获取的
              var temp = {
        		  pageSize : params.limit,
                  pageNum : (params.offset / params.limit) + 1,		//页码 
                  sortName : params.sort,      								//排序列名  
                  sortOrder : params.order 									//排位命令（desc，asc） 
              };
            return temp;
         },
         /* 表格显示列 */
         columns: [{
             checkbox: true,  
             visible: false                  //是否显示复选框  
         },{
             field: 'image',
             title: '图片',
             width: 100,
             align: 'center',
             valign: 'middle',
             formatter: function(value, row, index) {
        	    return '<img alt="image" width="100" height="50" src="'+sys.contextPath+"/static/"+row.image+'">';
             }
         },{
             field: 'name',
             title: '商品名',
             valign: 'middle',
             sortable : true
         },{
             field: 'price',
             title: '价格',
             valign: 'middle',
             sortable : true
         },{
             field: 'discount',
             valign: 'middle',
             title: '折扣价'
         },{
             field: 'dateofmanufacture',
             title: '生产日期',
             valign: 'middle',
             sortable : true
         },{
             field: 'termofvalidity',
             valign: 'middle',
             title: '有效期'
         },{
             field: 'merchantname',
             valign: 'middle',
             title: '商家店名',
             sortable : true
         }],
         /* 以下两个目前没用 */
         formatLoadingMessage : function(){
        	 return "请稍等，正在加载中...";
         },
         formatNoMatch : function(){
        	 return "无符合条件的记录";
         },
         
         /*  */
         onLoadError: function () {
           //加载失败触发
        	 $('#product_table').bootstrapTable('removeAll');
         },
         /*  */
         responseHandler: function(res) {
             return {
                 "total": res.total,//总页数
                 "rows": res.rows   //数据
              };
         }
     });
});