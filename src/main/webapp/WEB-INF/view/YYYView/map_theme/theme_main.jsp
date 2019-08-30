<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,Model.DTO.YYYDTO.*" %>
<%
	List<ThemeLarge> result2 = (List<ThemeLarge>)request.getAttribute("result2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 대분류 (메인)</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function themeL(val1){
		//alert($("#themeLarge").val() );
		if($("#themeLarge").val() == "3"){
			$("#themeMedium").html("");
			$("#themeSmall").html("");
		}else{
			$.ajax({
				type:"POST",
				url :"themeM",
				data: "themeLNum=" +val1,
				datatype: "html",
				success: function(dataTheme1){
	                	$("#themeMedium").html(dataTheme1);
		   				$("#themeSmall").html("");
				}
			});
		}
	}
	
	function themeM(val){
		var aval = $("#themeLarge").val(); // a테이블에서 aNum 가져오기
		$.ajax({
			type:"POST",
			url :"themeS",
			data: "themeMNum=" +val + "&themeLNum="+ aval ,
			datatype: "html",
			success: function(data){ 
				$("#themeSmall").html(data);
			}
		});
		
	}

</script>
</head>
<body>


<div>

	<select id="themeLarge" name="themeLNum" onchange="themeL(this.value)">
		<option value= 0 > --- 대분류를 선택하여주세요 --- </option>
		<% for(ThemeLarge dd : result2 ) { %>
		
		 <option id ="LNum" value= "<%= dd.getThemeLNum() %>"> <%= dd.getThemeLName() %></option>
		 
		<% } %>

	</select>
</div>

	
	<div id="themeMedium"></div>
	<div id="themeSmall"></div>


</body>
</html>