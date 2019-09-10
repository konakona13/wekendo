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
		<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<c:if test="${comNum == 'admin'}">
	<div class="container">

		<ul class="tabs btn btn-default">
			<li class="tab-link current" data-tab="tab-1">전체</li>
			<li class="tab-link" data-tab="tab-2">미승인</li>
			<li class="tab-link" data-tab="tab-3">승인</li>
		</ul>

		<div id="tab-1" class="tab-content current">
		
		<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-striped">
<c:if test="${! empty list}">
	<tr align="center" valign="middle">
		<td colspan="8" class="info">기업 상품 승인 관리</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="">
		<td style="font-family:Tahoma;font-size:8pt;" width="30%" height="26">
			<div align="center">상품번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품구분</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">상품명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">등록일</div>
	</td>
		<td style="font-family: Tahoma; font-size: 8pt;" width="15%">
			<div align="center">승인상태</div>
		</td>
		<td style="font-family: Tahoma; font-size: 8pt;" width="15%">
			<div align="center">관리</div>
		</td>
		</tr>
		<c:if test="${! empty list}">
		<c:forEach var="list" items="${list}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<form action="confirmList/ok" method="POST" name="okfrm">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<input type="hidden" value="${list.goodsNum}" name="goodsNum">${list.goodsNum}
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			${list.companyKind }			
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<a href="goodsRegDetail.goods/${list.goodsNum}"
				class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
					${list.goodsName} </a>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">${list.companyName}</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			&nbsp; <fmt:formatDate value="${list.regDate}"
													pattern="yy.MM.dd" /> &nbsp;
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">&nbsp; ${list.goodsStatus} &nbsp;</td>	
		
		<c:set var="status" value="${list.goodsStatus}" />
		<td style="font-family:Tahoma;font-size:10pt;">
			<c:if test="${status == '미승인'}">												
				<button  id="confirm"  
					class="flex-c-m stext-101 cl0 size-10 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">승인</button>
			</c:if>
		</td>
		</form>
	</tr>
</c:forEach>
</c:if>
</c:if>
</table>

	<div>
		<c:if test="${empty list}">
			미승인 내역이 없습니다.
		</c:if>
	</div>

	<c:if test="${comNum != 'admin' || empty comNum}">
		<script>swal ( "Warning" ,  "관리자만 이용 가능한 페이지입니다." ,  "error" ) </script>
	</c:if>
		

		<div id="tab-2" class="tab-content">
		
		<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-striped">
	<c:if test="${goodsStatus=='미승인}">
		<tr align="center" valign="middle">
		<td colspan="8" class="info">기업 상품 승인 관리</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="">
		<td style="font-family:Tahoma;font-size:8pt;" width="30%" height="26">
			<div align="center">상품번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품구분</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">상품명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">등록일</div>
	</td>
		<td style="font-family: Tahoma; font-size: 8pt;" width="15%">
			<div align="center">승인상태</div>
		</td>
		<td style="font-family: Tahoma; font-size: 8pt;" width="15%">
			<div align="center">관리</div>
		</td>
		</tr>
		<c:if test="${! empty list}">
		<c:forEach var="list" items="${list}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<form action="confirmList/ok" method="POST" name="okfrm">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<input type="hidden" value="${list.goodsNum}" name="goodsNum">${list.goodsNum}
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			${list.companyKind }			
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<a href="goodsRegDetail.goods/${list.goodsNum}"
				class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
					${list.goodsName} </a>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">${list.companyName}</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			&nbsp; <fmt:formatDate value="${list.regDate}"
													pattern="yy.MM.dd" /> &nbsp;
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">&nbsp; ${list.goodsStatus} &nbsp;</td>	
		
		<c:set var="status" value="${list.goodsStatus}" />
		<td style="font-family:Tahoma;font-size:10pt;">
			<c:if test="${status == '미승인'}">												
				<button  id="confirm"  
					class="flex-c-m stext-101 cl0 size-10 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">승인</button>
			</c:if>
		</td>
		</form>
	</tr>
</c:forEach>
</c:if>
</c:if>
</table>

		</div>
		
<!--     리뷰페이지    -->

<div id="tab-3" class="tab-content">
	<table width=100% border="0" cellpadding="0" cellspacing="0" class="table table-hover">
	
	<c:if test="${! empty dodos}">
	
	<tr align="center" valign="middle">
		<td colspan="5" style="background-color: skyblue; font-weight: bold;">활동리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">활동번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="30%">
			<div align="center">활동명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="15%">
			<div align="center">활동기간</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center"></div>
		</td>
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
			<div align="left">
			<a href="javascript:openChildWindow1('${dodo.doNum }');" id="doNum1" >
				${dodo.doName }
			</a>
			</div>
		</td>		
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				<fmt:formatDate value="${dodo.startDate }" pattern="yy/MM/dd" /> ~
			 <fmt:formatDate value="${dodo.endDate }" pattern="yy/MM/dd" />
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:9.5pt;">	
		<c:if test="${review.reviewNum == null}">		
			<div align="right"><a href="javascript:openReviewWindow('${dodo.doNum }');" id="review" >
				리뷰 작성하러 가기
			</a></div>
		</c:if>
		<c:if test="${review.reviewNum != null}">
			   리뷰 작성완료
		</c:if>
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
				<a href="kendo_list?page=${i+1 }">[${i+1 }]</a>&nbsp;
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
			<font size=2>완료된 활동이 없습니다. 얘들아 나가놀아라.</font>
		</td>
	</tr>
</c:if>
</table>
		</div>
</div>
</div>
</c:if>
</body>

</html>