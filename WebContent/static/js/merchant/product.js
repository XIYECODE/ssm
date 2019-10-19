var $table;
$(function(){
	$("#searchForm").on("submit", function(){
        var param = $(this).serializeObject();  // 获取搜索框的映射对象
		if(param.key && param.value){
			var key = param.key;
			var value = param.value;
		    delete param['key'];
		    delete param['value'];
			param[key] = value;
		}
		$table.bootstrapTable('refresh',{query:param}); // table 插件的方法
		return false;
	});
	
	
	// 发送请求
	var queryUrl = 'http://localhost:8080/WebShopPlatform/merchants/merchant/products/getProducts';
 	$table = $('#product_table').bootstrapTable({
 	 /* 以下规则基本固定 */
 	url: queryUrl,                           // 请求后台的URL（*）
       method: 'GET',                        // 请求方式（*）
       toolbar: '#toolbar',                  // 工具按钮用哪个容器
       striped: true,                           // 是否显示行间隔色，使表格带有条纹
       cache: false,                            // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
      
       pagination:true,                      // 是否显示分页（*），在表格底部显示分页工具栏
       sortable: true,                         // 是否启用排序
       sortOrder: "asc",                      // 排序方式
       sidePagination: "server",          // 分页方式：client客户端分页，server服务端分页（*）
       
       pageNum: 1,                      // 初始化加载第一页，默认第一页,并记录
       pageSize: 10,                           // 每页的记录行数（*）
       pageList: [10, 20, 50, 100,],       // 可供选择的每页的行数（*）
       smartDisplay : false,					// 当实际数据少于pageList中的某一个值时，默认（true）可选项为该值及小于该值的列表
       clickToSelect: true,                  // 是否启用点击选中行
       uniqueId: "id",                         // 每一行的唯一标识，一般为主键列
       // showToggle: true, //是否显示详细视图和列表视图的切换按钮
       // search: true, //是否显示表格搜索
      // strictSearch: true,
       showColumns: true,                 // 是否显示所有的列（选择显示的列）
       showRefresh: true,                   // 是否显示刷新按钮
       
       /*  */
       // 得到查询的参数
       queryParams : function (params) {// 此处的名称跟query的名称相同，否则是无法传给后台并获取的
            var temp = {
            	isPassed : $("#status").val(),
      		    pageSize : params.limit,
                pageNum : (params.offset / params.limit) + 1,		// 页码
                sortName : params.sort,      // 排序列名
                sortOrder : params.order // 排位命令（desc，asc）
            };
            console.log(params.offset)
          return temp;
       },
       /* 表格显示列 */
       columns: [{
           checkbox: true,
           visible: true                  // 是否显示复选框
       },{
           field: 'image',
           title: '图片',
           width: 100,
           align: 'center',
           valign: 'middle',
           formatter: imageFormatter
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
       },{
           field: 'quantity',
           valign: 'middle',
           title: '库存',
           sortable : true
       },{
           field: 'isHot',
           valign: 'middle',
           title: '热门',
           sortable : true
       },{
           field: 'ID',
           title: '操作',
           width: 120,
           align: 'center',
           valign: 'middle',
           formatter: actionFormatter
       }],
       /* 以下两个目前没用 */
       formatLoadingMessage : function(){
      	 return "请稍等，正在加载中...";
       },
       formatNoMatch : function(){
      	 return "无符合条件的记录";
       },
       onLoadSuccess: function(data){
    	   console.log("data = ", data);
       },
       /*  */
       onLoadError: function () {
         // 加载失败触发
      	 $('#product_table').bootstrapTable('removeAll');
       },
       /*  */
       responseHandler: function(res) {
           return {
               "total": res.total,// 总页数
               "rows": res.rows   // 数据
            };
       }
    });
 	
 	// 操作栏的格式化
    function actionFormatter(value, row, index) {
        var result = "";

        result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditViewById('" + row.id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
        if($("#status").val() == "1"){
	        result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"DeleteById('" + row.id + "', '"+row.name+"')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
        }else if($("#status").val() == "2"){
        	result += ""
        }
        return result;
    }
    
    function imageFormatter(value, row, index) {
    	    return '<img alt="image" width="100" height="50" src="'+sys.contextPath+"/static/"+row.image+'">';
    }
    
});



//
function DeleteById(id, name){
	if(confirm("确定删除"+name)){
		request.ajax(sys.contextPath+"/products/"+id, "_method=DELETE", true, function(data){
			console.log(data);
			$table.bootstrapTable('refresh');		// 渲染页面
		});
	}
}

//
function EditViewById(id){
	window.location.href = sys.contextPath+"/merchants/merchant/products/"+id+"/editUI";
}