<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,Model.DTO.YYYDTO.*" %>
<%
	List<ThemeMedium> result3 = (List<ThemeMedium>)request.getAttribute("result3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 중분류</title>
</head>
<body>

	<div>
		<select id="themeMedium" name="themeMNum" onchange="themeM(this.value)">
		<option value= 0 > --- 중분류를 선택하여주세요 --- </option>
		<% for(ThemeMedium ee : result3) { %>
		
		 <option value= "<%= ee.getThemeMNum() %>"> <%= ee.getThemeMName() %></option>
		
		<% } %>
	   </select>
	  </div>

</body>
</html>