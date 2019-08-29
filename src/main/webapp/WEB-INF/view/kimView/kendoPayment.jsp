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
</head>
<body>

        <h3>활동선택확인</h3>
        <p>
        <form name="frm" action="guestPayAction" method="POST">
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

            결제금액 :  <input type=hidden name = "buyPrice"/>${kdc.doQty * kdc.doPrice}<br />
            결제수단 :   <input type=text name = "payStyle"/><br />
        
            <!--  <select name="payStyle" id = "payStyle">
	            <option value="card" selected >신용카드</option>
	            <option value="qrcode">카카오 QR결제</option>
         </select>   -->   
            <br />            
            카드사명 :  <input type=text name = "payCardName"/><br />
         <!--     <select name="payCardName">
                <option value="신한카드" selected>신한카드</option>
                <option value="비싸카드">비싸카드</option>
                <option value="삼성카드">삼성카드</option>
                <option value="국민카드">국민카드</option>
                <option value="현대카드">현대카드</option>
                <option value="롯데카드">롯데카드</option>
                <option value="우리카드">우리카드</option>
                <option value="하나카드">하나카드</option>
           </select>  -->  
            <br />
         카드번호 : <input type="text" name = "payCardNum"> <br />
     CVC번호 : <input type="text" name = "payCvcNum"><br />
         유효날짜 : <input type="text" name = "payDate"><br />
 	 
    <div id="cardPay">
		<input type = "submit" value = "결제하기" name = "guestPay"/>
	</div>
        	
        </form>
    
</body>
</html>