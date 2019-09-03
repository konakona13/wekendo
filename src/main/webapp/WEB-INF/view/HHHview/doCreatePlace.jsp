<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="HHHview/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/css/util.css">
	<link rel="stylesheet" type="text/css" href="HHHview/css/main.css">
<!--===============================================================================================-->
    
    <title>Document</title>
    <script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
</head>
<body class="animsition" style="animation-duration: 1500ms; opacity: 1;">
	${doPlay }
	
	<input type="text" id="goodsKind" name="goodsKind" value="${goodsKind}">
	
	
	
    <h2>상품리스트</h1>
    
    <form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1"></th>
									<th class="column-2">상품</th>
									<th class="column-3">가격</th>
									<th class="column-4">업체명</th>
									<td class="column-5">수량</td>
								</tr>
 				<c:forEach var="placeGoods" items="${list}">
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<c:set var="mainImg" value="true"/>
									    	<c:forEach var="Imgs" items="${goodImgs}">
									    	 <c:if test="${Imgs.companyNum eq placeGoods.companyNum && placeGoods.goodsNum eq Imgs.goodsNum && mainImg }">
									    	 <img alt="" src="YYYView/upload/${Imgs.goodsImgName }" width="200px" >
									    	 <c:set var="mainImg" value="false"/>
									    	 </c:if>
									    	</c:forEach>
								    	</div>
									</td>
									<td class="column-2"><a href="placeDetail?num=${placeGoods.goodsNum }&goodsKind=${goodsKind}&startDate=${startDate}&endDate=${endDate}">${placeGoods.goodsName }</a></td>
									<td class="column-3"> ${placeGoods.goodsPrice }</td>
									<td class="column-4">
										<c:forEach var="company" items="${companyList}">
								    	 <c:if test="${placeGoods.companyNum eq company.companyNum }">
								    	${company.companyName }
								    	 </c:if>
								    	</c:forEach>
									</td>
									<td class="column-5">1</td>
								</tr>
								
     				</c:forEach>
								
							</table>
						</div>
					</div>
				</div>

				
			</div>
		</div>
	</form>
    
<!--===============================================================================================-->	
	<script src="HHHview/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/bootstrap/js/popper.js"></script>
	<script src="HHHview/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	
<!--===============================================================================================-->
	<script src="HHHview/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->
	<script src="HHHview/js/main.js"></script>
    
    
    
</body>
</html>