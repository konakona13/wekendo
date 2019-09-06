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
	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	})
	
	var doNum = $('#doNum1').val();
	
	function openChildWindow1(doNum) {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=1100,left=300,top=20';
		window.open("DodoDetail2?dodoNum=" + doNum, "KendoDetail", settings);
	}
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
	<div class="container">

		<ul class="tabs btn btn-default">
			<li class="tab-link current" data-tab="tab-1">모집중</li>
			<li class="tab-link" data-tab="tab-2">모집완료</li>
			<li class="tab-link" data-tab="tab-3">활동중</li>
			<li class="tab-link" data-tab="tab-4">활동완료</li>
			<li class="tab-link" data-tab="tab-5">활동취소</li>
		</ul>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="adminMain" class="btn btn-default">메인으로 돌아가기</a>

		<div id="tab-1" class="tab-content current">
		
		
		<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="5" style="background-color: skyblue; font-weight: bold;">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<th style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">현재인원/모집인원</div>
		</th>
	</tr>
<c:forEach var="dodo" items="${dodos}">
<c:if test="${dodo.status == 'inviting' }">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${dodo.doNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<a href="javascript:openChildWindow1('${dodo.doNum }');" id="doNum1" >
				${dodo.doName }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.openDate }" pattern="yy/MM/dd" />
			 ~ <fmt:formatDate value="${dodo.closeDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.startDate }" pattern="yy/MM/dd" /> ~
			 <fmt:formatDate value="${dodo.endDate }" pattern="yy/MM/dd" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${dodo.nowPP }/${dodo.doPP }명</div>
		</td>
	</tr>
	</c:if>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
			<a href="kendo_list?page=${page -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPage }" 
				end="${endPage }">
				<a href="kendo_list?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${page < maxPage }">	
			<a href="kendo_list?page=${page +1 }">[다음]</a>
			</c:if>
			<c:if test="${page >= maxPage }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="4">활동리스트</td>
		<td align=right>
			<font size=2>등록된 활동이 없습니다. 얘들아 나가놀아라.</font>
		</td>
	</tr>
</c:if>
</table>

		</div>
		<div id="tab-2" class="tab-content">
		
		
		<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="5" style="background-color: skyblue; font-weight: bold;">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<th style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">현재인원/모집인원</div>
		</th>
	</tr>
<c:forEach var="dodo" items="${dodos}">
<c:if test="${dodo.status == 'invited' }">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${dodo.doNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<a href="javascript:openChildWindow1('${dodo.doNum }');" id="doNum1" >
				${dodo.doName }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.openDate }" pattern="yy/MM/dd" />
			 ~ <fmt:formatDate value="${dodo.closeDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				<fmt:formatDate value="${dodo.startDate }" pattern="yy/MM/dd" /> ~
			 <fmt:formatDate value="${dodo.endDate }" pattern="yy/MM/dd" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${dodo.nowPP }/${dodo.doPP }명</div>
		</td>
	</tr>
	</c:if>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
			<a href="kendo_list?page=${page -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPage }" 
				end="${endPage }">
				<a href="kendo_list?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${page < maxPage }">	
			<a href="kendo_list?page=${page +1 }">[다음]</a>
			</c:if>
			<c:if test="${page >= maxPage }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="4">활동리스트</td>
		<td align=right>
			<font size=2>등록된 활동이 없습니다. 얘들아 나가놀아라.</font>
		</td>
	</tr>
</c:if>
</table>
		
		
		</div>
		<div id="tab-3" class="tab-content">
				<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="5" style="background-color: skyblue; font-weight: bold;">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<th style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">현재인원/모집인원</div>
		</th>
	</tr>
<c:forEach var="dodo" items="${dodos}">
<c:if test="${dodo.status == 'doing' }">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${dodo.doNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<a href="javascript:openChildWindow1('${dodo.doNum }');" id="doNum1" >
				${dodo.doName }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.openDate }" pattern="yy/MM/dd" />
			 ~ <fmt:formatDate value="${dodo.closeDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				<fmt:formatDate value="${dodo.startDate }" pattern="yy/MM/dd" /> ~
			 <fmt:formatDate value="${dodo.endDate }" pattern="yy/MM/dd" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${dodo.nowPP }/${dodo.doPP }명</div>
		</td>
	</tr>
	</c:if>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
			<a href="kendo_list?page=${page -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPage }" 
				end="${endPage }">
				<a href="kendo_list?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${page < maxPage }">	
			<a href="kendo_list?page=${page +1 }">[다음]</a>
			</c:if>
			<c:if test="${page >= maxPage }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="4">활동리스트</td>
		<td align=right>
			<font size=2>등록된 활동이 없습니다. 얘들아 나가놀아라.</font>
		</td>
	</tr>
</c:if>
</table>
		</div>
		<div id="tab-4" class="tab-content">
				<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="5" style="background-color: skyblue; font-weight: bold;">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<th style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">현재인원/모집인원</div>
		</th>
	</tr>
<c:forEach var="dodo" items="${dodos}">
<c:if test="${dodo.status == 'doend' || dodo.status == 'cashcomplete'}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${dodo.doNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<a href="javascript:openChildWindow1('${dodo.doNum }');" id="doNum1" >
				${dodo.doName }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.openDate }" pattern="yy/MM/dd" />
			 ~ <fmt:formatDate value="${dodo.closeDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				<fmt:formatDate value="${dodo.startDate }" pattern="yy/MM/dd" /> ~
			 <fmt:formatDate value="${dodo.endDate }" pattern="yy/MM/dd" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${dodo.nowPP }/${dodo.doPP }명</div>
		</td>
	</tr>
	</c:if>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
			<a href="kendo_list?page=${page -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPage }" 
				end="${endPage }">
				<a href="kendo_list?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${page < maxPage }">	
			<a href="kendo_list?page=${page +1 }">[다음]</a>
			</c:if>
			<c:if test="${page >= maxPage }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="4">활동리스트</td>
		<td align=right>
			<font size=2>등록된 활동이 없습니다. 얘들아 나가놀아라.</font>
		</td>
	</tr>
</c:if>
</table>
		</div>
		<div id="tab-5" class="tab-content">
				<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="5" style="background-color: skyblue; font-weight: bold;">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<th style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동기간</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">현재인원/모집인원</div>
		</th>
	</tr>
<c:forEach var="dodo" items="${dodos}">
<c:if test="${dodo.status == 'CANCEL' }">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${dodo.doNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<a href="javascript:openChildWindow1('${dodo.doNum }');" id="doNum1" >
				${dodo.doName }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.openDate }" pattern="yy/MM/dd" />
			 ~ <fmt:formatDate value="${dodo.closeDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.startDate }" pattern="yy/MM/dd" /> ~
			 <fmt:formatDate value="${dodo.endDate }" pattern="yy/MM/dd" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${dodo.nowPP }/${dodo.doPP }명</div>
		</td>
	</tr>
	</c:if>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
			<a href="kendo_list?page=${page -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPage }" 
				end="${endPage }">
				<a href="kendo_list?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${page < maxPage }">	
			<a href="kendo_list?page=${page +1 }">[다음]</a>
			</c:if>
			<c:if test="${page >= maxPage }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="4">활동리스트</td>
		<td align=right>
			<font size=2>등록된 활동이 없습니다. 얘들아 나가놀아라.</font>
		</td>
	</tr>
</c:if>
</table>
		</div>
	
	</div>
</body>
</html>