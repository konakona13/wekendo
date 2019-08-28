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
<title>활동상세내역</title>
</head>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
</script>
<body>
<h1>>활동번호  ${doDetail.doNum } 의 상세내용</h1><br>
호스트명 : ${doDetail.memName }<br>
활동이미지 : <img src="HHHview/doIMG/${doDetail.doImg }" /><br>
활동상세설명: ${doDetail.doDetail }<br>
<br>
<table width=100% border="1" cellpadding="0" cellspacing="0" >
<c:if test="${! empty dodos2}">
	<tr align="center" valign="middle">
		<td colspan="5">상품리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">기업이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">상품명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="20%">
			<div align="center">지역대중소</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="20%">
			<div align="center">테마대중소</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">이용기간</div>
		</td>
	</tr>
<c:forEach var="dodo2" items="${dodos2}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${dodo2.companyName }
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			${dodo2.goodsName }
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${dodo2.mapLnum }/${dodo2.mapMnum }/${dodo2.mapSnum }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${dodo2.themeLnum }/${dodo2.themeMnum }/${dodo2.themeSnum }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${dodo2.goodsDays }</div>
		</td>
	</tr>
</c:forEach>
</c:if>

<c:if test="${empty dodos2}">
	<tr align="center" valign="middle">
		<td colspan="5">상품리스트</td>
		<td align=right>
			<font size=2>해당활동에서 이용하는 상품이 없습니다.</font>
		</td>
	</tr>
</c:if>
</table>
</body>
</html>