var $table;
$(function(){
	
	// 发送请求
	var queryUrl = sys.contextPath+'/users/user/orderItems/list';
	request.ajax(queryUrl, {"status":$("#status").val()}, true, function(data){
		
		console.log("/users/user/orderItems/list",data);
		
		var rows = data["rows"];
	   	var flag_orderId = {};
	   	
	   	$("#toolbar").children().not(":first").remove();
	   	$("#order_id").children().not(":first").remove();
	   	
	   	for(var i=0; i<rows.length; i++){
		   	if(!flag_orderId.hasOwnProperty(rows[i]["id"])){					// 剔除重复性订单号
			   	flag_orderId[rows[i]["id"]] = true;
			   	$("#order_id").append('<option value="'+rows[i]["id"]+'">'+rows[i]["id"]+'</option>');
		   	}
	   	}

	   	if(rows.length > 0 ){
	   		if(rows[0]['status'] == '1'){
	   			$("#toolbar").append('<button type="button" class="btn btn-info btn-flat  fahuo">编辑</button>');
	   		}else if(rows[0]['status'] == '3'){
	   			$("#toolbar").append('<button type="button" class="btn btn-success btn-flat  fahuo">签收</button>');
	   		}
	   	}

	 	// 渲染数据
		$table = $('#orderItem_table').bootstrapTable({
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
			showColumns: true,                 // 是否显示所有的列（选择显示的列）
			showRefresh: true,                   // 是否显示刷新按钮
	       
			/*  */
			// 得到查询的参数
			queryParams : function (params) {// 此处的名称跟query的名称相同，否则是无法传给后台并获取的
	            var temp = {
	      		    pageSize : params.limit,
	                pageNum : (params.offset / params.limit) + 1,		// 页码
	                sortName : params.sort,      // 排序列名
	                sortOrder : params.order, // 排位命令（desc，asc）
	                status : $("#status").val()
	            };
	            return temp;
	       },
	       /* 表格显示列 */
	       columns: [{
	           checkbox: true,
	           visible: true                  // 是否显示复选框
	       },{
	           field: 'id',
	           title: '订单号',
	           align: 'center',
	           valign: 'middle'
	       },{
	           field: 'pid',
	           title: '商品号',
	           valign: 'middle',
	           sortable : true,
	           formatter: productFormatter
	       },{
	           field: 'price',
	           title: '单价',
	           valign: 'middle'
	       },{
	           field: 'quantity',
	           title: '购买量',
	           valign: 'middle'
	       },{
	           field: 'name',
	           title: '收件人姓名',
	           valign: 'middle',
	           sortable : true
	       },{
	           field: 'address',
	           valign: 'middle',
	           title: '收件人地址'
	       },{
	           field: 'telephone',
	           valign: 'middle',
	           title: '收件人电话',
	           sortable : true
	       },{
	           field: 'ID',
	           title: '操作',
	           width: 120,
	           align: 'center',
	           valign: 'middle',
	           formatter: actionFormatter
	       }],
	       onLoadSuccess: function(data){
	    	   console.log(data)
	       },
	       /* 以下两个目前没用 */
	       formatLoadingMessage : function(){
	      	 	return "请稍等，正在加载中...";
	       },
	       formatNoMatch : function(){
	      	 	return "无符合条件的记录";
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
	        if(row.status == '1'){
	        	result += '<button type="button" class="btn btn-info " onclick="option1('+row.pid+');">编辑</button>';
	        }
	        else  if(row.status == '3'){
	        	// 三个id的循序不能倒，分割符也只能为-
	            result += '<button type="button" class="btn btn-success" id="'+row.id+'-'+row.pid+'-'+row.sid+'" onclick="option4(this);">签收</button>';
	        }
	        return result;
	    }
	    
	    function imageFormatter(value, row, index) {
	    	    return '<img alt="image" width="100" height="50" src="'+sys.contextPath+"/static/"+row.image+'">';
	    }
	    
	    function productFormatter(value, row, index){
	    	return '<a href="#" id="'+row.pid+'">'+row.pname+'</a>';
	    }
 	});
});
	

$("body").on("change", "#order_id", function(){
	var obj = $(this).attr("id");
	var value = $(this).val();
	var param = {"status":$("#status").val()};
	if(value != "all"){
		if(obj == "order_id"){
			param["id"] = value;
		}
	}
	var url = sys.contextPath + "/users/user/orderItems/list";
	$("#orderItem_table").bootstrapTable('refresh', {query:param}); 
});

$("body").on("click", "#toolbar > button", function(){
	var idArray = $table.bootstrapTable("getAllSelections");
	if(idArray.length == 0){
		alert("未选择订单项");
		return;
	}
	if($("#status").val() == "3"){
		// 获得id-pid-sid
		idArray = $.map(idArray, function(item){
			return item.id+'-'+item.pid+'-'+item.sid;
		});
		console.log("idArray",idArray)
		// 拼接idArray
		var ids = idArray.join(",");
		var url = sys.contextPath + "/users/user/orderItems/orderItems.do";
		var params = {"status":5};
		params["ids"] = ids;
		request.ajax(url, params, true, function(data){
			console.log(data);
			window.location.reload();
		});
	}else if($("#status").val() == "1"){
		idArray = $.map(idArray, function(item){
			return item.pid;
		});
		var ids = idArray.join(",");
		option1(ids);
	}
});

function option1(pids){
	if($("form") != null ){
		$("form").remove();
	}
	
	var action = sys.contextPath + "/users/user/orderItems/confirmOrder";
	var form = $("<form></form>");
    form.attr('action',action);
    form.attr('method','get');
    input1 = $("<input type='hidden' name='pids' />");
    input1.attr('value', pids);
    form.append(input1);
    form.appendTo("body");
    form.css('display','none');
    form.submit();
}


function option4(self){
	var url = sys.contextPath + "/users/user/orderItems/orderItems.do";
	var params = {"status":5};
	params["ids"] = $(self).attr("id");
	request.ajax(url, params, true, function(data){
		console.log(data);
		window.location.reload();
	});
}

