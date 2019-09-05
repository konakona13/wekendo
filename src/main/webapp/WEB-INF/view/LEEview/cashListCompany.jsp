<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
 			<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
 			<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function openDoComWindow() {
	// 새창에 대한 세팅(옵션)
	var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=600,width=500,left=500,top=20';
	window.open("BuybuyDetail?buyNum=" + $("#buyNum").val(), "buybuyDetail", settings);
}
</script>
<style>
body{
font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body>
	<div id="container" style="width: 1500px; margin: 20px;">
		<div id="header" style="background-color: white;">
		<form action="buybuySearch" name="frm" method="post">
			<h3>기업이름 : ${comAuth.name }</h3>
		</form>
		</div>
		<div id="content1"
			style="background-color: white-space; height: 500px; width: 700px; float: left; margin: 10px;">
			
			
			<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-striped">
<c:if test="${! empty cashins}">
	<tr align="center" valign="middle">
		<td colspan=54">정산리스트</td>
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
			<div align="center">정산일</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">정산현황</div>
		</td>
	</tr>
<c:forEach var="cashin" items="${cashins}">
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
			<fmt:formatDate value="${cashin.days }" pattern="yy년 MM월 dd일" />
			</div>
		</td>		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${cashin.status }</div>
		</td>
	</tr>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
			<a href="Cashin?page=${page -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPageCash }" 
				end="${endPageCash }">
				<a href="Cashin?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${page < maxPageCash }">	
			<a href="Cashin?page=${page +1 }">[다음]</a>
			</c:if>
			<c:if test="${page >= maxPageCash }">
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

<c:set var = "sumCash" value = "0" />
<c:forEach var="cashin1" items="${cashins}">
<c:set var= "sumCash" value="${sumCash + cashin1.totalPrice}"/>
</c:forEach>
<br>
<div class="container"
style="background-color:#D8D8D8; border:1px solid #e0e0e0; width:600px; height:150px; clear: both; margin: auto; padding: 30px; border-radius: 10px;
		box-shadow: 0px 0px 15px #151515;">
정산 완료 금액 : <c:out value="${sumCash}"/>원</div>

		</div>
		<div id="content2"
			style="background-color: white; height: 500px; width: 700px; float: left; margin: 10px;">
			
			
			<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-striped">
<c:if test="${! empty buybuys}">
	<tr align="center" valign="middle">
		<td colspan="7">구매리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">구매번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">활동번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">기업번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">기업이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품가격</div>
		</td>
	</tr>
<c:forEach var="buybuy" items="${buybuys}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${buybuy.buyNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<input type="hidden" id="doNum" name="doNum" value="${dodo.doNum }">
			<a href="javascript:openDoComWindow();" >
				${buybuy.doNum }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${buybuy.goodsNum }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${buybuy.companyNum }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${buybuy.companyName }
			</div>
		</td>		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<fmt:formatNumber value="${buybuy.buyPrice }" pattern="#,###" /> 원</div>
		</td>
	</tr>
</c:forEach>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<c:if test="${page <= 1 }">
			[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
			<a href="Cashin?page=${page -1 }">[이전]</a>&nbsp;
			</c:if>
			<c:forEach var="i" begin="${startPageBuy }" 
				end="${endPageBuy }">
				<a href="Cashin?page=${i }">[${i }]</a>&nbsp;
			</c:forEach>
			<c:if test="${page < maxPageBuy }">	
			<a href="Cashin?page=${page +1 }">[다음]</a>
			</c:if>
			<c:if test="${page >= maxPageBuy }">
			[다음]&nbsp;
			</c:if>
		</td>
	</tr>
</c:if>
<c:if test="${empty buybuys}">
	<tr align="center" valign="middle">
		<td colspan="4">구매리스트</td>
		<td align=right>
			<font size=2>구매내역이 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>

<c:set var = "sumBuy" value = "0" />
<c:forEach var="buybuy1" items="${buybuys}">
<c:set var= "sumBuy" value="${sumBuy + buybuy1.buyPrice}"/>
</c:forEach>
<br>
<div class="container"
style="background-color:#D8D8D8; border:1px solid #e0e0e0; width:600px; height:150px; clear: both; margin: auto; padding: 30px; border-radius: 10px;
		box-shadow: 0px 0px 15px #151515;">
상품 판매 총 금액 : <c:out value="${sumBuy}"/>원</div>
	</div>
</body>
</html>