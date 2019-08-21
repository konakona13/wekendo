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
	기업회원 가입 승인
	<div>
		<table border ="1" >
        	<tr>
				<td>기업회원번호</td>
				<td>기업회원분류</td>
                <td>기업회원이름</td>
                <td>담당자</td>
                <td>연락처</td>
                <td>주소</td>
                <td>승인상태</td>                      
             </tr>
<c:if test="${! empty updateComReg}">                
	<c:forEach var="updateComReg" items="${updateComReg}">
            <tr>
                <td><input type = "hidden" value = "${updateComReg.companyNum}" name = "companyNum"/>${updateComReg.companyNum}</td>
                <td>${updateComReg.companyKind}</td>
                <td><input type = "hidden" value = "${updateComReg.companyName}" name = "companyName"/>
                <a href="./companyRegDetail/${updateComReg.companyName}">  
                ${updateComReg.companyName}</a>
                </td>  
                <td>${updateComReg.managerName}</td>   
                <td>${updateComReg.companyPh}</td> 
                <td>${updateComReg.companyAddr}</td> 
                <td>${updateComReg.companyStatus}</td>     
             </tr>
	</c:forEach>
</c:if>               
		</table>     
	</div>
	
	<div>
<c:if test="${empty updateComReg}">
미승인 기업회원이 없습니다.
</c:if>
	</div>

<br/>               

        
<a href="kim" >메인</a>
</body>
</html>