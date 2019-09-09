<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
				uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>활동개설신청서</title>
 <script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
<!-- 부트스트랩 시작 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 끝 -->

   
<script type="text/javascript">

$(function(){
	var openWin;
	var wid = 800;
	var heit = 500;
	$("#selectPlaceBtn").click(function()
	{
		
		var nc = nextcl();
		var ec = endcl(); 
		var url = "doCreatePlace?doPlay="+$("#themeSmall").val()
							  +"&doArea="+$("#mapSmall").val()
							  +"&goodsKind=place"
							  +"&startDate="+nc
							  +"&endDate="+ec; 
		openWin = window.open(url,"장소선택","width="+wid+", height="+heit);
		
	});
	
	$("#selectHotelBtn").click(function()
	{
		var nc = nextcl();
		var ec = endcl(); 
		var thema = $("#themeSmall").val();
		var area  = $("#mapSmall").val();
		var url = "doCreatePlace?doPlay="+thema
							  +"&doArea="+area
							  +"&goodsKind=hotel"
							  +"&startDate="+nc
							  +"&endDate="+ec;
		openWin = open(url,"숙박선택","width="+wid+", height="+heit);
		
		
	});
	
	$("#selectRentBtn").click(function()
	{
		var nc = nextcl();
		var ec = endcl(); 
		var thema = $("#themeSmall").val();
		var area  = $("#mapSmall").val();
		var url = "doCreatePlace?doPlay="+thema
							  +"&doArea="+area
							  +"&goodsKind=rent"
							  +"&startDate="+nc
							  +"&endDate="+ec;
		openWin = open(url,"차량선택","width="+wid+", height="+heit);
		
	});
	
	$("#selectMentoBtn").click(function()
	{
		var nc = nextcl();
		var ec = endcl(); 
		var thema = $("#themeSmall").val();
		var area  = $("#mapSmall").val();
		var url = "doCreatePlace?doPlay="+thema
							  +"&doArea="+area
							  +"&goodsKind=mento"
							  +"&startDate="+nc
							  +"&endDate="+ec;
		openWin = open(url,"멘토선택","width="+wid+", height="+heit);
		
	});
	
	  
	
	$("#submit1").click(function()
	{
		$("#frm").submit();
	});
	
	function themaArea()
	{
		var areaS = $("#mapSmall").val();
		$("#areaSS").val(areaS);
		var themeS = $("#themeSmall").val();
		$("#themeSS").val(themeS);
		
		return $("#areaSS").val();
	}
});



function nextcl() 
{
	var tt = $("#doStartDate").val();
	$("#startDcl").val(tt);
	
	return $("#startDcl").val();
}

function endcl() 
{
	var tt = $("#doEndDate").val();
	$("#endDcl").val(tt);
	
	return $("#endDcl").val();
}


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
		frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'> <br/>";
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

<style>
body {
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}

.container {
	width: 1000px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: black;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	border: 1;
}

ul.tabs li.current {
	background: white;
	color: black;
}

.tab-content {
	display: none;
	background: white;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}


.button {
  font-size: 12px;
  font-weight: 600;
  color: white;
  padding: 6px 25px 0px 20px;
  margin: 10px 8px 20px 0px;
  display: inline-block;
  text-decoration: none;
  width: 100px; height: 27px; 
  -webkit-border-radius: 5px; 
  -moz-border-radius: 5px; 
  border-radius: 5px; 
  background-color: #3a57af; 
  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
  box-shadow: 0 3px rgba(58,87,175,.75);
  transition: all 0.1s linear 0s; 
  top: 0px;
  position: relative;
  text-align: center;
}

.button:hover {
  top: 3px;
  background-color:#2e458b;
  -webkit-box-shadow: none; 
  -moz-box-shadow: none; 
  box-shadow: none;
  
}
</style>  
</head>
<body>

<div class="container">

    <h1>활동개설신청서?</h1>
    	
    	<!-- 새창정보 -->
    	<input type="hidden" id="startDcl" name="startDate">
        <input type="hidden" id="endDcl" name="endDate">
    	<!-- 새창정보 -->
    	<!-- 지역테마정보 -->
    	<input type="hidden" id="themaSS">
		<input type="hidden" id="areaSS">
       
      
        <form:form action="doCreatePay" name = "frm" id = "frm" method="POST"
         enctype="multipart/form-data" commandName="createDoCommand">
          <table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
         
          <tr>
          <td >
     		  	지역선택 </div> 
          </td>
          <td >
     		  	<div id = "mapMain"> </div> 
          </td>
          </tr>
          
          <tr>
          <td>
       	테마선택 	  </div>  
          </td>
          <td>
       	 	 <div id = "themeMain"> </div>  
          </td>
          </tr>
          
          
              		 
                    <tr>
                    	
                        <td width="200">활동명  </td>
                        <td><form:input type="text" path="doName"/></td>
                    </tr>
                   <tr>
                   <td>모집인원</td>
                    <td>  <form:input type="text" path="doPp"/></td>
                   </tr>
                    
                       <tr>
                       <td>모집종료일</td>
                         <td>   <form:input type="date" path="doCloseDate"/></td>
                       </tr>
                   
                   <tr>
                   <td>활동시작일</td>
                    <td>   <form:input path="doStartDate" id="doStartDate" type="date"/></td>
                   </tr>
                    
                   
                  <tr>
                  <td>활동종료일</td>
                   <td>   <form:input path="doEndDate" type="date"/></td>
                  </tr>
                   
                    
                   <tr>
                         <td> 메인이미지 </td>
                         <td><input type="file" name = "mainPhoto"  size = "30" /></td>
                    </tr>
              	
              	 
             		<tr>
                         <td> 상세이미지 </td>
                         <td width="300"><input type= "file" name="report" multiple="multiple" /></td>
                         <td>
                    <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0" >
		            
		            <tr><td> <input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="이미지 추가"></td></tr>
		         </table>
                    </td>
                    </tr>
                   
                  
                   </table>     
                             
				 
               <table class="table table-hover">    
              <tr>
              <td>
             	 상세설명
              </td>
              <td>
               <form:textarea type="text"  rows="8" cols="40"  path="doDetail"/>
              </td>
              </tr>
              		
            
                        
               
             
             <tr>
       		<td>성별제한</td>
       		<td>
                           <form:select id="lg" path="limitGender">
                        <form:option value="무관">무관</form:option>
                     <c:if test="${member.gender eq '남'}">
          				<form:option value="남">남자</form:option>
   					 </c:if>
   					 
   					 <c:if test="${member.gender eq '여'}">
          				<form:option value="여">여자</form:option>
   					 </c:if>
                    
                    
                    
                	</form:select>
                </td>	
       		 </tr>
       		 
             
              <tr>
       		<td>나이제한</td>
       		<td> 
       		  <form:select id="la" path="limitAge">
                    <form:option value="미설정">미설정</form:option>
                    <form:option value="성인">성인</form:option>
                	</form:select></td>
       		 </tr>
           
           
    

            
           <tr>
       		<td>장소 <input type="hidden" id ="doStartDate" /></td>
       		<td><input type="text" id="PlaceName" value="장소이름">
       		<input type="hidden" name="placeNum" id="PlaceNum" value="장소번호">
            		 <input type="hidden" id="placeDays">
            		  <input id="selectPlaceBtn" type="button" value="장소선택">
       		</td>
       		 </tr>
           
            
            	
            <tr>
            <th>숙박</th>
            <td>
            		<input type="text" id="hotelName" value="숙박이름">
            		 <input type="hidden" name="hotelNum" id="hotelNum" value="숙박번호">
            		 <input type="hidden" id="hotelDays">
            		  <input id="selectHotelBtn" type="button" value="숙박선택">
            </td>
            </tr>
           
            
            <tr>
            <th>렌트카</th>
            <td>
            		<input type="text" id="rentName" value="차량이름">
            		 <input type="hidden" name="rentNum" id="rentNum" value="차량번호">
            		 <input id="selectRentBtn" type="button" value="차량선택">
            </td>
            </tr>
            
            
            <tr>
            <th>멘토</th>
             <td>
            		<input type="text" id="mentoName" value="멘토이름">
            		 <input type="hidden" name="mentoNum" id="mentoNum" value="멘토번호">
      	      		 <input id="selectMentoBtn" type="button" value="멘토선택">
            </td>
            </tr>
          	
			  </table> 
            <input type="button" id ="submit1" value="다음" class="button"/>
            
        </form:form>
</div>
</body>
</html>