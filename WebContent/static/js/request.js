var request = function(){}

/**
 * callback 函数
 */
request.ajax=function(url,param,async,callback){
	$.ajax({
		type : "POST",									 //请求提交方式
		url : url,												//提交后台地址
		data: param, 									//参数
		cache: false,										//保留缓存
		async: async, 									//异步请求
		success: function(data){  				    //服务器返回情况，自定义json格式
			callback(data);
		   /* if(data.success){
		    	//由调用者决定
		    	callback(data);
		    }else{
		    	//console.log(data.msg);
		    }*/
		}
	})
};
 