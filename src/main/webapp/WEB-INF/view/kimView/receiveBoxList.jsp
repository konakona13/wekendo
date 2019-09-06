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
편지함

<div class = "container">

	<table border ="1" class="table table-striped">
		<tr>
			<td>보낸 날짜 </td>
			<td>보내는 사람 </td>
			<td>받는 사람 </td>
			<td>내용 </td>
			
		</tr>
<!--<c:if test="${! empty receiveBox}"> -->		
	<c:forEach var="receiveBox" items="${receiveBox}">
		<tr>
			<td>${receiveBox.letterDate}</td>
			<td>${receiveBox.letterSender}</td>
			<td>${receiveBox.letterReceiver}</td>
			<td>${receiveBox.letterContent}</td>
		</tr>
	</c:forEach>
<!--</c:if> -->		
	</table>
	
</div>
<br/>               
    
<a href="#" onClick="self.close();">닫기</a>
</body>
</html>