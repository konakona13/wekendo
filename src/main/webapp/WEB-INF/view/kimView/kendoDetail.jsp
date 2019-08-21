<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <h3>상품상세페이지</h3>

        <% session.getAttribute("memAuth"); %> ${memAuth.id} 님 로그인 중 <br/>
        
        <form name="kendoJoin" action="kendoJoin" method="POST">
        <table>
            <tr>
                <td><img class="thum" src="" width="250" height="200" name = "메인사진"><br/></td>
                <td>활동번호 :<input type = "hidden" name = "doNum" value = "DO1300"/> DO1300 <br /> 
                    활동구분 :<input type = "hidden" name = "theme" value = "취미>커피"/> 취미>커피  <br />
                    활동지역 :<input type = "hidden" name = "map" value = "서울>영등포구>양평동"/> 서울>영등포구>양평동 <br />
                    <h3><input type = "hidden" name = "doName" value = "바리스타가 되자 !"/>바리스타가 되자 !</h3> <br />
                    수량 : <input type = "number" name = "doQty" min="1" required/><br /> 
                    <span class="price" id="price">

                    가격 : <input type = "hidden" name = "doPrice" value = "30000"/>30000</span><br /> 
                    <input type = "submit" value = "활동참가" name = "doJoin"/>
                    <input type = "submit" value = "찜하기" name = "bookmark"/><br />       
                </td>
            </tr>           
            <tr>
               <td colspan="2">
                    <img class="detail_img" src="" width="400" height="300" name = "상세사진">상세사진1<br/>
                    <img class="detail_img" src="" width="400" height="300" name = "상세사진">상세사진2<br/>
                    <img class="detail_img" src="" width="400" height="300" name = "상세사진">상세사진3<br/>
                    상세설명<input type = "text" name = "bookmark"/><br />
                </td> 
            </tr>
        </table>
        </form>
    </div>
</body>
</html>