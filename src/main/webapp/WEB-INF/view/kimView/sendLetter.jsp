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
        <h3>활동선택확인</h3>
        <p>
 <div>       
<form name="frm" action="sendLetterAction" method="POST">


	<table border ="1">
		<tr>
			<td>보내는 사람 </td>
			<td><input type="text" name = "letterSender"></td>
		</tr>
		<tr>
			<td>받는 사람 </td>
			<td><input type="text" name = "letterReceiver"></td>
		</tr>
		<tr>
			<td>내용 </td>
			<td><input type="text" name = "letterContent"></td>
		</tr>		
	</table>

<input type = "submit" value = "발송" name = "sendLetterAction"/>
 </form>
 </div>
</body>
</html>