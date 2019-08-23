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
<h2>일반회원 페이지</h2>
<a href="doCreateEnter" >활동개설하기</a> <br/>
<a href="kendoDetail" >활동참가하기</a> <br/>
<a href="kendoJoinList" >(결제리스트)</a> <br/>
<a href="sendLetter" >쪽지보내기</a> <br/>
<a href="receiveBoxList" >받은쪽지함</a> <br/>
<a href="sendBoxList" >보낸쪽지함</a> <br/>

</body>
</html>