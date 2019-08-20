<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		var url = "doCreatePlace"
		open(url,"DP","width=300, height=500");
	});
});


</script>
    
    
    
</head>
<body>
    <h1>활동개설신청서?</h1>
       
        <form action="doCreatePay">
            <p>파티장이름</p>
           
            <p>
                활동선택?
                <select name="as" id="">
                    <option value="">스키</option>
                    <option value="">수영</option>
                </select>
            </p>
            <p>
                지역선택?
                <select name="as" id="">
                    <option value="">강원</option>
                    <option value="">제주</option>
                </select>
            </p>
            
            <p>
                <table>
                    <tr>
                        <td> 활동명 <input type="text"></td>
                    </tr>
                     <tr>
                        <td> 활동기간(활동시작일, 활동종료일)  <input type="text"></td>
                    </tr>
                     <tr>
                        <td>  모집시작일(=신청서작성일) <input type="text"></td>
                    </tr>
                     <tr>
                        <td> 모집종료일  <input type="text"></td>
                    </tr>
                    <tr>
                            <td>모집인원  <input type="text"></td>
                        </tr>
                </table>
                   <p>
                        메인이미지 <input type="text">
                   </p>
                   <p>
                        상세이미지 <input type="text">
                   </p>
                   <p>
                        상세설명 <input type="text">
                   </p>
                   <p>
                        성별제한   <select name="lg" id="limitGender">
                    <option value="allPP">무관</option>
                    <option value="manPP">남자</option>
                    <option value="womanPP">여자</option>
                	</select>
                   </p>
                   <p>
                        나이제한 <select name="la" id="limitAge">
                    <option value="allPP">미설정</option>
                    <option value="adultPP">성인</option>
                	</select>
                   </p>
               
                   
            </p>

            
           
            
            <div id="selectPlace">
            	
            	장소 : <input type="text" id="PlaceName" value="없음">
            	<input id="selectPlaceBtn" type="button" value="장소선택">
            
            </div>
           
            

            <input type="submit" value="다음">
        </form>

</body>
</html>