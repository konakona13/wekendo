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
		var area  = $("#themeSmall").val();
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
		var area  = $("#themeSmall").val();
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
		var area  = $("#themeSmall").val();
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
</head>
<body>
    <h1>활동개설신청서?</h1>
    	
    	<!-- 새창정보 -->
    	<input type="hidden" id="startDcl" name="startDate">
        <input type="hidden" id="endDcl" name="endDate">
    	<!-- 새창정보 -->
    	<!-- 지역테마정보 -->
    	테마<input type="text" id="themaSS">
		지역<input type="text" id="areaSS">
       
      
        <form:form action="doCreatePay" name = "frm" id = "frm" method="POST"
         enctype="multipart/form-data" commandName="createDoCommand">
          
            <p>
                지역선택	 <div id = "mapMain"> </div> 
            </p>
            <p>
           	테마선택 	 <div id = "themeMain"> </div>  
            </p>
            
            <p>
                <table>
                    <tr>
                        <td> 활동명 <form:input type="text" path="doName"/></td>
                    </tr>
                     <tr>
                            <td>모집인원  <form:input type="text" path="doPp"/></td>
                    </tr>
                    
                    <tr>
                        <td> 모집종료일  <form:input type="date" path="doCloseDate"/></td>
                    </tr>
                   
                     <tr>
                        <td> 활동시작일  <form:input path="doStartDate" id="doStartDate" type="date"/></td>
                    </tr>
                    <tr>
                  
                    </tr>
                      <tr>
                        <td> 활동종료일  <form:input path="doEndDate" type="date"/></td>
                    </tr>
                    
                   
                    
                  
                </table>
                   <p>
                        메인이미지 <input type="file" name = "mainPhoto"  size = "30" />
                   </p>
                   <p>
                        상세이미지: <input type= "file" name="report" multiple="multiple" />
				 <table id="addTable" width="400" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" border="0">
		            <tr><td align="left"></td></tr>
		            <tr><td> <input name="addButton" type="button" style="cursor:hand" onClick="insRow()" value="추가"></td></tr>
		         </table>
                   </p>
                   <p>
                        상세설명 <form:input type="text" path="doDetail"/>
                        
                   </p>
                   
                    <%-- 성별제한 <form:input type="text" path="limitGender"/>
                      나이제한 <form:input type="text" path="limitAge"/> --%>
       		<p>
                        성별제한   <form:select id="lg" path="limitGender">
                        <form:option value="무관">무관</form:option>
                     <c:if test="${member.gender eq '남'}">
          				<form:option value="남">남자</form:option>
   					 </c:if>
   					 
   					 <c:if test="${member.gender eq '여'}">
          				<form:option value="여">여자</form:option>
   					 </c:if>
                    
                    
                    
                	</form:select>
             </p>
             
             <p>
                        나이제한 <form:select id="la" path="limitAge">
                    <form:option value="미설정">미설정</form:option>
                    <form:option value="성인">성인</form:option>
                	</form:select>
            </p>
           
    

            
           
            
            <div id="selectPlace">
            	 <input type="hidden" id ="doStartDate" />
            	장소 : <input type="text" id="PlaceName" value="장소이름">
            		 <input type="hidden" name="placeNum" id="PlaceNum" value="장소번호">
            		 <input type="hidden" id="placeDays">
            		 <input id="selectPlaceBtn" type="button" value="장소선택">
            </div>	
            <div>
           		 숙박 :  <input type="text" id="hotelName" value="숙박이름">
            		 <input type="hidden" name="hotelNum" id="hotelNum" value="숙박번호">
            		 <input type="hidden" id="hotelDays">
            		<input id="selectHotelBtn" type="button" value="숙박선택">
            
            </div>
             <div>
           		 렌트카 :  <input type="text" id="rentName" value="차량이름">
            		 <input type="hidden" name="rentNum" id="rentNum" value="차량번호">
            		 <input id="selectRentBtn" type="button" value="차량선택">
            
            </div>
             <div>
           		 멘토 :  <input type="text" id="mentoName" value="멘토이름">
            		 <input type="hidden" name="mentoNum" id="mentoNum" value="멘토번호">
      	      		 <input id="selectMentoBtn" type="button" value="멘토선택">
            
            </div>
            	
            	

            <input type="button" id ="submit1" value="다음"/>
        </form:form>

</body>
</html>