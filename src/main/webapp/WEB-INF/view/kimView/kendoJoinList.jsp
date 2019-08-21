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
<h3>Do List</h3>

	<div>
		<table border ="1" >
        	<tr>
				<td>DO No.</td>
                <td>DO 이름</td>
                <td>DO 시작날짜</td>
                <td>DO 종료날짜</td>
                <td>DO 진행상태</td>                      
             </tr>
<c:if test="${! empty kendoJoins}">                
	<c:forEach var="kendoJoin" items="${kendoJoins}">
            <tr>
                <td>${kendoJoin.doNum}</td>
                <td>${kendoJoin.doName}</td>  
                <td>${kendoJoin.doStartDate}</td>  
                <td>${kendoJoin.doEndDate}</td>   
                <td>${kendoJoin.doStatus}</td>    
             </tr>
	</c:forEach>
</c:if>               
		</table>     
	</div>
	
	<div>
<c:if test="${empty kendoJoins}">
Do 결제 내역이 없습니다.
</c:if>
	</div>

<br/>               

        
<a href="kim" >메인</a>
</body>
</html>