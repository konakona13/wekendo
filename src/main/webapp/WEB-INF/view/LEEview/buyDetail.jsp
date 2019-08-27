<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매상세</title>
</head>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
</script>
<body>
<h1>>구매번호  ${buyDetail.buyNum } 의 상세내용</h1><br>
구매(이용)날짜 : <br>
<fmt:formatDate value="${buyDetail.startDate }" pattern="yyyy년 MM월 dd일" /> 
~ <fmt:formatDate value="${buyDetail.endDate }" pattern="yyyy년 MM월 dd일" /> <br>
대여일수 : ${buyDetail.buyDays }<br>
</body>
</html>