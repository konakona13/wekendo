<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "YYYView/js/jquery.form.js"></script>
<script>
	//도미노
	   $(function(){
	      $.ajax({
	         type:"POST",
	         url :"mapL",
	         datatype: "html",
	         success: function(data1){
	            $("#mapMain").html(data1);
	         }
	      });
	   
	      $.ajax({
	         type:"POST",
	         url :"themeL",
	         datatype: "html",
	         success: function(dataTheme1){
	            $("#themeMain").html(dataTheme1);
	         }
	      });
	   })

</script>
<script type="text/javascript">

	var oTbl;
	var i = 1;
	//Row 추가
	function insRow() {
	oTbl = document.getElementById("addTable");
	var oRow = oTbl.insertRow();
	oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	var oCell = oRow.insertCell();
	var frmTag;
	if(i < 20){
		var frmTag = "<input type=file name='report' style=width:350px; height:20px;> ";
		frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
		oCell.innerHTML = frmTag;
		i++;
	}
	//삽입될 Form Tag
	
	}
	//Row 삭제
	function removeRow() {
	oTbl.deleteRow(oTbl.clickedRowIndex);
	}
	
	function frmCheck()
	{
	var frm = document.form;
	
	for( var i = 1; i <= frm.elements.length - 1; i++ ){
	   if( frm.elements[i].name == "file" + i )
	   {
	       if( !frm.elements[i].value ){
	           alert("텍스트박스에 값을 입력하세요!");
	               frm.elements[i].focus();
		 return;
	        }
	    }
	 }
	}

</script>
</head>
<body>
	<form:form action="goodsRegAction" name="frm" id="frm" method="POST" commandName="placeRegCommand" enctype="multipart/form-data">
		<h3> 상품 등록 <h3>
		<br><br><br>
		지역선택	 <div id = "mapMain"> </div>  	<br>
		테마선택 	 <div id = "themeMain"> </div>  <br>
		
		회사명: ${comAuth.name} <br><br>
		상품명: <form:input path="goodsName" id="goodsName" placeholder=""/><br><br>
		이미지: <input type= "file" name="report" multiple="multiple" /> 대표 이미지
				 <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
		            <tr><td align="left"></td></tr>
		            <tr><td> <input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가"></td></tr>
		         </table>
		상세내용 : <form:input path = "goodsDetail" placeholder=""/><br><br>
		주의사항 : <form:input path = "goodsDanger" placeholder="ex: 매주 월요일 휴무"/><br><br>
		상품c금액 : <form:input path = "goodsPrice" placeholder=""/><br><br>
		
		<input type ="submit" value="등록신청" id="submit1" onclick="checkCompany()"/>
		<input type="reset" name="reset" value="다시작성">
		<input type ="button" value="등록안함"   onclick="javascript:location.href='goodsMain'" />
	
	</form:form>

</body>
</html>