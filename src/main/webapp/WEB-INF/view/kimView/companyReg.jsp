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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class = "container">
	<h4>** 기업회원 가입 승인</h4><br/>
		<table  class="table table-striped">
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
                <td><input type = "hidden" value = "${updateComReg.companyNum}" name = "companyNum"/>
                <a href="./companyRegDetail/${updateComReg.companyNum}">  
                ${updateComReg.companyNum}</td>
                <td>${updateComReg.companyKind}</td>
                <td><input type = "hidden" value = "${updateComReg.companyName}" name = "companyName"/>
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
<a href = "adminMain">기업메인</a>	
</body>
</html>