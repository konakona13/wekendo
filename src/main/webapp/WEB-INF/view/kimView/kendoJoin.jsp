 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<%
	String memberNum = (String)session.getAttribute("memNum");
	session.getAttribute("memAuth");
	response.setCharacterEncoding("utf-8");
 %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	
</script>
<body>
        <h3>활동참가신청</h3>
        <p>
        	신청자 ID : <input type=hidden name = "memId" value="${memAuth.id}"/>${memAuth.id}<br/>
        <div class = "container">
        <form name="frm" action="kendoJoinAction" method="POST">
        	<h6 style="color:white;"><fmt:formatDate  value="${toDay}" pattern="yyyy"/><fmt:formatDate value="${member.memberBir}"  pattern="yyyy" /></h6>
            <table class="table table-striped">
                <tr>
                    <td>활동번호 </td>
                    <td> <input type=hidden name = "doNum" value="${kdc.doNum}"/>${kdc.doNum}
                    </td>
                    
                </tr>
                <tr>
                    <td>호스트번호 : </td>
                    <td>
                    	<input type = "hidden" name = "hostNum" value = "${kdc.hostNum}"/>${kdc.hostNum}
                    </td>
                    
                </tr>                
                <tr>
                    <td> </td>
                    <td><input type=hidden name = "theme" value="${kdc.theme}"/>${kdc.theme}</td>
                </tr>
                <tr>
                    <td> </td>
                    <td><input type=hidden name = "map" value="${kdc.map}"/>${kdc.map}</td>
                </tr>
                <tr>
                    <td>활동명 </td>
                    <td><input type=hidden name = "doName" value="${kdc.doName}"/>${kdc.doName}</td>
                </tr>                
                <tr>
                    <td>이름 </td>
                    <td><input type=hidden name = "memberName"/>${memAuth.name}</td>
                </tr>
                <tr>
                    <td>연락처 </td>
                    <td><input type=hidden name = "memberPh"/>${member.memberPh1}</td>
                </tr>
                <tr>
                    <td>나이 </td>
                    <td>
                    	<fmt:formatNumber value="${toDay.year - member.memberBir.year +1}" /><br/>                      	
                    <input type=hidden name = "memberAge"/>
                    </td>
                </tr>
                <tr>
                    <td>성별 </td>
                    <td><input type=hidden name = "gender"/>${member.gender}</td>
                </tr>
                <tr>
                    <td>주소 </td>
                    <td><input type=hidden name = "memberAddr"/>${member.addr}</td>
                </tr>
                <tr>
                    <td>이메일 </td>
                    <td><input type=hidden name = "memberEmail"/>${member.email}</td>
                </tr>
                <tr>
                    <td>신청수량 </td>
                    <td><input type="hidden" name = "doQty" value="${kdc.doQty}" />${kdc.doQty}</td>
                </tr>  
                <tr>
                    <td>단가 </td>
                    <td><input type="hidden" name = "doPrice" value="${kdc.doPrice}"/>${kdc.doPrice}
                    	<input type="hidden" name = "doPp" value="${kdc.doPp}"/>
                    	<input type="hidden" name = "doNowPp" value="${kdc.doNowPp}"/></td>
                </tr>                               
                <tr>
                    <td>총금액 </td>
                    <td><input type="hidden" name = "totalPrice" value="${kdc.doQty * kdc.doPrice}"/>${kdc.doQty * kdc.doPrice}</td>
                </tr>                 
                <tr>
                    <td>카카오톡 아이디 </td>
                    <td><input type="text" name = "joinKakaoId"></td>
                </tr>
                <tr>
                    <td>자기소개 </td>
                    <td><textarea name = "joinIntroduce" ></textarea></td>
                </tr>

            </table>
<hr>
 
<c:set var ="doQty" value="${kdc.doQty}" scope="session" />
<c:if test="${doQty > 1}">
  
<h3>친구 정보 입력</h3>

            <table>
            
<c:forEach var="i" begin="1" end="${doQty-1}" step="1" > 
                <tr>
                    <td colspan="2"><h2>친구 ${i}</h2></td>                     
                </tr>           
                <tr>
                    <td>친구 이름</td>
                    <td><input type="text" name = "friendName"></td>                       
                </tr>
                <tr>
                    <td>친구 연락처 </td>
                    <td><input type="text" name = "friendPh"></td>    
                 </tr>
                 <tr>
                    <td>친구 나이</td>
                    <td><input type="text" name = "friendAge"></td>    
                 </tr>
</c:forEach>                 
            </table> 
</c:if>                

            <input type = "submit" value = "활동참가신청" name = "kendoJoin"/>

        </form>
</div>

</body>
</html>