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
��ü��: ${company.companyName }
��ǰ��: <form:input path="goodsName" id="goodsName" placeholder=""/><br>
���� �̹���: <input type= "file" id="goodsMainImg" /><br><br>
�� �̹���: <input type= "file" id="goodsDetailImg" /><br><br>
�󼼳��� : <form:input path = "text" placeholder=""/><br>
���ǻ��� : <form:input path = "text" placeholder="ex: ����� �� ������ �Ƶ��� �ӻ�� �̿� �Ұ��� ��"/><br>
���� : <form:input path = "text" placeholder=""/><br>
��ǰ�ݾ� : <form:input path = "text" placeholder=""/><br>

<input type ="submit" value="��Ͻ�û" id="submit1" />
<input type="reset" name="reset" value="�ٽ��ۼ�">
<input type ="button" value="��Ͼ���"	
				onclick="javascript:location.href='main'" />

</form:form>

</body>
</html>