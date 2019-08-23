<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		open(url,"Pay","width=300, height=500");
	});
});

function payComplete()
{
   $("#comp").submit();
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

    <p>활동장소명 : ${placeGoods.goodsName} </p>
    <p>장소이용금액 : ${placeGoods.goodsPrice} </p>
    
    <p>이용숙박상품명 : </p>
    <p>숙박이용기간</p>
    <p>숙박이용총금액</p>
    
    <p>렌터카상품명</p>
    <p>렌터카이용기간</p>
    <p>렌터카이용총금액</p>
    
    <p>멘토명</p>
	<p>멘토이용기간</p>
    <p>멘토이용총금액</p>
    
    <p>전상품총금액</p>
    <p>인당결제금액</p>

	<div id="confirmPayDiv">
	<input id="confirmPay" type="text" value="미완료">
	</div>


	<div id="cardPay">
	<input type="button" value="카드결제">
	</div>
	
    
    <form action="#">
            <input type="submit" value="카카오페이">
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