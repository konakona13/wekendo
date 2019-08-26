<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
body {
	margin-top: 10px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}

.container {
	width: 900px;
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
<body>
	<div class="container">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">미정산</li>
			<li class="tab-link" data-tab="tab-2">정산완료</li>
		</ul>

		<div id="tab-1" class="tab-content current">
		<table width=50% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty cashins}">
	<tr align="center" valign="middle">
		<td colspan="5">정산리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">정산번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">기업번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품판매월</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">정산현황</div>
		</td>
	</tr>
<c:forEach var="cashin" items="${cashins}">
<c:if test="${cashin.status eq '미정산'}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${cashin.cashinNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<input type="hidden" id="doNum" name="doNum" value="${dodo.doNum }">
			<a href="javascript:openChildWindow();" >
				${cashin.payNum }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${cashin.companyNum }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${cashin.month }" pattern="yy년 MM월" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${cashin.status }
			</div>
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
<c:if test="${empty cashins}">
	<tr align="center" valign="middle">
		<td colspan="4">정산리스트</td>
		<td align=right>
			<font size=2>정산내역이 없습니다. 돈벌자</font>
		</td>
	</tr>
</c:if>
</table>
		</div>
		<div id="tab-2" class="tab-content">
		<table width=50% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty cashins}">
	<tr align="center" valign="middle">
		<td colspan="5">정산리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">정산번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">기업번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품판매월</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">정산현황</div>
		</td>
	</tr>
<c:forEach var="cashin" items="${cashins}">
<c:if test="${cashin.status eq '정산완료'}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${cashin.cashinNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<input type="hidden" id="doNum" name="doNum" value="${dodo.doNum }">
			<a href="javascript:openChildWindow();" >
				${cashin.payNum }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${cashin.companyNum }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatDate value="${cashin.month }" pattern="yy년 MM월" />
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${cashin.status }
			</div>
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
<c:if test="${empty cashins}">
	<tr align="center" valign="middle">
		<td colspan="4">정산리스트</td>
		<td align=right>
			<font size=2>정산내역이 없습니다. 돈벌자</font>
		</td>
	</tr>
</c:if>
</table>
		</div>
	</div>
</body>
</html>