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
    <script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body>
	${doPlay }
	
	<input type="text" id="goodsKind" name="goodsKind" value="${goodsKind}">
	
    <h1>장소선택?</h1>
     <c:forEach var="placeGoods" items="${list}">
    <div>
   		<p>
    	<c:set var="mainImg" value="true"/>
    	<c:forEach var="Imgs" items="${goodImgs}">
    	 <c:if test="${Imgs.companyNum eq placeGoods.companyNum && placeGoods.goodsNum eq Imgs.goodsNum && mainImg }">
    	 이미지 : <img alt="" src="YYYView/upload/${Imgs.goodsImgName }" width="200px" >
    	 <c:set var="mainImg" value="false"/>
    	 </c:if>
    	</c:forEach>
    	</p>
   		 이름 : <a href="placeDetail?num=${placeGoods.goodsNum }&goodsKind=${goodsKind}&startDate=${startDate}&endDate=${endDate}">${placeGoods.goodsName }</a>
   		<p>
    	가격 : ${placeGoods.goodsPrice }
    	</p>
    	<p>
    	 <c:forEach var="company" items="${companyList}">
    	 <c:if test="${placeGoods.companyNum eq company.companyNum }">
    	 업체명 : ${company.companyName }
    	 </c:if>
    	
    	</c:forEach>
    	
    	</p>
   	
   	</div>
    </c:forEach>
    
    
</body>
</html>