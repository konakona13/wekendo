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


</script>
    
</head>
<body>
    <h1>최종견적서?</h1>
    <p>고객명(활동장)</p>
    <p>활동명</p>
    <p>활동시작일</p>
    <p>활동종료일</p>
    <p>모집인원</p>

    <p>활동장소명</p>
    <p>장소이용총금액</p>
    <p>이용숙박상품명</p>
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
	
    
    <form action="카카오페이.html">
            <input type="submit" value="카카오페이">
    </form>
    
    
</body>
</html>