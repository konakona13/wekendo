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
<title>상품상세</title>
</head>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
</script>
<body>
<h1>>구매번호  ${goodsDetail.goodsNum } 의 상세내용</h1><br>
상품명 : ${goodsDetail.goodsName }<br>
판매사명 : ${goodsDetail.companyName }<br>
상품원가 : ${goodsDetail.goodsPrice }<br>
상품재고 : ${goodsDetail.goodsStock }<br>
상품등록일 : 
<fmt:formatDate value="${goodsDetail.goodsRegDate }" pattern="yyyy년 MM월 dd일" /><br>
상품상세설명 : ${goodsDetail.goodsDetail }<br>
주의사항 : ${goodsDetail.goodsDanger }<br>
상품상태 : ${goodsDetail.goodsStatus }<br>
</body>
</html>