<%@page import="Command.LEECommand.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/mybatis-spring-smrit/js/jquery.form.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
body {
	margin-top: 100px;
	font-family: 'Nanum Gothic', sans-serif;
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
    <div class="container">
        <h3 >** 추천 DO</h3>
        	<table class="table table-striped" >
        	
        	<tr>
        		<c:forEach var="kendoJoin" items="${kendoJoins}" begin="1" end="3" step="1">    		
        		
        		
        		<td width = "350" align = "center">
        		
				<br/><br/>
				<c:set var ="doImgKind" value="${kendoJoin.doImg.doImgKind}" scope="session" />
				<c:if test="${doImgKind == 'main'}">	
				<img src="HHHview/doIMG/${kendoJoin.doImg.doImgName}"  width="300"><br/>
				</c:if>
				<br/>
				${kendoJoin.doNum}<br/>  
                <a href = "./kendoDetail/${kendoJoin.doNum}">${kendoJoin.doName}</a><br/> 			
				<fmt:formatNumber pattern="###,###,###" value="${kendoJoin.paymentKim.payDutch}" />원
        		</td>
        		
        
        		
                 </c:forEach> 
             </tr>
           
		</table> 
    </div>
</body>
</html>