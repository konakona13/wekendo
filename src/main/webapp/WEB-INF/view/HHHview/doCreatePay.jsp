<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
	uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 
	uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
<script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	$("#cardPay").click(function()
	{
		/* if($("#id1").val()==""|| $("#id1").val()==null)
		{
			$("#id1").focus();
			$("#msg").html("아이디를 입력하세요");
			return false;
		}
		var url = "confirmId?id1="+$("#id1").val(); */
		var url = "doCreateCardPay"
		open(url,"cardPay","width=300, height=500");
	});
	
	$("#kakaoBtn").click(function()
			{
				/* if($("#id1").val()==""|| $("#id1").val()==null)
				{
					$("#id1").focus();
					$("#msg").html("아이디를 입력하세요");
					return false;
				}
				var url = "confirmId?id1="+$("#id1").val(); */
				var url = "kakao?doName="+$("#doName").val()
						 +"&sumPrice="+$("#sumPrice").val();
				open(url,"kakaoPay","width=300, height=500");
	});
});

function payComplete()
{
   $("#comp").submit();
}

function payFail()
{
	location.href = "main";
}

</script>
    
</head>
<body>
	
	
    <h1>최종견적서?</h1>
    <p>고객명(활동장) : ${kendo.hostNum }</p>
    <p>활동명 :  ${kendo.doName}</p>
    <p>활동시작일 : ${kendo.doStartDate}</p>
    <p>활동종료일 : ${kendo.doEndDate}</p>
    <p>모집인원 : ${kendo.doPp}</p>
	
	<c:forEach var="goods" items="${goodsList}">
    <c:set var="goodsNum" value="${goods.goodPlaceNum}"></c:set>
    
    <%-- <c:if test="${fn:contains(goodsNum,'GDP') }">
     	<p>if활동장소명 : ${goods.goodPlaceName} </p>
    	<p>장소이용금액 : ${goods.totalPrice} </p>
   	</c:if>  --%>
   	★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
	    <c:choose>
				<c:when test="${fn:contains(goodsNum,'GDP') }">
					=장소상품=
					<p>활동장소명 : ${goods.goodPlaceName} </p>
					<p>장소사용기간 : ${goods.buyDays} 일</p>
		    		<p>장소이용금액 : ${goods.totalPrice} </p>
				</c:when>
				
				<c:when test="${fn:contains(goodsNum,'GDH') }">
					=숙박상품=
				 	<p>숙박상품명 : ${goods.goodPlaceName} </p>
				 	<p>숙박사용기간 : ${goods.buyDays} 일</p>
				    <p>숙박이용총금액 : ${goods.totalPrice}</p>
				</c:when>
				
				<c:when test="${fn:contains(goodsNum,'GDC') }">
					=렌트카상품=
				    <p>렌터카상품명 : ${goods.goodPlaceName} </p>
				    <p>렌터카이용기간 : ${goods.buyDays} 일</p>
				    <p>렌터카이용총금액 : ${goods.totalPrice}</p>
				</c:when>
				
				<c:when test="${fn:contains(goodsNum,'GDM') }">
					=멘토상품=
				 	<p>멘토명 : ${goods.goodPlaceName} </p>
				 	<p>멘토이용기간 : ${goods.buyDays} 일</p>
				    <p>멘토이용총금액 : ${goods.totalPrice}</p>
				</c:when>
				
				<c:otherwise> ... </c:otherwise>
				
	    </c:choose>
	</c:forEach>
   	 ★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
    <p>결제 금액 : ${sumPrice}</p>
    

	<div id="confirmPayDiv">
	<input id="confirmPay" type="text" value="미완료">
	</div>


	<div id="cardPay">
	<input type="button" value="카드결제">
	</div>
	
	
    <form action="kakao" method="post">
            <input type="button" id="kakaoBtn" value="카카오페이">
            <input type="text" name="doName" id="doName" value="${kendo.doName}">
            <input type="text" name="sumPrice" id="sumPrice" value="${sumPrice}">
    </form>
    

    
    
    
    <form action="doPayComplete" id="comp">
    	
    	<input type="text" id="hostNum" name="hostNum" value="${kendo.hostNum }">
    	<input type="text" id="pp" name="pp" value="${kendo.doPp}">
    	<input type="text" id="price" name="price" value="${placeGoods.goodsPrice}">
    	
    	<p>카드회사명<input type="text" id="cardCompany" name="cardCompany"></p>
    	<p>카드번호<input type="text" id="cardNum" name="cardNum"></p>
        <p>CVC<input type="text" id="cardCvc" name="cardCvc"></p>
        <p>카드비밀번호<input type="text" id="cardPass" name="cardPass"></p>
        <p>카드유효기간<input type="text" id="cardDate" name="cardDate"></p>
        <p>이메일(선택:영수증)<input type="text" id="cardEmail" name="cardEmail" value="none"></p>
    	
    </form>
    
</body>
</html>