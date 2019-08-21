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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
admin 보낸 편지함

<div>

	<table border ="1">
		<tr>
			<td>보낸 날짜 </td>
			<td>보내는 사람 </td>
			<td>받는 사람 </td>
			<td>내용 </td>
			
		</tr>
<!--<c:if test="${! empty letters}"> -->		
	<c:forEach var="letter" items="${letters}">
		<tr>
			<td>${letter.letterDate}</td>
			<td>${letter.letterSender}</td>
			<td>${letter.letterReceiver}</td>
			<td>${letter.letterContent}</td>
		</tr>
	</c:forEach>
<!--</c:if> -->		
	</table>
	
</div>
<br/>               
    
<a href="kim" >메인</a>
</body>
</html>