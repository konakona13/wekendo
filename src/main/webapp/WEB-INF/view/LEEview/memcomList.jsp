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
	
	var comNum = $('#companyNum').val();
	var memNum = $('#memberNum').val();

	function openComWindow(comNum) {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=1100,left=300,top=20';
		window.open("goodsMainLEE?comNum=" + comNum, "comGoodsDetail",	settings);
	}
	
	function openMemWindow(memNum) {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=1100,left=300,top=20';
		window.open("kendoMainLEE?memNum=" + memNum, "memDoDetail",	settings);
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
			<li class="tab-link current" data-tab="tab-1">일반회원</li>
			<li class="tab-link" data-tab="tab-2">기업회원</li>
		</ul>

		<div id="tab-1" class="tab-content current">
		<table width=100% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty members}">
	<tr align="center" valign="middle">
		<td colspan="5">일반회원리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">회원번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">연락처</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">이메일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상태</div>
		</td>
	</tr>
<c:forEach var="member" items="${members}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<a href="javascript:openMemWindow('${member.memberNum }');" id="memberNum">
			${member.memberNum }
			</a>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
				${member.memberName }
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${member.memberPh1 }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		${member.email }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${member.status }</div>
		</td>
	</tr>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${pageM <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${pageM > 1 }">
			<a href="memcomList?page=${pageM -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPageM }" 
				end="${endPageM }">
				<a href="memcomList?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${pageM < maxPageM }">	
			<a href="memcomList?page=${pageM +1 }">[다음]</a>
			</c:if>
			<c:if test="${pageM >= maxPageM }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty members}">
	<tr align="center" valign="middle">
		<td colspan="4">일반회원리스트</td>
		<td align=right>
			<font size=2>가입된 일반회원이 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>
		</div>
		
		<div id="tab-2" class="tab-content">
		<table width=100% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty companys}">
	<tr align="center" valign="middle">
		<td colspan="4">기업회원리스트</td>
		<td><a href="companyReg">기업승인관리</a></td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">회원번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">회사명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">연락처</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">담당자이메일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상태</div>
		</td>
	</tr>
<c:forEach var="company" items="${companys}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<a href="javascript:openComWindow('${company.companyNum }');" id="companyNum" >
			${company.companyNum }
			</a>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
				${company.companyName }
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${company.companyPh }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		${company.managerEmail }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${company.companyStatus }</div>
		</td>
	</tr>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${pageC <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${pageC > 1 }">
			<a href="memcomList?page=${pageC -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPageC }" 
				end="${endPageC }">
				<a href="memcomList?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${pageC < maxPageC }">	
			<a href="memcomList?page=${pageC +1 }">[다음]</a>
			</c:if>
			<c:if test="${pageC >= maxPageC }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty companys}">
	<tr align="center" valign="middle">
		<td colspan="4">기업회원리스트</td>
		<td align=right>
			<font size=2>가입된 기업회원이 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>

		</div>
		<a href="adminMain">메인으로 돌아가기</a>
	</div>
</body>
</html>