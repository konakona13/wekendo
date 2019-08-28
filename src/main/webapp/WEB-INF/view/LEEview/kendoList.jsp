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
	
	function openChildWindow1() {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=1100,left=300,top=20';
		window.open("DodoDetail2?dodoNum=" + $("#doNum1").val(), "KendoDetail", settings);
	}
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
			<li class="tab-link current" data-tab="tab-1">모집중</li>
			<li class="tab-link" data-tab="tab-2">모집완료</li>
			<li class="tab-link" data-tab="tab-3">활동중</li>
			<li class="tab-link" data-tab="tab-4">활동완료</li>
		</ul>

		<div id="tab-1" class="tab-content current">
		
		
		<table width=100% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="5">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집시작일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집종료일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">현재인원/모집인원</div>
		</td>
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
			<div align="left">
			<input type="hidden" id="doNum1" name="doNum1" value="${dodo.doNum }">
			<a href="javascript:openChildWindow1();" >
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
		
		
		<table width=100% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="5">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">모집시작종료일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동시작종료일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">현재인원/모집인원</div>
		</td>
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
			<div align="left">
			<input type="hidden" id="doNum2" name="doNum2" value="${dodo.doNum }">
			<a href="javascript:openChildWindow2();" >
				${dodo.doName }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.openDate }" pattern="yy년 MM월 dd일" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${dodo.closeDate }" pattern="yy년 MM월 dd일" />
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
		활동중 리스트
		</div>
		<div id="tab-4" class="tab-content">
		활동완료 리스트
		</div>
	</div>
</body>
</html>