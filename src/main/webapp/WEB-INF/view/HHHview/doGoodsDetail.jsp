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
			var txt = "dddd";
			opener.document.getElementById("PlaceName").value = txt;
			window.close();
		});
	});



</script>

    
</head>
<body>
    <h1> 상세페이지</h1>
    <p>상품이름 : ${goods.goodsName}</p>
   	<p>상세내용 : ${goods.goodsDetail}</p>
    <p>주의사항 : ${goods.goodsDanger}</p>
    <p>상품수량 : ${goods.goodsStock}</p>
    <p>금액(1일1인) : ${goods.goodsPrice}</p>
    <p>장소명</p>
    <p>메인사진</p>
    <p>연락처</p>
    <p>상세주소</p>
    <p>상세사진</p>
    
    <p>총금액</p>
    
    <p> <input type="button" id="selctPlaceBtn" value="선택"></p>
   
        <input type="submit" value="닫기" onclick="window.close();">

   



</body>
</html>