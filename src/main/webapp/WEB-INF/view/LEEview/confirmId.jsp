<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
			src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){
	//request된값을 text에 저장
	$("#id1").val("${userId}" );
	if("${userId}"==""){
		$("#confirm").html("다시작성해 주세요.");
		$("#confirmNum").val("1")
	}else{
	// msg값을 div에 출력
		$("#confirm").html("${msg}");
		$("#confirmNum").val("${num}");
	}
	$("#btn").click(function(){
		$(opener.document).find("#id1").val($("#id1").val());
		$(opener.document).find("#confirmNum").
		val($("#confirmNum").val());
		window.close();
	});
})
</script>
</head>
<body>
<form name="frm" method="post" action ="confirmId" >
<input type = "text" name="id1" id="id1" /><br />
<input type = "hidden" name = "confirmNum" 
			id="confirmNum" />
<div id="confirm"></div>
<input type="submit" value="ID중복확인">
<input type="button" value="닫기"  id = "btn"/>
</form>
</body>
</html>