<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,Model.DTO.YYYDTO.*" %>
<%
	List<ThemeSmall> result4 = (List<ThemeSmall>)request.getAttribute("result4");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 소분류</title>
</head> 
<body>
		<select id="themeSmall" name="themeSNum" onchange="themeS(this.value)">
		<option value= 0 > --- 소분류를 선택하여주세요 --- </option>
		<% for(ThemeSmall ff : result4) { %>
		
		 <option value= "<%= ff.getThemeSNum() %>"> <%= ff.getThemeSName() %></option>
		
		<% } %>
		
		</select>
</body>
</html>