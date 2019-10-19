<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	.header{
		height: 50px;
		border: red solid 1px;
	}
	.slide-content{
		height: 300px;
		border: orange solid 1px;
	}
	
	.content-main{
		min-height: 400px;
		/*border: yellow solid 1px;*/
	}
	
	#myCarousel  .carousel-inner > .item > img {
		display: block;
		width:100%;
		height:400px;
	}
	
	.div-height-30{
		height: 30px;
	}
	.div-height-50{
		height: 50px;
	}
	.div-height-300{
		height: 300px;
		width : 50%;
		/* background : antiquewhite ; */
		/* Firefox 3.6+ */ 
		background: -moz-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Safari 4-5, Chrome 1-9 */ 
		background: -webkit-gradient(linear, left top, right top, from(#FFFAF0), color-stop(0.25, #87CEFA), color-stop(0.5, #7FFFAA), color-stop(0.75, #FAEBD7), to(#FFDAB9)); 
		/* Safari 5.1+, Chrome 10+ */ 
		background: -webkit-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Opera 11.10+ */ 
		background: -o-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9);
	}
	
	.footer{
		height: 100px;
		line-height: 100px;
		position: relative;
		text-align: center;
		font-size: 20px;
		/* background: antiquewhite; */
		/* Firefox 3.6+ */ 
		background: -moz-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Safari 4-5, Chrome 1-9 */ 
		background: -webkit-gradient(linear, left top, right top, from(#FFFAF0), color-stop(0.25, #87CEFA), color-stop(0.5, #7FFFAA), color-stop(0.75, #FAEBD7), to(#FFDAB9)); 
		/* Safari 5.1+, Chrome 10+ */ 
		background: -webkit-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Opera 11.10+ */ 
		background: -o-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9);
		/*border: aquamarine solid 1px;*/
	}
	
	
	.grad-blue {
		width: 100%;
		height: 2px;
		color: aliceblue;
		background: -webkit-linear-gradient(left, aqua , aliceblue); 	/* Safari 5.1 - 6.0 */
		background: -o-linear-gradient(right, aqua, aliceblue);  		/* Opera 11.1 - 12.0 */
		background: -moz-linear-gradient(right, aqua, aliceblue); 		/* Firefox 3.6 - 15 */
		background: linear-gradient(to right, aqua , aliceblue); 		/* 标准的语法 */
	}
	
	.grad-purple{
		width: 100%;
		height: 2px;
		color: purple;
		background: -webkit-linear-gradient(left, purple , aliceblue); 	/* Safari 5.1 - 6.0 */
		background: -o-linear-gradient(right, purple, aliceblue);  		/* Opera 11.1 - 12.0 */
		background: -moz-linear-gradient(right, purple, aliceblue); 		/* Firefox 3.6 - 15 */
		background: linear-gradient(to right, purple , aliceblue); 		/* 标准的语法 */
	}
	
	.font-size-big{
		font-size: 30px;
	}
	
	
	.navbar-default{
		background: -webkit-gradient(linear, 0 100%, 0 0, from(#086ed5), to(#055db5));
		background: -webkit-linear-gradient(#086ed5, #055db5);
		background: -moz-linear-gradient(#086ed5, #055db5);
		background: -o-linear-gradient(#086ed5, #055db5);
		background: linear-gradient(#086ed5, #055db5) !important;
	}
	.navbar-header1{
		margin-top: -10px;
	}
	.navbar-nav a:hover {
		color: blue !important;
	}
	.navbar{
		margin: 0;
	}
	
	.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
	    color: black;
	    background-color: #00BFFF;
	}
	.nav-bg-color{
		/* background: antiquewhite; */
		/* Firefox 3.6+ */ 
		background: -moz-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Safari 4-5, Chrome 1-9 */ 
		background: -webkit-gradient(linear, left top, right top, from(#FFFAF0), color-stop(0.25, #87CEFA), color-stop(0.5, #7FFFAA), color-stop(0.75, #FAEBD7), to(#FFDAB9)); 
		/* Safari 5.1+, Chrome 10+ */ 
		background: -webkit-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Opera 11.10+ */ 
		background: -o-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9);
	}
	
	.navbar-inverse {
		/* background: antiquewhite; */
		/* Firefox 3.6+ */ 
		background: -moz-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Safari 4-5, Chrome 1-9 */ 
		background: -webkit-gradient(linear, left top, right top, from(#FFFAF0), color-stop(0.25, #87CEFA), color-stop(0.5, #7FFFAA), color-stop(0.75, #FAEBD7), to(#FFDAB9)); 
		/* Safari 5.1+, Chrome 10+ */ 
		background: -webkit-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Opera 11.10+ */ 
		background: -o-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9);
	    border-color: transparent;
	}
	.nav-pills > li > a:hover{
		color:gold;
		background-color: #00BFFF;
	}
	.navbar-inverse .navbar-nav>.active>a, .navbar-inverse .navbar-nav>.active>a:focus, .navbar-inverse .navbar-nav>.active>a:hover {
	    background-color: #00BFFF;
	}
	.navbar-inverse .navbar-nav > li > a:focus, .navbar-inverse .navbar-nav > li > a:hover {
	    color: blue;
	    background-color: white;
	}
	.navbar-inverse .navbar-toggle .icon-bar {
	    background-color: gray;
	}
	.navbar-inverse .navbar-toggle:focus, .navbar-inverse .navbar-toggle:hover {
	    background-color: transparent;
	}
	.navbar-inverse .navbar-brand:focus, .navbar-inverse .navbar-brand:hover {
	    color: blue;
	}
</style>

<style>
	.hotarea{
		height: 300px;
	}
	.nav-bar{
		height : 50px;
		line-height : 50px;
		/* background :antiquewhite; */
		/* Firefox 3.6+ */ 
		background: -moz-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Safari 4-5, Chrome 1-9 */ 
		background: -webkit-gradient(linear, left top, right top, from(#FFFAF0), color-stop(0.25, #87CEFA), color-stop(0.5, #7FFFAA), color-stop(0.75, #FAEBD7), to(#FFDAB9)); 
		/* Safari 5.1+, Chrome 10+ */ 
		background: -webkit-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9); 
		/* Opera 11.10+ */ 
		background: -o-linear-gradient(left, #FFFAF0, #87CEFA, #7FFFAA, #FAEBD7, #FFDAB9);
	}
</style>
</head>
<body>
	<header class="header"></header>
	<aside class="">
		<ul class="nav nav-pills nav-justified nav-bg-color  hidden-xs navTitle">
		  <li class="active"><a href="${pageContext.request.contextPath}/index">首页</a></li>
		  <li><a href="#">SVN</a></li>
		  <li><a href="#">iOS</a></li>
		  <li><a href="#">VB.Net</a></li>
		  <li><a href="#">Java</a></li>
		</ul>
		<!-- 顶部固定栏 -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
		    <div class="container">
		      	<div class="navbar-header container">
		      		<!-- 隐藏导航栏 -->
			        <button class="navbar-toggle" data-toggle="collapse" data-target="#myCollapse">
			          <span class="icon-bar bg-color-bar"></span><span class="icon-bar bg-color-bar"></span><span class="icon-bar bg-color-bar"></span>
			        </button>
			        <!-- logo -->
			        <a href="${pageContext.request.contextPath}/users/user/management" class="navbar-brand navbar-header1"><img src="${pageContext.request.contextPath}/static/images/bg/logo1.png" class="img-circle" height="40" width="40"/></a>              
				    <!-- 搜索 -->
				    <form  id="form1">
					    <span class="navbar-brand">
					    	<input type="text" name="keyword" style="border-radius: 5px; font-size:15px;text-align:center;" placeholder="输入关键字"/>
					    	<span class="glyphicon glyphicon-search" style="cursor:pointer;" id="search1"></span>
					    </span>
				    </form>
		      		<!-- 登陆注册 -->
		      		<div class="navbar-text navbar-right">
		      			<a href="${pageContext.request.contextPath}/users/user/orderItems/cart"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a>
		      			<%-- <a href="${pageContext.request.contextPath}/users/user/orderItems/confirmOrder"><span class="glyphicon glyphicon-lock">订单</span></a> --%>
		      			<a href="${pageContext.request.contextPath}/register/register"><span class="glyphicon glyphicon-registration-mark">注册</span></a>
						<a href="${pageContext.request.contextPath}/loginUI"><span class="glyphicon glyphicon-user"></span>登录</a>
        				<a href="${pageContext.request.contextPath}/users/user/management"><span class="glyphicon glyphicon-home"></span>我的</a>
        				<a href="${pageContext.request.contextPath}/loginUI/loginOut"><span class="glyphicon glyphicon-remove-circle"></span>退出</a>
		      		</div>
		      		<!-- 隐藏导航 -->
				    <div class="collapse navbar-collapse" id="myCollapse">
				        <ul class="nav navbar-nav hidden-lg hidden-md hidden-sm navTitle">
				          <li class="active"><a href="${pageContext.request.contextPath}/index">首页</a></li>
						  <li><a href="#">SVN</a></li>
						  <li><a href="#">iOS</a></li>
						  <li><a href="#">VB.Net</a></li>
						  <li><a href="#">Java</a></li>
				        </ul>
			      	</div>
			    </div>
			</div>
		</nav>
		<div class="hotarea"></div>
	</aside>
	<article class="content-main">
		<div class="nav-bar">
			<!-- 二级导航选择 -->
			<span class="navbar-brand" style="font-size:15px;">
				<span>属性 :</span>
				<span><select class="secondcatalog" name="scid" style="border-radius: 5px;"></select></span>
				<button id="moreselect" class="btn btn-default btn-sm hidden" data-toggle="modal" data-target="#myModal">筛选</button>
			</span>
			<!-- 筛选模态框 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title text-center" id="myModalLabel">--------更多筛选--------</h4>
			            </div>
				        <div class="modal-body"><!-- 生成属性值用于勾选，作为筛选条件 -->
			           		<form role="form" id="form-moreselect">
				            	<div class="form-group secondvalues">
									<label class="checkbox checkbox-inline">
								    	<input type="checkbox"  value="option1">游戏
								    </label>
								    <label class="checkbox checkbox-inline">
								    	<input type="checkbox"  value="option2">摄影
								    </label>
								    <label class="checkbox checkbox-inline">
								    	<input type="checkbox"  value="option3">旅游
								    </label>
								</div>
				            	<div class="form-control" id="price-group">
				            		<!-- 价格输入框需要验证 -->
				            		<span>价格：</span>
				            		<input type="text" class=" text-center" name="min-price" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"/>
				            																					~
				            		<input type="text" class=" text-center"  name="max-price" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"/>
				            	</div>
			            	</form>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			                <button type="button" class="btn btn-primary" id="moreselect-sure">确认</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal -->
			</div>
			<!-- 二级搜索 -->
			<form id="form2">
				<input type="hidden" name="cid" value="${cid}"/>
				<span class="navbar-brand">
			    	<input type="text" name="keyword" style="border-radius: 5px; font-size:15px;width:100px;text-align:center;" placeholder="输入关键字"/>
			    	<span class="glyphicon glyphicon-search" style="cursor:pointer;" id="search2"></span>
			    </span>
			</form>
		</div>
		
	</article>
	<footer class="footer">@CopyRight for XIYE</footer>
	<script>
		var ls = "";							//一级目录的数据
		var countls = 0;					//加载区域个数上限
		var index = 0;						//加载哪一个区域的数据下标
		$(function(){
			$("#myCarousel").carousel('cycle');
			//-------------------------------------一级目录----------------------------------------
			var url = sys.contextPath+"/catalog.do";
			request.ajax(url, "", true, function(data){
				$(".navTitle").children().not(":first").remove();
				$('.content-main').children().not(":first").remove();
				ls = data.rows;												//全局。记录一级目录数据
				countls = data.total;										//全局。记录一级导航个数
				for(var i in ls){
					//生成一级目录
					$(".navTitle").append('<li id="'+ls[i].cid+'"><a href="'+(sys.contextPath+"/show/catalogs/"+ls[i].cid)+'">'+ls[i].cname+'</a></li>');
					//先加载第一块区域
					/* if(i == 0){					
						getData();
					} */
				}
				$(".navTitle").children().each(function(){
					//console.log($(this))
					if($(this).attr("id") == $('input[name="cid"]').val()){
						$(this).attr("class", "active");
					}else{
						$(this).removeClass();
					}
				});
				getData();
			});
			//----------------------------------------二级目录-------------------------------------
			var url1 = sys.contextPath+"/secondCatalog.do";
			var param = {"cid": $('input[name="cid"]').val()};
			request.ajax(url1, param, true, function(data){
				var $it = $(".secondcatalog");
				$it.children().remove();
				var ls = data.rows;
				$it.append('<option  value="0">全部</option>');
				for(var i in ls){
					$it.append('<option  value="'+ls[i].scid+'">'+ls[i].scname+'</option>');
				}
			});
			
			//---------------------------------------滚动加载数据----------------------------------
			function getData() {
				//获取第index块区域
				var url1 = sys.contextPath+"/getProduct.do";
				var param = {"cid" : $('input[name="cid"]').val()};
				request.ajax(url1, param, true, function(data){
					var lss = data.rows;
					if(data.total > 0)
						insertDiv(lss);
				});
				//控制有效数据区域
				/* if(index < countls)
					index++; */
            }
			//生成有效区域
            function insertDiv(lss) {
				var html = "";
				html += '<div class="row">';
				for(j in lss){
					html += '<div class="col-md-3 hidden-md hidden-sm" style="padding: 20px 10px;">'+
										'<a href="'+(sys.contextPath+"/show/product/"+lss[j].id)+'">'+
										'<img src="'+ (sys.contextPath+"/static/"+lss[j].image)+'" width="100%" height="300px">'+
										'<div class="text-center div-height-50"><div>'+lss[j].name+'</div><div>商品价：'+lss[j].price+'</div></div></a>'+
									'</div>';
								
					html += '<div class="col-md-12 hidden-lg hidden-xs" style="padding: 20px 10px;">'+
										'<a href="'+(sys.contextPath+"/show/product/"+lss[j].id)+'">'+
										'<img src="'+ (sys.contextPath+"/static/"+lss[j].image)+'" alt="暂无图片" width="50%" height="300px">'+
										'<div class="text-center div-height-300 pull-right"><div>'+lss[j].name+'</div><div>商品价：'+lss[j].price+'</div></div></a>'+
								 	'</div>';
				}
				html = html +'</div>';
				$('.content-main').append(html);
            }
 
            //==============核心代码=============
           	//页面可视区域高度
            var winH = $(window).height();
            //定义鼠标滚动事件
            $(window).scroll(function () {
            	//当前文档总高度
                var pageH = $(document.body).height();
                //滚动条滚动高度
                var scrollT = $(window).scrollTop(); 
                //差值，及滚动的距离
                var aa = (pageH - winH - scrollT);
                if (aa < 0.02 && index < countls) {//0.02是个参数
                    /* getData(); */
                }
            });
            
            
            
            //----------------------------search------------------------------
            //=========一级搜索========
            $("#search1").click(function(){
            	var url = sys.contextPath+"/search.do";
            	var params = {"keyword" : $(this).parent().find('input[name="keyword"]').val()};
            	request.ajax(url, params, true, function(data){
        			$('.content-main').children()./* not(":first"). */remove();
        			var lss = data.rows;
        			console.log(lss);
        			
					$(".hotarea").remove();
					$("article").children().remove();
					//insertDivAfterSeach(lss);
					
					if(data.total > 0)
						insertDiv(lss);
				});
            	//$("#form1").attr("action", (sys.contextPath+"/search.do")).submit();
            });
            //=========二级搜索========
            $("#search2").click(function(){
            	var url = sys.contextPath+"/search.do";
            	var params = {"keyword" : $(this).parent().find('input[name="keyword"]').val()};
            	params["cid"] = $('input[name="cid"]').val();
            	if($(".secondcatalog").val() != 0){
            		params["sid"] = $(".secondcatalog").val();
            	}
            	request.ajax(url, params, true, function(data){
        			$('.content-main').children().not(":first").remove();
        			var lss = data.rows;
        			console.log(lss);
					if(data.total > 0)
						insertDiv(lss);
				});
            	//$("#form2").attr("action", (sys.contextPath+"/search.do")).submit();
            });
            
            
            //-----------------------------------------------------------------
            $(".secondcatalog").on("change", function(){
            	$('.content-main').children().not(":first").remove();
            	var url1 = sys.contextPath+"/getProduct.do";
				var param;
				if($(this).val() == 0){
					//=================moreselect=================
					$("#moreselect").addClass("hidden");
					param = {"cid" : $('input[name="cid"]').val()};
				} else{
					$("#moreselect").removeClass("hidden");
					param = {"sid" : $(this).val()};
				}
				request.ajax(url1, param, true, function(data){
					var lss = data.rows;
				 	//console.log(lss)
					if(data.total > 0)
						insertDiv(lss);
				});
				//===================更多筛选==================
				if($(this).val() != 0){
					var url2 =  sys.contextPath+"/secondValue.do";
					request.ajax(url2, param, true, function(data){
						$(".secondvalues").children().remove();
						var lss = data.rows;
						for(var j in lss){
							if(lss[j].value == null || lss[j].value == ""){
								//去除空值属性
								continue;
							}
							var html = '<label class="checkbox checkbox-inline">'+
												'<input type="checkbox"  value="'+lss[j].attrid+'"><span>'+lss[j].value
											 '</span></label>';

							$(".secondvalues").append(html);
						}
					});
				}
            });
            
            
            //=====================2019-05-23========================
            $("#moreselect-sure").click(function(){
            	var content = "";
            	var params = {};
            	var minprice = $("#price-group").find('input[name="min-price"]').val();
            	var maxprice = $("#price-group").find('input[name="max-price"]').val();
            	if(parseInt(minprice) > parseInt(maxprice)){
            		alert("最低价格不能高于最高价格。。。。。");
            		return;
            	}
            	
            	$(".secondvalues").children().each(function(){
            		if($(this).find('input[type="checkbox"]').prop("checked")){
            			content += $(this).find("span").text() + ",";
            		}
            	});
            	if(content == null || content == ""){
            		return;
            	}
            	params["content"] = content;
            	params["min-price"] = minprice;
            	params["max-price"] = maxprice;
            	params["sid"] = $(".secondcatalog").val();
        		//----------------------------------
        		var url = sys.contextPath+"/searchmore.do";
        		request.ajax(url, params, true, function(data){
        			$('.content-main').children().not(":first").remove();
        			var lss = data.rows;
					if(data.total > 0)
						insertDiv(lss);
				});
        		//---------------------------
        		
        		$(this).attr("data-dismiss","modal");
            });
            //------------------------------移除旧记录-----------------------------
            $("#moreselect").click(function(){
            	$(".secondvalues").children().each(function(){
            		$(this).find('input[type="checkbox"]').prop("checked", false);
            	});
        		$('input[name="min-price"]').val("");
        		$('input[name="max-price"]').val("");
        		$("#moreselect-sure").removeAttr("data-dismiss");
            });
            //--------------------------验证价格区间------------------------------
            $("#price-group").find('input[type="text"]').on("change", function(){
            	var minprice = $("#price-group").find('input[name="min-price"]').val();
            	var maxprice = $("#price-group").find('input[name="max-price"]').val();
            	if($(this).attr("name") == "min-price"){
            		if(maxprice != "" && parseInt(minprice) > parseInt(maxprice)){
            			alert("最低价格不能高于最高价格。。。。。");
            			//$("#price-group").find('input[name="min-price"]').val(parseInt(maxprice)-1);
            		}
            	}else if($(this).attr("name") == "max-price"){
            		if(minprice != "" && parseInt(minprice) > parseInt(maxprice)){
            			alert("最高价格不能低于于最低价格。。。。。");
            			//$("#price-group").find('input[name="max-price"]').val(parseInt(minprice)+1);
            		}
            	}
            });
            //------------------------------------------------------------------------
		});
	</script>
</body>
</html>