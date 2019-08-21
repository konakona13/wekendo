<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
				uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	$("#selectPlaceBtn").click(function()
	{
		var url = "doCreatePlace?doPlay="+$("#doPlay").val()
							  +"&doArea="+$("#doArea").val();
		open(url,"DP","width=300, height=500");
	});
	
	$("#submit1").click(function()
	{
		$("#frm").submit();
	});
});


</script>
    
    
    
</head>
<body>
    <h1>활동개설신청서?</h1>
       
        <form:form action="doCreatePay" name = "frm" id = "frm" method="POST"
         enctype="multipart/form-data" commandName="createDoCommand">
            <p>${member.memberName }</p>
           
            <p>
                활동선택?
                <select name="doPlay" id="doPlay">
                    <option value="ski">스키</option>
                    <option value="swim">수영</option>
                </select>
            </p>
            <p>
                지역선택?
                <select name="doArea" id="doArea">
                    <option value="gang">강원</option>
                    <option value="geju">제주</option>
                </select>
            </p>
            
            <p>
                <table>
                    <tr>
                        <td> 활동명 <form:input type="text" path="doName"/></td>
                    </tr>
                     <tr>
                        <td> 활동시작일  <form:input path="doStartDate" type="text"/></td>
                    </tr>
                      <tr>
                        <td> 활동종료일  <form:input path="doEndDate" type="text"/></td>
                    </tr>
                    
                     <tr>
                        <td> 모집종료일  <form:input type="text" path="doCloseDate"/></td>
                    </tr>
                    <tr>
                            <td>모집인원  <form:input type="text" path="doPp"/></td>
                        </tr>
                </table>
                   <p>
                        메인이미지 <input type="file" name = "mainPhoto"  size = "30" />
                   </p>
                   <p>
                        상세이미지 <input type="text">
                   </p>
                   <p>
                        상세설명 <form:input type="text" path="doDetail"/>
                   </p>
                   
                    성별제한 <form:input type="text" path="limitGender"/>
                      나이제한 <form:input type="text" path="limitAge"/>
             <%--       <p>
                        성별제한   <form:select id="lg" path="limitGender">
                    <form:option value="allPP">무관</form:option>
                    <form:option value="manPP">남자</form:option>
                    <form:option value="womanPP">여자</form:option>
                	</form:select>
                   </p>
                   <p>
                        나이제한 <form:select id="la" path="limitAge">
                    <form:option value="allPP">미설정</form:option>
                    <form:option value="adultPP">성인</form:option>
                	</form:select>
                   </p> --%>
            </p> 
    

            
           
            
            <div id="selectPlace">
            	
            	장소 : <input type="text" id="PlaceName" value="없음">
            		<input type="text" name="PlaceNum" id="PlaceNum" value="장소번호">
            	<input id="selectPlaceBtn" type="button" value="장소선택">
            
            </div>
           
            

            <input type="button" id ="submit1" value="다음"/>
        </form:form>

</body>
</html>