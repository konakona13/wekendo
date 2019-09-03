<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="list" items="${list}">


		<p>
			<c:set var="mainImg" value="true" />
			<c:forEach var="Imgs" items="${goodImgs}">
			<c:if test="${Imgs.companyNum eq list.companyNum && list.goodsNum eq Imgs.goodsNum && mainImg }">
				
		    	 이미지 : <img alt="" src="YYYView/upload/${Imgs.goodsImgName }"width="200px">
		    	 
			<c:set var="mainImg" value="false" />
			</c:if>
			</c:forEach>
		</p>
				상품명 : ${list.goodsName}
				회사명 : ${list.companyName}

	</c:forEach>

</body>
</html>