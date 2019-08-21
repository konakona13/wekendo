<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,Model.DTO.YYYDTO.*" %>
<%
	List<MapLarge> result = (List<MapLarge>)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 대분류 (메인)</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	function mapL(val){
		$.ajax({
			type:"POST",
			url :"mapM",
			data: "mapLNum=" +val,
			datatype: "html",
			success: function(data1){
				$("#mapMedium").html(data1);
				$("#mapSmall").html("");//a테이블 선택 변경시 c테이블 나오지않도록
			}
		});
	}
	
	function mapM(val){
		var aval = $("#mapLarge").val(); // a테이블에서 aNum 가져오기
		$.ajax({
			type:"POST",
			url :"mapS",
			data: "mapMNum=" +val + "&mapLNum="+ aval ,
			datatype: "html",
			success: function(data){ 
				$("#mapSmall").html(data); //aNum 가져와서 c테이블에 넘기기
			}
		});
		
	}

</script>
</head>
<body>


<div>

	<select id="mapLarge" name="mapLNum" onchange="mapL(this.value)"> <!-- this.value는 <option value="1"> 의  value값을 뜻함 -->
		<option value= 0 > --- 시를 선택하여주세요 --- </option>
		<% for(MapLarge aa : result ) { %>
		
		 <option value= "<%= aa. getMapLNum() %>"> <%= aa.getMapLName() %></option>
		
		<% } %>

	</select>
</div>

	
	<div id="mapMedium"></div>
	<div id="mapSmall"></div>

<!-- <select name='MapLarge'>
  <option value='' selected>-- 지역선택 --</option>
  <option value='서울'>서울</option>
  <option value='경기'>경기</option>
  <option value='인천'>인천</option>
  <option value='인천'>대전</option>
  <option value='인천'>대구</option>
  <option value='인천'>부산</option>
  <option value='인천'>광주</option>
  <option value='인천'>제주</option>
</select> -->




</body>
</html>