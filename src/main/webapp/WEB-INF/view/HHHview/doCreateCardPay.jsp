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
		var txt = "카드결제완료";
		opener.document.getElementById("confirmPay").value = txt;
		window.close();
	});
});



</script>
    
    
</head>
<body>
    <form action="결제완료.html">
        <h1>새창으로뜬 카드결제?</h1>
        <p>
            카드사명
             <select name="" id="">
            <option value="">신한</option>
            <option value="">삼성</option>
            <option value="">현대</option>
        </select>
        </p>
        <p>카드소유자명<input type="text"></p>
        <p>카드번호<input type="text"></p>
        <p>카드유효기간<input type="text"></p>
        <p>카드비밀번호<input type="text"></p>
        <p>이메일(선택:영수증)<input type="text"></p>
       
        <input id="cardPay" type="submit" value="결제">
        
    </form>
   

    
</body>
</html>