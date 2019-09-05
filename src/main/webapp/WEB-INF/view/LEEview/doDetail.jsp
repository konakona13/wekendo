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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
</script>
<style>
body{
font-family: 'Nanum Gothic', sans-serif;
}
.balloon {
    display: inline-block;
    position: relative;
    background: #A9F5F2;
    height: auto;
    width: 500px;
    margin: 30px;
    padding: 10px;
    border-radius: 10px;
	box-shadow: 0px 0px 15px #BDBDBD;
}
.balloon:after {
    content: '';
    position: absolute;
    height: 50px;
    width: 50px;
    border-radius: 25px;
    z-index: -1;
    background: #fff;
    bottom: -20px;
    left: 50px;
}
.balloon:before {
    content: '';
    position: absolute;
    height: 50px;
    width: 50px;
    border-radius: 25px;
    z-index: -1;
    background: #A9F5F2;
    bottom: -15px;
    left: 35px;
}
</style>
<body>
<div class="balloon">
<h1>활동번호  ${doDetail.doNum } 의 상세내용</h1><br>
<p>호스트명 : ${doDetail.memName }</p>
<p>활동이미지 : <img src="HHHview/doIMG/${doDetail.doImg }" /></p>
<p>활동총금액 : <fmt:formatNumber value="${doDetail.payTotal }" pattern="#,###" /> 원</p>
<br>
<br>
</div>
<div id="container" style="width: 900px; margin: 30px;" class="container">
<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-striped">
<c:if test="${! empty dodos2}">
	<tr align="center" valign="middle">
		<td colspan="7">활동에서 이용하는 상품내역</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">기업이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="20%">
			<div align="center">상품명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">지역대중소</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">테마대중소</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">소비자가</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="5%">
			<div align="center">이용기간</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">구매가격</div>
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
			${dodo2.mapLname }/${dodo2.mapMname }/${dodo2.mapSname }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${dodo2.themeLname }/${dodo2.themeMname }/${dodo2.themeSname }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><fmt:formatNumber value="${dodo2.goodsPrice }" pattern="#,###" /> 원</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${dodo2.goodsDays } 일</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><fmt:formatNumber value="${dodo2.buyPrice }" pattern="#,###" /> 원</div>
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
</div>
</body>
</html>