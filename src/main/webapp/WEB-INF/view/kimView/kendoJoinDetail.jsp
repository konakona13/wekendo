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
KendoJoin 상세보기

<div>

	<table border ="1">
		<tr>
			<td>DO No.</td>
			<td>${kendoJoin.doNum}</td>			
		</tr>
		<tr>
			<td>DO 이름</td>
			<td>${kendoJoin.doName}</td>			
		</tr>
		<tr>
			<td>DO 시작날짜</td>
			<td>${kendoJoin.doStartDate}</td>			
		</tr>	
		<tr>
			<td>DO 종료날짜</td>
			<td>${kendoJoin.doEndDate}</td>			
		</tr>
		<tr>
			<td>DO 상세설명</td>
			<td>${kendoJoin.doNum}</td>			
		</tr>
		<tr>
			<td>DO 진행상태</td>
			<td>${kendoJoin.doStatus}</td>			
		</tr>
		<tr>
			<td>신청 수량</td>
			<td>${kendoJoin.doNum}</td>			
		</tr>		
		<tr>
			<td>DO 결제금액</td>
			<td>${kendoJoin.doNum}</td>			
		</tr>						
<!--<c:if test="${! empty letters}"> -->		
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
    
<a href="kim" >메인</a>
</body>
</html>