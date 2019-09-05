<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	response.setCharacterEncoding("utf-8");
 %>   
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class = "container">

	<table border ="1" class="table table-striped">
		<tr>
			<td>보낸 날짜 </td>
			<td>보내는 사람 </td>
			<td>받는 사람 </td>
			<td>내용 </td>
			
		</tr>
		
		<c:forEach var="letter" items="${letters}">
		<tr>
			<td>${letter.letterDate}</td>
			<td>${letter.letterSender}</td>
			<td>${letter.letterReceiver}</td>
			<td>${letter.letterContent}</td>
		</tr>
		</c:forEach>
		<tr>
			<td align = "center" colspan="4"><a href="#" onClick="self.close();">닫기</a></td>
	
	
	</table>
	
</div>

</body>
</html>