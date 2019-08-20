<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1>장소선택?</h1>
    <form action="doCreatePay">
        <ul>
            <li><input type="checkbox"><a href="상세.html">태평양</a></li>
            <li><input type="checkbox"><a href="상세.html">히말라야</a></li>
            <li><input type="checkbox"><a href="상세.html">강원랜드</a></li>

        </ul>

        <input type="submit" value="선택완료">

    </form>
    
    <c:forEach var="placeGoods" items="${list}">
    	이름 : ${placeGoods.goodsName }
    </c:forEach>
    
    
</body>
</html>