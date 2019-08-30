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
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	})
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
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}
</style>
<body>
	<div class="container">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">개설</li>
			<li class="tab-link" data-tab="tab-2">참가</li>
		</ul>

		<div id="tab-1" class="tab-content current">
		
		<table width=100% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty hostlists}">
	<tr align="center" valign="middle">
		<td colspan="4">나의 개설활동</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="30%" height="26">
			<div align="center">활동이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제금액</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">결제일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제방법</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">카드번호</div>
		</td>
	</tr>
<c:forEach var="hostlist" items="${hostlists}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${hostlist.doName }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			 <fmt:formatNumber value="${hostlist.payTotal }" pattern="#,###" /> 원 
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${hostlist.dutchDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		${hostlist.payStyle }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${hostlist.cardNum }</div>
		</td>
	</tr>
</c:forEach>
</c:if>
<c:if test="${empty hostlists}">
	<tr align="center" valign="middle">
		<td colspan="4">나의 개설활동</td>
		<td align=right>
			<font size=2>개설된 활동이 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>
		
		</div>
		<div id="tab-2" class="tab-content">
		
		<table width=100% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty guestlists}">
	<tr align="center" valign="middle">
		<td colspan="4">나의 참가활동</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="30%" height="26">
			<div align="center">활동이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제금액</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">결제일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제방법</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">카드번호</div>
		</td>
	</tr>
<c:forEach var="guestlist" items="${guestlists}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${guestlist.doName }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			 <fmt:formatNumber value="${guestlist.payTotal }" pattern="#,###" /> 원 
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${guestlist.dutchDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		${guestlist.payStyle }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${guestlist.cardNum }</div>
		</td>
	</tr>
</c:forEach>
</c:if>
<c:if test="${empty guestlists}">
	<tr align="center" valign="middle">
		<td colspan="4">나의 참가활동</td>
		<td align=right>
			<font size=2>참가한 활동이 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>

		</div>
</body>
</html>