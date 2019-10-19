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
		background : antiquewhite ;
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
		color : white;
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
</head>
<body>
    <div class="container hidden">               <!--  将contianer放在 nav标签内可以保证导航栏在 左右方向上覆盖住整个窗口 -->
      <div class="navbar-header1">
        <a href="#" class="navbar-brand"><img src="img/book1.jpg" class="img-circle" height="40" width="40"/></a>
      </div>
      <form class="navbar-form navbar-left">
        <div class="input-group">                  
          <input type="text" class="form-control" style="320px" placeholder="search your xxx"/>
          <span class="input-group-addon"><a href="#"><span class="glyphicon glyphicon-search"></span></a></span>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${pageContext.request.contextPath}/users/user/orderItems/cart"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a></li>
        <li><a href="${pageContext.request.contextPath}/register/register"><span class="glyphicon glyphicon-registration-mark">注册</span></a></li>
        <li><a href="${pageContext.request.contextPath}/loginUI"><span class="glyphicon glyphicon-user"></span>登录</a></li>
        <li><a href="${pageContext.request.contextPath}/users/user/management"><span class="glyphicon glyphicon-home"></span>我的</a></li>
      </ul>
    </div>
	<header class="header"></header>
	<aside class="">
		<ul class="nav nav-pills nav-justified nav-bg-color  hidden-xs navTitle">
		  <li class="active"><a href="#">首页</a></li>
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
				          <li class="active"><a href="#">首页</a></li>
						  <li><a href="#">SVN</a></li>
						  <li><a href="#">iOS</a></li>
						  <li><a href="#">VB.Net</a></li>
						  <li><a href="#">Java</a></li>
				        </ul>
			      	</div>
			    </div>
			</div>
		</nav>
		<!-- 轮播图 -->
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>   
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/static/images/title/title1.jpg"/>
					<div class="carousel-caption">服装系列</div>
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/static/images/title/title2.jpg"/>
					<div class="carousel-caption">零食系列</div>
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/static/images/title/title4.jpg"/>
					<div class="carousel-caption">日常系列</div>
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			</a>
		</div>
	</aside>
	<article class="content-main">
		<div class="div-height-30"></div>
		<div class="">
			<span class="font-size-big">热销区</span>
			<div class="grad-blue"></div>
			<div class="row">
				<div class="col-md-3" style="padding: 20px 10px;">
					<img src="img/book1.jpg" width="100%" height="300px">
					<div class="text-center div-height-50">描述</div>
				</div>
				<div class="col-md-3" style="padding: 20px 10px;">
					<img src="img/book1.jpg" width="100%" height="300px">
					<div class="text-center div-height-50">描述</div>
				</div>
				<div class="col-md-3" style="padding: 20px 10px;">
					<img src="img/book1.jpg" width="100%" height="300px">
					<div class="text-center div-height-50">描述</div>
				</div>
				<div class="col-md-3" style="padding: 20px 10px;">
					<img src="img/book1.jpg" width="100%" height="300px">
					<div class="text-center div-height-50">描述</div>
				</div>
			</div>
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
				console.log(data)
				$(".navTitle").children().not(":first").remove();
				$('.content-main').children().remove();
				ls = data.rows;												//全局。记录一级目录数据
				countls = data.total;										//全局。记录一级导航个数
				for(var i in ls){
					//生成一级目录
					$(".navTitle").append('<li id="'+ls[i].cid+'"><a href="'+(sys.contextPath+"/show/catalogs/"+ls[i].cid)+'">'+ls[i].cname+'</a></li>');
					//先加载第一块区域
					if(i == 0){
						getData();
					}
				}
			});
			
			//---------------------------------------滚动加载数据----------------------------------
			function getData() {
				//获取第index块区域
				var url1 = sys.contextPath+"/getProduct.do";
				var param = {"cid" : ls[index].cid};
				request.ajax(url1, param, true, function(data){
					var lss = data.rows;
					if(data.total > 0)
						insertDiv(lss);

					//控制有效数据区域
					if(index < countls)
						index++;
				});
            }
			//生成有效区域
            function insertDiv(lss) {
				var html = "";
            	html = '<div class="div-height-30">'+
            					'</div><div id="area"'+index+'>'+
								'<span class="font-size-big">'+ls[index].cname+'区</span>'+
								'<div class="grad-purple"></div><div class="row">';
				for(j in lss){
					if(j>=4){
						break;
					}
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
				html = html +'</div></div>';
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
                //var aa = (pageH - winH - scrollT);
                var aa = (pageH - scrollT)/pageH;
                //alert(aa)
                //遗留问题：为什么会执行两次，从而导致每一次出现不一样的效果
                if (aa < 0.8&& index < countls) {//0.02是个参数
                    getData();
                }
            });
            
            
            
            //----------------------------search------------------------------
            $("#search1").click(function(){
            	var url = sys.contextPath+"/search.do";
            	var params = {"keyword" : $(this).parent().find('input[name="keyword"]').val()};
            	request.ajax(url, params, true, function(data){
        			//$('.content-main').children().not(":first").remove();
        			var lss = data.rows;
        			console.log(lss);
        			/* 该如何渲染页面 */
					/* if(data.total > 0)
						insertDiv(lss); */
						
					$("aside").children().eq(2).remove();
					$("article").children().remove();
					insertDivAfterSeach(lss);
				});
            	//$("#form1").attr("action", (sys.contextPath+"/search.do")).submit();
            	
            	function insertDivAfterSeach(lss) {
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
            });
		});
	</script>
</body>
</html>