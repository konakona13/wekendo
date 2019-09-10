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
<body>

<div class="container">
<h4>** 신규 회원</h4><br/>

		* 일반회원

<div id="tab-1" class="tab-content current">
		<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
<c:if test="${! empty members}">
	<tr align="center" valign="middle">
		<td colspan="8" style="background-color: lightgrey; font-weight: bold;">일반회원리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="">
		<th style="font-family:Tahoma;font-size:8pt;" width="5%" height="26">
			<div align="center">회원번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">ID</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">이름</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">연락처</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">이메일</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="20%">
			<div align="center">주소</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">생년월일</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="5%">
			<div align="center">상태</div>
		</th>
	</tr>
<c:forEach var="member" items="${members}" begin="1" end="5" step="1">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<a href="javascript:openMemWindow('${member.memberNum }');" id="memberNum">
			${member.memberNum }
			</a>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				${member.memberId }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
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
			<div align="center">
		${member.addr }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${member.memberBir }" pattern="yy/MM/dd" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${member.status }</div>
		</td>
	</tr>
</c:forEach>
	
</c:if>

</table>



		</div>



		* 기업회원

				
		</div>
		
		<div id="tab-2" class="tab-content">
		<table width=100%  border="0" cellspacing="0" class="table table-hover">
<c:if test="${! empty companys}">
	<tr align="center" valign="middle">
		<td colspan="7" style="background-color: lightgrey; font-weight: bold;">기업회원리스트</td>
		
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<th style="font-family:Tahoma;font-size:8pt;" width="5%" height="26">
			<div align="center">회원번호</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">회사명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="5%">
			<div align="center">대표자명</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">연락처</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">담당자이메일</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="20%">
			<div align="center">주소</div>
		</th>
		<th style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상태</div>
		</th>
	</tr>
<c:forEach var="company" items="${companys}" begin="1" end="5" step="1">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<a href="javascript:openComWindow('${company.companyNum }');" id="companyNum" >
			${company.companyNum }
			</a>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				${company.companyName }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				${company.companyCap }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${company.companyPh }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		${company.companyEmail }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
		${company.companyAddr }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${company.companyStatus }</div>
		</td>
	</tr>
</c:forEach>
	
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
	</div>
</body>
</html>