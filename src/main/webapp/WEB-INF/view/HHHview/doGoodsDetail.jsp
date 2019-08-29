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
		$("#selctPlaceBtn").click(function()
		{
			
			if($("#goodsKind").val() == "place")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("PlaceName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("PlaceNum").value = txt;
				var txt = $('#buyDays').val();
				opener.document.getElementById("placeDays").value = txt;
				
				}
			else if($("#goodsKind").val() == "hotel")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("hotelName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("hotelNum").value = txt;
				var txt = $('#buyDays').val();
				opener.document.getElementById("hotelDays").value = txt;
				}
			else if($("#goodsKind").val() == "rent")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("rentName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("rentNum").value = txt;
				}
			else if($("#goodsKind").val() == "mento")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("mentoName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("mentoNum").value = txt;
				}
			$("#frm").submit();
			
			 
			 /* var txt = $('#companyNum').val();
				opener.document.getElementById("companyNum").value = txt;
				
				var txt = $('#buyQty').val();
				opener.document.getElementById("buyQty").value = txt;
				var txt = $('#buyStartDate').val();
				opener.document.getElementById("buyStartDate").value = txt;
				var txt = $('#buyEndDate').val();
				opener.document.getElementById("buyEndDate").value = txt;
				var txt = $('#buyDays').val();
				opener.document.getElementById("buyDays").value = txt;
				var txt = $('#buyPrice').text();
				opener.document.getElementById("buyPrice").value = txt; */
		});
		
		$("#buyQty").click(function()
		{
			var price = $('#goodspri').text();
			price = Number(price);
			var qty = $('#buyQty').val();
			qty = Number(qty);
			var dayby = $('#buyDays').val();
			
			price = price*qty*dayby;
			var totalPrice = $('#buyPrice').text(price);
			$('#totalPrice').val(price);
		});
		
		$("#buyDays").click(function()
				{
					var price = $('#goodspri').text();
					price = Number(price);
					var qty = $('#buyQty').val();
					qty = Number(qty);
					var dayby = $('#buyDays').val();
					
					price = price*qty*dayby;
					var totalPrice = $('#buyPrice').text(price);
					$('#totalPrice').val(price);
				});
		
		/* $("#buyQty").click(function()
				{
					
					var startD = $('#buyStartDate').val();
					
					var endD = $('#buyEndDate').val();
					
					
					
					$('#buyEndDate').val(startD);
				}); */
		
		
	});



</script>

    
</head>
<body>
<form action="selectBuyGoods" id="frm">
<input type="hidden" id="goodPlaceName" name="goodPlaceName" value="${goods.goodsName}">
<input type="text" id="goodPlaceNum" name="goodPlaceNum" value="${goods.goodsNum}">
<input type="text" id="companyNum" name="companyNum" value="${goods.companyNum}">
<input type="text" id="totalPrice" name="totalPrice" value="${goods.goodsPrice}" >
<input type="text" id="goodsKind" value="${goodsKind}" >

    <h1> 상세페이지</h1>
    <p>상품이름 : ${goods.goodsName}</p>
   	<p>상세내용 : ${goods.goodsDetail}</p>
    <p>주의사항 : ${goods.goodsDanger}</p>
    <p>상품수량 : ${goods.goodsStock}</p>
    <p>금액(1일1인) : <span id="goodspri">${goods.goodsPrice}</span></p>
    <p>메인사진</p>
    <p>연락처</p>
    <p>상세주소</p>
    <p>상세사진</p>
   	<div>
        <jsp:include page="testCalander.jsp" flush="true"/>
    </div>
   <!--  <p>대여시작날짜 <input type="date" id="buyStartDate" name="buyStartDate"> </p>
    <p>반납예정날짜 <input type="date" id="buyEndDate" name="buyEndDate"> </p> -->
    <p>총대여일 <input type="number" id="buyDays" name="buyDays" min="1" max="30" value="1" required/> </p>
    <p>상품수량<input type = "number" id="buyQty" name = "buyQty" min="1" max="${goods.goodsStock}" value="1" required/></p>
    <p>총금액 : <span id="buyPrice">${goods.goodsPrice}</span></p>
    
    <p> <input type="button" id="selctPlaceBtn" value="선택"></p>
   
        <input type="button" value="닫기" onclick="window.close();">

   
</form>


</body>
</html>