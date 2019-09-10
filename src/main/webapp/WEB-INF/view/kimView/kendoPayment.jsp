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

$(function(){
	
		$("#credit").change(function(){
			if($("#credit").is(':checked',true)){
				$("#optCard").show();
				$("#optQr").hide();
		    }
		});
		
		
		$("#bbb").click(function(){
			if($("#bbb").is(':checked',true)){
				$("#optQr").show();
				$("#optCard").hide();
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

        
       
        
     <form name="frm" action="guestPayAction" method="POST">
     <div class = "container">   
     <h4>DO 활동선택확인</h4><br/>
     <table class="table table-striped" >
     <tr>
     	<td width = "200px"> 활동번호 </td> 
     	<td> <input type="hidden" name = "doNum" value="${kdc.doNum}"/>${kdc.doNum}</td>
     </tr>
     <tr>
     	<td> 활동이름</td>
     	<td> <input type="hidden" name = "doName" value="${kdc.doName}"/>${kdc.doName}</td>
    </tr>
    <tr>
    	<td>호스트번호</td>
    	<td><input type="hidden" name = "hostNum" value="${kdc.hostNum}"/>${kdc.hostNum}</td>
    </tr>
    <tr>
    	<td>수     량 </td>
    	<td><input type="hidden" name = "joinQty" value = "${kdc.doQty}"/>${kdc.doQty}
			<input type="hidden" name = "doPp" value="${kdc.doPp}"/>
			<input type="hidden" name = "doNowPp" value="${kdc.doNowPp}"/></td>
	</tr>
	<tr>
		<td>카카오톡 아이디</td>
		<td><input type="hidden" name = "joinKakaoId"  value ="${kjc.joinKakaoId}"/> ${kjc.joinKakaoId}</td>
	</tr>
	<tr>
		<td>자기소개</td>
		<td><input type="hidden" name = "joinIntroduce"  value ="${kjc.joinIntroduce}"/>${kjc.joinIntroduce}</td>
 	</tr>
 	
<c:set var ="doQty" value="${kdc.doQty}" scope="session" />
<c:if test="${doQty > 1}">   
<c:forEach var="i" begin="1" end="${doQty-1}" step="1" >
	<tr>
		<td><br/><h4>친구 정보 ${i}</h4></td><td></td>
	</tr>
	<tr>
		<td>친구이름</td>
		<td><input type="hidden" name = "friendName"  value ="${kjc.friendName}"/>${kjc.friendName}</td>
	</tr>
	<tr>
		<td>친구연락처</td>
		<td><input type="hidden" name = "friendPh"  value ="${kjc.friendPh}"/> ${kjc.friendPh}</td>
	</tr>
	<tr>
		<td>친구나이</td>
		<td><input type="hidden" name = "friendAge"  value ="${kjc.friendAge}"/>${kjc.friendAge}</td>
	</tr>
</c:forEach> 
</c:if>
	<tr>
		<td colspan="2"><br/><h4>결제정보 입력</h4></td>
    </tr>
	<tr>
		<td>결제금액</td>
		<td><input type=hidden name = "buyPrice"/>${kdc.doQty * kdc.doPrice}</td>
	<tr>
		<td>결제수단</td>
		<td><input type="radio" name = "payStyle" id = "credit" value="credit" />신용카드  &nbsp;&nbsp;
        	<input type="radio" name = "payStyle" id = "bbb" value="kakaopay" />카카오QR결제<br/>
        	
        	<div id="optCard" style="display:none;">        	            
		          카  드  사  : <select name="payCardName" id="payCardName">
		            <option value="shinhan">신한카드</option>
		            <option value="samsung">삼성카드</option>
		            <option value="hyundai">현대카드</option>
		            <option value="bc">비씨카드</option>
		            <option value="lotte">롯데카드</option>
		            <option value="hana">하나카드</option>
		        </select><br>
		        카드번호 : <input type="text" name = "payCardNum" id="payCardNum"><br/>
		   	CVC 번호 : <input type="text" name = "payCvcNum" id ="payCvcNum"><br/>
		   	유효날짜 : <input type="text" name = "payDate" id ="payDate"><br/>    
		        
			</div>
			
			<div id="optQr" style="display:none;">  카카오페이 결제         
			</div>
			
        </td>
	</tr>

	<tr>
		<td colspan= "2">
			<input type = "submit" value = "결제하기" name = "guestPay"/>
			<input type = "reset" value = "다시입력"/>
			
     	</td>
	</tr>
</table>
</div>   
</form>
    
</body>
</html>