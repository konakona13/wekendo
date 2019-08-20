<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" 
				uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form:form action="goodsRegistAction" name="frm" id="frm" method="POST" commandName="placeGoodsRegCommand">
업체명: ${company.companyName }
상품명: <form:input path="goodsName" id="goodsName" placeholder=""/><br>
메인 이미지: <input type= "file" id="goodsMainImg" /><br><br>
상세 이미지: <input type= "file" id="goodsDetailImg" /><br><br>
상세내용 : <form:input path = "text" placeholder=""/><br>
주의사항 : <form:input path = "text" placeholder="ex: 노약자 및 미취학 아동과 임산부 이용 불가능 등"/><br>
수량 : <form:input path = "text" placeholder=""/><br>
상품금액 : <form:input path = "text" placeholder=""/><br>

<input type ="submit" value="등록신청" id="submit1" />
<input type="reset" name="reset" value="다시작성">
<input type ="button" value="등록안함"	
				onclick="javascript:location.href='main'" />

</form:form>

</body>
</html>