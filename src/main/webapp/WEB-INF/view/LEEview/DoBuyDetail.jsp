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
<title>활동상세</title>
</head>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
</script>
<body>
<h1>>활동번호  ${DoBuyDetail.doNum }(${DoBuyDetail.doName }) 의 상세내용</h1><br>
모집날짜 : 
<fmt:formatDate value="${DoBuyDetail.openDate }" pattern="yyyy년 MM월 dd일" /> 
~ <fmt:formatDate value="${DoBuyDetail.closeDate }" pattern="yyyy년 MM월 dd일" /> <br>
활동날짜 :
<fmt:formatDate value="${DoBuyDetail.startDate }" pattern="yyyy년 MM월 dd일" /> 
~ <fmt:formatDate value="${DoBuyDetail.endDate }" pattern="yyyy년 MM월 dd일" /> <br>
활동인원: ${DoBuyDetail.doPP }<br>
활동호스트명 : ${DoBuyDetail.memName } (호스트프로필: <img src="LEEview/upload/${DoBuyDetail.profile }" />)<br>
호스트연락처 : ${DoBuyDetail.memPh }<br>
활동상세 : ${DoBuyDetail.doDetail }<br>
</body>
</html>