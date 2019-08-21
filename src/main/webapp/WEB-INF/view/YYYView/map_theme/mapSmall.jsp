<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,Model.DTO.YYYDTO.*" %>
<%
	List<MapSmall> list = (List<MapSmall>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 소분류</title>
</head> 
<body>
		<select id="mapSmall" name="mapSNum">
		<option value= 0 > --- 동을 선택하여주세요 --- </option>
		<% for(MapSmall cc : list) { %>
		
		 <option value= "<%= cc. getMapSNum() %>"> <%= cc.getMapSName() %></option>
		
		<% } %>
</body>
</html>