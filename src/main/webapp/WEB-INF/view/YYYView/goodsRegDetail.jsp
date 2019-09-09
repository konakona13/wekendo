<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<%
	response.setCharacterEncoding("utf-8");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Goods Detail</title>
		<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../YYYView/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../YYYView/css/util.css">
	<link rel="stylesheet" type="text/css" href="../YYYView/css/main.css">
<!--===============================================================================================-->
	<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<body class="animsition">
	

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="product.html" class="stext-109 cl8 hov-cl1 trans-04">
				액티비티
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			
			
			<span class="stext-109 cl4" >
				수상레저
			</span>

			
		</div>
		
			<div align="right">
				<% session.getAttribute("comAuth"); %> <input type = "hidden" id = "comId" name = "comId" value = "${comAuth.id}"/>${comAuth.id} 님 로그인 중 <br/>
            </div>
	</div>
		



	<!--Body 시작-->

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">


						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">


								<c:set var="mainImg" value="true" />
								<c:forEach var="list" items="${imgList}">
									<c:choose>
										<c:when
											test="${Imgs.companyNum eq list.companyNum && list.goodsNum eq Imgs.goodsNum && mainImg }">

											<div class="item-slick3" data-thumb="../YYYView/upload/${list.goodsImgName}">
												<div class="wrap-pic-w pos-relative">
													<img src="../YYYView/upload/${list.goodsImgName}"	alt="IMG-PRODUCT"/>
													 <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"	href="../YYYView/upload/${list.goodsImgName}"> 
													 	<i class="fa fa-expand"></i>
													</a>
												</div>
											</div>
											<c:set var="mainImg" value="false" />
										</c:when>
										<c:otherwise>

											<div class="item-slick3"
												data-thumb="../YYYView/upload/${list.goodsImgName}">
												<div class="wrap-pic-w pos-relative">
													<img src="../YYYView/upload/${list.goodsImgName}"
														alt="IMG-PRODUCT"> <a
														class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
														href="../YYYView/upload/${list.goodsImgName}"> <i
														class="fa fa-expand"></i>
													</a>
												</div>
											</div>

										</c:otherwise>
									</c:choose>
								</c:forEach>




							</div>
						</div>
					</div>
				</div>




				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							<input type="hidden" name="goodsName" value="${goods.goodsName}" />
							${goods.goodsName}
						</h4>
						<br>
						<p>
							By
							<!-- company 테이블에서 이름 불러오기 -->
							${goodsList.companyName}<br>
							<br> ${goods.goodsStock} &nbsp;ea &nbsp; | &nbsp; 
							${goods.goodsPrice} &nbsp;원<br>
							<br> 지역:
							<!-- mapLarge,M,S 테이블에서 이름 불러오기 -->
							${mapTheme.mapLName} > ${mapTheme.mapMName} >
							${mapTheme.mapSName} <br>
							<br> 테마:
							<!-- themeLarge,M,S 테이블에서 이름 불러오기 -->
							${mapTheme.themeLName}> ${mapTheme.themeMName} >
							${mapTheme.themeSName} <br>
							<br>	
							<br>
						<p>
					</div>
				</div>
				</div>


				<div class="bor10 m-t-50 p-t-43 p-b-40">
					<div class="tab01">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item p-b-10">
							<a class="nav-link active"
								data-toggle="tab" href="#description" role="tab">상세내용</a></li>
						</ul>
						
						<!-- Tab panes -->
						<div class="tab-content p-t-43">
							<!-- - -->
							<div class="tab-pane fade show active" id="description"
								role="tabpanel">
								<div class="how-pos2 p-lr-15-md">
									<p >									 
										주의사항 : ${goods.goodsDanger}
									</p><br><br>
									
									<div style="white-space:pre-line;">
									<p class="stext-102 cl6">										
											${goods.goodsDetail}			
									</p>
									</div>
								</div>
							</div>

							<a href="javascript:history.back()">[목록]</a>

						</div>
					</div>
				</div>
			</div>
			

	</section>


<!--===============================================================================================-->	
	<script src="../YYYView/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../YYYView/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../YYYView/vendor/bootstrap/js/popper.js"></script>
	<script src="../YYYView/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../YYYView/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="../YYYView/vendor/daterangepicker/moment.min.js"></script>
	<script src="../YYYView/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../YYYView/vendor/slick/slick.min.js"></script>
	<script src="../YYYView/js/slick-custom.js"></script>
<!--===============================================================================================-->
	
<!--===============================================================================================-->
	<script src="../YYYView/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="../YYYView/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="../YYYView/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>

<!--===============================================================================================-->
	<script src="../YYYView/js/main.js"></script>



</body>
</html>