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
<title>주문 게시판</title>
</head>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
	function openChildWindow() {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=750,left=500,top=20';
		window.open("DodoDetail?dodoNum=" + $("#doNum").val(), "KendoDetail", settings);
	}
</script>
<body>
<table width=80% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty dodos}">
	<tr align="center" valign="middle">
		<td colspan="4">활동리스트</td>
		<td align=right>
			<font size=2>활동 수  : ${listcount }</font>
		</td>
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
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${dodo.doNum }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<input type="hidden" id="doNum" name="doNum" value="${dodo.doNum }">
			<a href="javascript:openChildWindow();" >
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
</body>
</html>