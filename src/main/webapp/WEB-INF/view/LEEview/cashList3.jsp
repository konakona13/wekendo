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
 			  		<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function func_cash(){
		if($("#cashInBalance").val()<=0){
			alert('정산할 내역이 더 이상 없습니다.');
			location.href="Cashin";
			return false;
		}else{
			$("#frm").submit();
			return false;
		}
	}
	
	function openBuyNumWindow() {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=750,left=500,top=20';
		window.open("BuybuyDetail?buyNum=" + $("#buyNum").val(), "buybuyDetail", settings);
	}
	
	function openGoodsNumWindow() {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=750,left=500,top=20';
		window.open("goodsDetail?goodsName=" + $("#goodsName").val(), "goodsDetail", settings);
	}
	
	function openDoNumWindow() {
		// 새창에 대한 세팅(옵션)
		var settings = 'toolbar=0,directories=0,status=no,menubar=0,scrollbars=auto,resizable=no,height=700,width=750,left=500,top=20';
		window.open("DoBuyDetail?doName=" + $("#doName").val(), "doBuyDetail", settings);
	}
	
</script>
<body>
	<div id="container" style="width: 1500px">
		<div id="header" style="background-color: white;">
		<form action="buybuySearch" name="frm" method="post">
			기업이름 : <input type="text" name="comName" ><input type="submit" name="comNameSubmit" value="검색" class="btn btn-default">
			<a href="Cashin" class="btn btn-default ">전체 기업 리스트</a>
		</form>
		</div>
		<div id="content1" 
			style="background-color:white-space; height: 500px; width: 700px; float: left; margin: 10px; ">
			
			<table width=100% border="1" cellpadding="0" cellspacing="0" class="table table-striped">
<c:if test="${! empty cashins}">
	<tr align="center" valign="middle">
		<td colspan=54">정산리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">정산월</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">정산번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">결제번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품금액</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">정산금액</div>
		</td>
	</tr>
<c:forEach var="cashin" items="${cashins}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
				<fmt:formatDate value="${cashin.days }" pattern="yy/MM/dd" />
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
				${cashin.cashinNum }
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<input type="hidden" id="doNum" name="doNum" value="${dodo.doNum }">
			<a href="javascript:openChildWindow();" >
				${cashin.payNum }
			</a>
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			${cashin.totalPrice }
			</div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${cashin.balance }</div>
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
<c:set var = "sumBalance" value = "0" />
<c:forEach var="cashin1" items="${cashins}">
<c:set var= "sumCash" value="${sumCash + cashin1.totalPrice}"/>
<c:set var= "sumBalance" value="${sumBalance + cashin1.balance}"/>
</c:forEach>
<br>
<div class="container">
*정산계산방법 : <br><br>
총 상품금액 * 위캔두 수수료 50% = 
<h4><c:out value="${sumBalance}"/>원</h4>
</div>
		</div>
		<div id="content2"
			style="background-color: white-space; height: 500px; width: 700px; float: left; margin: 10px" >
			
			<table width=100% border="1" cellpadding="0" cellspacing="0" class="table table-striped">
<c:if test="${! empty buybuys}">
	<tr align="center" valign="middle">
		<td colspan="7">구매리스트</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="10%" height="26">
			<div align="center">결제월</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">구매번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">기업이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품명</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">활동이름</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품수량</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="10%">
			<div align="center">상품가격</div>
		</td>
	</tr>
<c:forEach var="buybuy" items="${buybuys}">
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><fmt:formatDate value="${buybuy.dutchDate }" pattern="yy년 MM월" />
			</div>
		</td>
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
		<div align="center">
			<input type="hidden" id="buyNum" name="buyNum" value="${buybuy.buyNum }">
			<a href="javascript:openBuyNumWindow();" >
				${buybuy.buyNum }
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${buybuy.companyName }
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<input type="hidden" id="goodsName" name="goodsName" value="${buybuy.goodsName }">
			<a href="javascript:openGoodsNumWindow();" >
				${buybuy.goodsName }
			</a>
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">
			<input type="hidden" id="doName" name="doName" value="${buybuy.doName }">
			<a href="javascript:openDoNumWindow();" >
				${buybuy.doName }
			</a>
			</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${buybuy.buyQty }
			</div>
		</td>		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${buybuy.buyPrice }</div>
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
			<font size=2>구매내역이 없습니다. 사주셈</font>
		</td>
	</tr>
</c:if>
</table>

<c:set var = "sumBuy" value = "0" />
<c:forEach var="buybuy1" items="${buybuys}">
<c:set var= "sumBuy" value="${sumBuy + buybuy1.buyPrice}"/>
</c:forEach>
<br>
<div class="container">
총 판매금액 : <c:out value="${sumBuy}"/>원</div>
			
			
		</div>
		<div id="footer" style="background-color: white-space; height:300px; clear: both; border: 5pt groove #3f51b5;" class="container">
		정산 예정 금액 계산 : <br>
		(${sumBuy} - ${sumCash}) * 위켄두수수료(판매가50%) = <c:out value="${(sumBuy - sumCash) * 0.5}"/> 원
		<form action="cashInsert" id="frm" name="frm" method="post">
			<input type="button" name="cashSubmit" value="정산승인" onclick="func_cash()"> 
			<input type="hidden" value="${comName }" name="comName2">
			<input type="hidden" id="cashInBalance" name="cashInBalance" value="<c:out value="${(sumBuy - sumCash) * 0.5}"/>"> 
			<input type="hidden" name="cashInTotal" value="(${sumBuy} - ${sumCash})"> 
		</form>
		</div>
	</div>
</body>
</html>