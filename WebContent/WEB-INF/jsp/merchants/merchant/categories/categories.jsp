<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>目录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/static/js/request.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery/jQuery-2.2.0.min.js"></script><!-- 导入jQuery -->
<script  type="text/javascript">
  	$(function(){
  	  	sys = {};				//没有var定义，是一个全局变量
  	  	sys.contextPath = "${pageContext.request.contextPath}";
  	});
</script>
<style>  
	.menu {width:30%; background:#0099FF; font-size:14px; font-family: "微软雅黑";float:left;}  
	.menu ul {padding:0px; list-style-type:none;margin:0;}  
	.menu ul li {width:100%; height:35px; line-height:35px; text-align:center;color:#fff;}  
	.menu ul li a {text-decoration:none; color:#fff; display:block;}  
	.menu ul li:hover {background:#5cb85c; color:#f0ad4e;cursor:pointer;} 
</style>
</head>
 
<body style="background:#fff; color:#000;margin:0;">
<div style="margin-left:10%;margin-top:0;">
	<div class="menu">  
	  <ul class="firstnav">  
	    <li class="bg-primary">+</li>
	  </ul>  
	</div>
	<div class="menu">  
	  <ul class="secondnav">  
	    <li class="bg-primary">+</li>
	  </ul>  
	</div><!-- 
	<div class="menu">  
	  <ul class="valuenav">  
	    <li class="bg-primary">+</li>
	  </ul>  
	</div> -->
</div>
<!-- 更新模态框 -->
<div class = "bg-model-update" style="position:absolute;top:0%;left:0%;display:none;background:rgba(0,0,0,0.3);width:100%;height:100%;position:fixed;z-index:9999">
	<div class = "content bg-info"  style="position: absolute;left: 35%;top: 25%;border-radius: 8px;width: 30%;">
		<div class="form-group has-success">
			<div class="text-center bg-info" style="height:50px; line-height:50px;border-radius: 8px;color:#0099FF;">更新目录</div>
			<input type="hidden"  id="bg-model-update-id"/>
	    	<input type="text" class="form-control" id="bg-model-update-input"  name="value" style="text-align:center;">
			<br/><button type="submit" class="btn btn-primary  btn-block bg-model-update-ok">Update</button>
			<button type="submit" class="btn btn-default  btn-block bg-model-update-cancel">Cancel</button>
		</div>
	</div>
</div>
<!--添加模态框 -->
<div class = "bg-model-add" style="position:absolute;top:0%;left:0%;display:none;background:rgba(0,0,0,0.3);width:100%;height:100%;position:fixed;z-index:9999">
	<div class = "content bg-info"  style="position: absolute;left: 35%;top: 25%;border-radius: 8px;width: 30%;">
		<div class="form-group has-success">
			<div class="text-center bg-info target-div" style="height:50px; line-height:50px;border-radius: 8px;color:#0099FF;">添加目录</div>
			<input type="hidden"  id="bg-model-add-name"/>
			<input type="hidden"  id="bg-model-add-id"/>
			<button type="submit" class="btn btn-primary  btn-block bg-model-add-ok">Add</button>
			<button type="submit" class="btn btn-default  btn-block bg-model-update-cancel">Cancel</button>
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/merchant/categories.js"></script>
</body>
</html>