<%@page import="Command.kimCommand.KendoJoinCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*,Model.DTO.*" %>
<%
request.getAttribute("kjc");
%>
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
<div>
        <h3>활동결제</h3>
        <p>
        <form name="frm" action="guestPayAction" method="POST">
            활동번호 :  <input type=text name = "doNum"/>DO1001<br /> 
            활동이름 :  <input type=text name = "doName"/>바리스타가 되자<br />
            수     량  : ${kjc.joinQty}<br />
            카카오톡 아이디  : ${kjc.joinKakaoId}<br />
            자기소개  :  ${kjc.joinIntroduce}<br />
            친구이름  :  ${kjc.friendName}<br />
            친구연락처  : ${kjc.friendPh}<br />
            친구나이  :  ${kjc.friendAge}<br />
            
            
            
     <hr>       
            결제금액 :  <input type=text name = "buyPrice"/>40000<br />
            결제수단 :
            <select name="payStyle">
	            <option value="card">신용카드</option>
	            <option value="qrcode">카카오 QR결제</option>
            </select>    
            <br />            
            카드사명 : 
            <select name="payCardName">
                <option value="shCard">신한카드</option>
                <option value="bcCard">비싸카드</option>
                <option value="ssCard">삼성카드</option>
                <option value="kbCard">국민카드</option>
                <option value="hdCard">현대카드</option>
                <option value="ldCard">롯데카드</option>
                <option value="wlCard">우리카드</option>
                <option value="hnCard">하나카드</option>
            </select> 
            <br />
            카드번호 : <input type="text" name = "payCardNum"> <br />
     CVC번호 : <input type="text" name = "payCvcNum"><br />
            유효날짜 :  <input type="text" name = "payDate"><br />
    	</p> 
    	
        	<input type = "submit" value = "결제하기" name = "guestPay"/>
        </form>
    </div>
</body>
</html>