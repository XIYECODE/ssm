var $table;
$(function(){
	
	//发送请求
	 var queryUrl = sys.contextPath +'/admins/merchants/unPass/list';
	 
	 request.ajax(queryUrl, {"isPassed":0}, true, function(data){
		 console.log("unPass, = ", data);
		 var rows = data["rows"];
		 var flag_registerTime = {};
		 
		 $("#toolbar").children().not(":first").remove();
		 $("#registerTime").children().not(":first").remove();
		 
		 for(var i=0; i<rows.length; i++){
			 if(!flag_registerTime.hasOwnProperty(rows[i]["registerTime"])){					// 剔除重复性订单号
				 flag_registerTime[rows[i]["registerTime"]] = true;
				 $("#registerTime").append('<option value="'+rows[i]["registerTime"]+'">'+rows[i]["registerTime"]+'</option>');
			 }
		 }
	 });
 	  $table = $('#merchant_table').bootstrapTable({
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
            	  isPassed : 0,
        		  pageSize : params.limit,
                  pageNum : (params.offset / params.limit) + 1,		//页码 
                  sortName : params.sort,      								//排序列名  
                  sortOrder : params.order 									//排位命令（desc，asc） 
              };
            return temp;
         },
         /* 表格显示列 */
         columns: [{
             field: 'name',
             title: '商家名',
             valign: 'middle',
             sortable : true
         },{
             field: 'storeName',
             title: '商店名',
             valign: 'middle',
             sortable : true
         },{
             field: 'registerTime',
             valign: 'middle',
             title: '申请日期',
             sortable : true
         },{
	           field: 'ID',
	           title: '查看',
	           width: 120,
	           align: 'center',
	           valign: 'middle',
	           formatter: actionFormatter
	       }],
         onLoadSuccess: function(data){
        	console.log("unPass = ", data) 
         },
         /*  */
         onLoadError: function () {
           //加载失败触发
        	 $('#merchant_table').bootstrapTable('removeAll');
         },
         /*  */
         responseHandler: function(res) {
             return {
                 "total": res.total,//总页数
                 "rows": res.rows   //数据
              };
         }
     });
 	  
 	  
 	  function actionFormatter(value, row, index){
 		  return '<button type="button" class="btn btn-link" onclick="getMoreAttribute('+row.id+')">更多</button>'
 	  }
});


$("body").on("change", "#registerTime", function(){
	var value = $(this).val();
	var param = {};
	if(value != "all"){
		param["registerTime"] = value;
	}
	//var url = sys.contextPath + "/admins/merchants/unPass/list";
	$("#merchant_table").bootstrapTable('refresh', {query:param});
});


function getMoreAttribute (id){
	var url = sys.contextPath + "/admins/merchants/unPass/"+id;
	window.location.href = url;
}