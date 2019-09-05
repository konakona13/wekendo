<%@page import="Command.kimCommand.KendoJoinCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*,Model.DTO.*" %>

<%
	response.setCharacterEncoding("utf-8");
%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type='text/javascript'>
/*
$("input:radio[name=payStyle]").click(function () {
	if($("input[name=payStyle]:checked").val() == "credit"){
		$("input:div[name=optCard]").attr("disabled", true);
	}

});
*/

$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=payStyle]").click(function(){
 
        if($("#payStyle").val() == "credit"){
            $("#optCard").show();
            $("#optQr").hide();
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("#payStyle").val() == "kakaopay"){
        	$("#optCard").hide();
            $("#optQr").show();
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
});

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
</style>
</head>
<body>

        <h3>활동선택확인</h3>
        <p>
        <form name="frm" action="guestPayAction" method="POST">
        
        <div class = "container">
            활동번호 :  <input type="hidden" name = "doNum" value="${kdc.doNum}"/>${kdc.doNum}<br /> 
            활동이름 :  <input type="hidden" name = "doName" value="${kdc.doName}"/>${kdc.doName}<br />
            호스트번호  :  <input type="hidden" name = "hostNum" value="${kdc.hostNum}"/>${kdc.hostNum}<br />     
            수     량  : <input type="hidden" name = "joinQty" value = "${kdc.doQty}"/>${kdc.doQty}
			<input type="hidden" name = "doPp" value="${kdc.doPp}"/>
			<input type="hidden" name = "doNowPp" value="${kdc.doNowPp}"/><br />
            카카오톡 아이디  : <input type="hidden" name = "joinKakaoId"  value ="${kjc.joinKakaoId}"/> ${kjc.joinKakaoId}<br />
            자기소개  :  <input type="hidden" name = "joinIntroduce"  value ="${kjc.joinIntroduce}"/>${kjc.joinIntroduce}<br />
 
<c:set var ="doQty" value="${kdc.doQty}" scope="session" />
<c:if test="${doQty > 1}">   
<c:forEach var="i" begin="1" end="${doQty-1}" step="1" >  
	<h2>친구 ${i}</h2>     
            친구이름  :  <input type="hidden" name = "friendName"  value ="${kjc.friendName}"/>${kjc.friendName}<br />
            친구연락처  : <input type="hidden" name = "friendPh"  value ="${kjc.friendPh}"/> ${kjc.friendPh}<br />
            친구나이  :  <input type="hidden" name = "friendAge"  value ="${kjc.friendAge}"/>${kjc.friendAge}<br />
</c:forEach> 
</c:if>              
	<h3>guestPay</h3>
    <p>

            결제금액 :	<input type=hidden name = "buyPrice"/>${kdc.doQty * kdc.doPrice}<br />
            결제수단 : 	<input type="radio" name = "payStyle" id = "payStyle" value="credit"/>신용카드  &nbsp;&nbsp;
        		<input type="radio" name = "payStyle" id = "payStyle" value="kakaopay"/>카카오QR결제<br />
     
     
        
     
		      <div id="optCard" >           	            
		         <select name="payCardName" id="cardCompany">
		            <option value="shinhan">신한카드</option>
		            <option value="samsung">삼성카드</option>
		            <option value="hyundai">현대카드</option>
		            <option value="bc">비씨카드</option>
		            <option value="lotte">롯데카드</option>
		            <option value="hana">하나카드</option>
		        </select>
		        <br />
		         카드번호 : <input type="text" name = "payCardNum"> <br />
		     CVC 번호 : <input type="text" name = "payCvcNum"><br />
		         유효날짜 : <input type="text" name = "payDate"><br />
		 	 </div>

      
			<div id="optQr">           
		          	<input type="hidden" name = "payCardName" value="QR"/>
		        	<input type="hidden" name = "payCardNum" value="QR"> 
		     		<input type="hidden" name = "payCvcNum" value="QR">
		         	<input type="hidden" name = "payDate" value="QR">
			</div>



	    <div id="cardPay">
			<input type = "reset" value = "다시입력"/>
			<input type = "submit" value = "결제하기" name = "guestPay"/>
		</div>
</div>        	
        </form>
    
</body>
</html>