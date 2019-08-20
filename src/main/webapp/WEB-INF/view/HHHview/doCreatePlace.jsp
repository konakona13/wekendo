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
      
    <c:forEach var="placeGoods" items="${list}">
    <div>
   		 이름 : <a href="placeDetail?num=${placeGoods.goodsNum }">${placeGoods.goodsName }</a>
   		
   		 
    </div>
    </c:forEach>
    
    
</body>
</html>