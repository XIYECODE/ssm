<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>测试</title>
<%@ include file="/WEB-INF/jsp/common/extend.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/test.css">
</head>
<body>
	<header>
		<%-- <form action="${pageContext.request.contextPath}/getProduct.do" method="post" name="searchFrame"  target="myIframe">
			<input type="text" name="searchProductContent"/>
		</form> --%>
	</header>
    <div class="s-common-top g-wrap js-common-top">
        <div>
            <ul class="navTitle"><!-- 动态生成li元素class="item js-filter-content" --></ul>
            <ul class="secondList"></ul>
        	<div class="valueListBox"><ul class="valueList"></ul></div>
        </div>
        <div id="productList">
            <iframe name="myIframe"></iframe>
            <form name="hidenForm" method="post"  target="myIframe"></form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/static/js/request.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/catalog.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("input[type=submit]").click(function(){
    			//alert($("input[type=text]").val());
    			var search = $("input[type=text]").val();
    			if(search == null || search == ""){
    				alert("搜索不能为空");
    				return false;
    			}
    			$("form[name=searchFrame]").submit();
    			return false;
    		});
    	});
    </script>
</body>
</html>