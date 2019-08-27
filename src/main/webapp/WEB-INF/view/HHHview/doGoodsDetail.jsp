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
			var txt = $('#goodPlaceName').val();
			opener.document.getElementById("PlaceName").value = txt;
			var txt = $('#goodPlaceNum').val();
			opener.document.getElementById("PlaceNum").value = txt;
			var txt = $('#companyNum').val();
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
			opener.document.getElementById("buyPrice").value = txt;
			
			
			
			
			window.close();
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
				});
		
		
	});



</script>

    
</head>
<body>
<input type="hidden" id="goodPlaceName" value="${goods.goodsName}">
<input type="text" id="goodPlaceNum" value="${goods.goodsNum}">
<input type="text" id="companyNum" value="${goods.companyNum}">
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
    <p>대여시작날짜 <input type="text" id="buyStartDate"> </p>
    <p>반납예정날짜 <input type="text" id="buyEndDate"> </p>
    <p>총대여일 <input type="number" id="buyDays" name="buyDays" min="1" max="30" value="1" required/> </p>
    <p>상품수량<input type = "number" id="buyQty" name = "buyQty" min="1" max="${goods.goodsStock}" value="1" required/></p>
    <p>총금액 : <span id="buyPrice">${goods.goodsPrice}</span></p>
    
    <p> <input type="button" id="selctPlaceBtn" value="선택"></p>
   
        <input type="submit" value="닫기" onclick="window.close();">

   



</body>
</html>