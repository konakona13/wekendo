<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

<script type="text/javascript">
</script>
</head>
<body>

		<h3> 등록 상세 <h3>
		<br><br><br>

		상품명: ${goods.goodsName} <br><br>
			
		회사명 : <!-- company 테이블에서 이름 불러오기 -->
			 ${goodsList.companyName}<br><br>
		
		수량 : ${goods.goodsStock} &nbsp; | &nbsp; 
		상품금액 : ${goods.goodsPrice}<br><br>
		
		  
		지역:  <!-- mapLarge,M,S 테이블에서 이름 불러오기 -->
			 ${mapTheme.mapLName} &nbsp; ${mapTheme.mapMName} &nbsp; ${mapTheme.mapSName}
			 <br><br>
			
		테마:  <!-- themeLarge,M,S 테이블에서 이름 불러오기 -->
			 ${mapTheme.themeLName} &nbsp; ${mapTheme.themeMName} &nbsp; ${mapTheme.themeSName}
			<br><br><br>
		
		이미지  <br><br>
		<c:forEach var="list" items="${imgList}">
			   <div>
			      <img src="../YYYView/upload/${list.goodsImgName}" width="450px" height="300px" >
			   </div>
		</c:forEach>
				 <br><br>
		상세내용 : ${goods.goodsDetail}<br><br>
		주의사항 : ${goods.goodsDanger} <br><br>
		
		
		<br><br><br><br>
		
		<a href="../goodsModify/${goods.goodsNum}">[수정]</a>&nbsp;&nbsp;
		<a href="../goodsDelete/${goods.goodsNum}">[삭제]</a>&nbsp;&nbsp;
		<a href="javascript:history.back()">[목록]</a>&nbsp;&nbsp;

<br><br>

<!-- 리뷰등록 
			<div id="listReview">
				<table>
					<c:forEach var="review" items="${review}">
						<tr>
							<td>${review.memberName}&nbsp;&nbsp; 
							<fmt:formatDate value="${review.regDate}" pattern="yyyy-MM-dd" />
								&nbsp;&nbsp;&nbsp;&nbsp; ${review.reviewContent}
							</td>
						</tr>
					</c:forEach>
						<tr>
						<td>소중한 리뷰를 남겨주세요.,,</td>
						</tr>
				</table>
			</div>
			<div>
				<textarea rows="5" cols="80" id="reviewContent"></textarea>
				<div id="reviewScore"></div>
				<br>
				<button type="button" id="reviewSubmit">리뷰등록</button>

			</div>-->
</body>
</html>