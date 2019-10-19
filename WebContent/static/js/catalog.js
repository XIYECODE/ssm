var param;
var firstCatalog = "li";
var secondCatalog = "li";
var secondValue = "li";
$(function(){
	
	$(function(){
		var $mf = $('iframe[name="myIframe"]');
		$mf.attr('width', window.screen.width);
	});
	
	//--------------------------------------------------------------------------------------
	var url = sys.contextPath+"/catalog.do";
	//-------------------------------------一级目录----------------------------------------
	request.ajax(url, "", true, function(data){
		$(firstCatalog).remove();
		var ls = data.rows;
		for(var i in ls){
			$(".navTitle").append('<'+firstCatalog+' id="'+ls[i].cid+'">'+ls[i].cname+'</'+firstCatalog+'>');
		}
	});
	//-------------------------------------二级目录----------------------------------------
   $(".navTitle").on('click', firstCatalog,function(){
		var url1 = sys.contextPath+"/secondCatalog.do";
		var $it = $(".secondList");
		//=================================================
		param = {"cid": this.id};										//记录一级id
		request.ajax(url1, param, true, function(data){
			$it.children().filter(secondCatalog).remove();
			var ls = data.rows;
			for(var i in ls){
				$it.append('<'+secondCatalog+' class="secondCatalog" id="'+ls[i].scid+'">'+ls[i].scname+'</'+secondCatalog+'>');
			}
			//-------------------------------一级显示商品------------------------------------
			$("form").attr("action", sys.contextPath+"/getProduct.do"+"?cid="+param["cid"]).submit();
	       	//-------------------------------二级显示商品------------------------------------
	       	$(".secondCatalog").click(function(){
	   			var params = "?sid="+this.id+"&cid="+param["cid"];
	   			$("form").attr("action", sys.contextPath+"/getProduct.do"+params).submit();
	   		});
	       	//--------------------------------显示属性值-------------------------------------
       		/*var $iv = $(".valueList");
	       	$(".secondCatalog").hover(function(){//mouseenter
	       		var url2 = sys.contextPath+"/secondValue.do";
       			$iv.children().filter(secondValue).remove();
	       		param["sid"] =  this.id;										//记录二级id
	       		request.ajax(url2,param, true, function(data){
	    			var ls = data.rows;
	    			for(var i in ls){
	    				$iv.append('<'+secondValue+' class="secondValue" id="'+ls[i].attrid+'">'+ls[i].value+'</'+secondValue+'>');
	    			}
	       		});
	       	}, function(obj){//mouseleave
	       		//判断是否选中
	       		$(".valueListBox").mouseenter(function(){
	       			//---------------------------三级显示商品-----------------------------------
	       			$(".secondValue").click(function(){
	       				var url3 = sys.contextPath+"/attrAndVal.do";
	       				var params = "?sid="+param["sid"]+"&value="+this.innerHTML;
	    	   			$("form[name='hidenForm']").attr("action", sys.contextPath+"/getProduct.do"+params).submit();
	       			});
	       		});
	       		
	       		$(".valueListBox").mouseleave(function(){
		       		$iv.children().filter(secondValue).remove();
	       		});
	       		//必要的，当鼠标触发二级目录，但未进入三级目录时鼠标就移到其他地方触发
	       		if(!$(".valueListBox").is(":hover")){
			       	$iv.children().filter(secondValue).remove();
	       		}
	       		
	       	}); */
		});
	});
});