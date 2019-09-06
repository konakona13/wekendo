<%@page import="Command.LEECommand.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">

</script>
<style>
body {
	margin-top: 100px;
font-family: 'Nanum Gothic', sans-serif;
	line-height: 1.6
}

table{
font-family: 'Nanum Gothic', sans-serif;
}

.container {
	width: 1000px;
	font-family: 'Nanum Gothic', sans-serif;
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
<body>
<div id="container" style="width: 900px; margin: 30px;" class="container">
	<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-striped">
<c:if test="${! empty orders}">
	<tr align="center" valign="middle">
		<td colspan="8" style="background-color: skyblue; font-weight: bold;">주문내역</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="">
		<th style="font-family:Tahoma;font-size:8pt;" width="5%" height="26">
			<div align="center">주문번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">구매자명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">이용날짜</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품금액</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">활동인원</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제금액/총금액</div>
		</th>
	</tr>
<c:forEach var="order" items="${orders}">
<c:if test="${order.goodsStock == 0 }">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${order.buyNum }
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				${order.doName }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				${order.goodsName }
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${order.memName }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		<fmt:formatDate value="${order.startDate }" pattern="yy/MM/dd" /> ~ 
		<fmt:formatDate value="${order.endDate }" pattern="yy/MM/dd" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		<fmt:formatNumber value="${order.goodsPrice }" pattern="#,###" /> 원 
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		${order.payPP } 명 
			</div>
		</td>		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><fmt:formatNumber value="${order.buyPrice }" pattern="#,###" /> 원 
			/ <fmt:formatNumber value="${order.payDutch * order.payPP}" pattern="#,###" /> 원</div>
		</td>
	</tr>
	</c:if>
</c:forEach>
	
</c:if>
<c:if test="${empty orders }">
	<tr align="center" valign="middle">
		<td colspan="4">구매내역</td>
		<th align=right>
			<font size=2>상품이 구매된 내역이 존재하지 않습니다.</font>
		</th>
	</tr>
</c:if>
</table>
</div>
</body>
</html>