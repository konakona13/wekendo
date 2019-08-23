<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>

	<form action="GoodsDetailAction" name="detail" id="detail" method="POST" >
	<h3> 등록 상세 <h3>
	<br><br><br>
	승인 상태 : ${goods.goodsStatus} &nbsp; | &nbsp;
	상품명: ${goods.goodsName} <br><br>
		
	회사명 : <!-- company 테이블에서 이름 불러오기 -->
		 ${comeAtuh.name}<br><br>
	
	수량 : ${goods.goodsStock} &nbsp; | &nbsp; 
	상품금액 : ${goods.goodsPrice}<br><br>
	
	지역:  <!-- mapLarge,M,S 테이블에서 이름 불러오기 -->
		<a> ${goods.mapLName} &nbsp; ${goods.mapMName} &nbsp; ${goods.mapSName} </a> <br><br>	 
	테마:  <!-- themeLarge,M,S 테이블에서 이름 불러오기 -->
		<a>${goods.themeLName} &nbsp; ${goods.themeMName} &nbsp; ${goods.themeSName} </a> <br><br>		
	
	메인 이미지:  <br><br>
	상세 이미지: <br><br>
	상세내용 : ${goods.goodsDetail}<br><br>
	주의사항 : ${goods.goodsDanger} <br><br>
	
	
	<br><br><br><br>
	
	<a href="goodsModify/${goods.goodsNum}">[수정]</a>&nbsp;&nbsp;
	<a href="goodsDelete/${goods.goodsNum}">[삭제]</a>&nbsp;&nbsp;
	<a href="../goodsMain">[목록]</a>&nbsp;&nbsp;

</form>




</body>
</html>