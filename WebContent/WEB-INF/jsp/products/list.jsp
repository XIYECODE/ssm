<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>产品列表</title>
</head>
<body>
    <table>
        <c:forEach items="${products}" var="product" varStatus="loop">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDiscount()}</td>
            <%-- <c:forEach items="${product.getSecondCatalog()}" var="s">
                <td>${s.getScid()}</td>
                <td>${s.getScname()}</td>
                <td>${s.getCkid()}</td>
            </c:forEach> --%>
            <c:forEach items="${product.getAttribute()}" var="a">
                <td>${a.getAttrid()}</td>
                <td>${a.getValue()}</td>
                <td>${a.getSkid()}</td>
                <td>${a.getPkid()}</td>
            </c:forEach>
        </tr>
        </c:forEach>
    </table>
</body>
</html>