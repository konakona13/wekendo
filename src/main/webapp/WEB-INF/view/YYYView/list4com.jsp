<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Goods List</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="YYYView/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/css/util.css">
	<link rel="stylesheet" type="text/css" href="YYYView/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- GoodsList -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						All Goods
					</button>
					<c:if test="${comNum == 'admin'}">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".place">
						Place
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".hotel">
						Hotel
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".car">
						Car
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".mentor">
						Mentor
					</button>
				  </c:if>
				</div>

				
				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
					</div>	
				</div>

			</div>

			<!-- 상품리스트(일반)-->
			
			<div class="row isotope-grid">
				<c:forEach var="list" items="${list}">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${list.companyKind }">
					<!-- Block2 -->
				
					<div class="block2">
						
						<c:set var="mainImg" value="true" />
						<c:forEach var="Imgs" items="${goodImgs}">
						<c:if test="${Imgs.companyNum eq list.companyNum && list.goodsNum eq Imgs.goodsNum && mainImg }">
						<div class="block2-pic hov-img0">
							<a href="goodsRegDetail.goods/${list.goodsNum}" >
								<img src="YYYView/upload/${Imgs.goodsImgName}" alt="IMG-PRODUCT">
							</a>
						</div>	
						<c:set var="mainImg" value="false" />
						</c:if>
						
						</c:forEach>
						

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="goodsRegDetail.goods/${list.goodsNum}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									상품명 : ${list.goodsName} 
								</a>

								<span class="stext-105 cl3">
									회사명 : ${list.companyName} 
								</span>
								
								<span class="stext-105 cl3"> 
									승인상태 : ${list.goodsStatus} 
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="YYYView/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="YYYView/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
					
				</div>
				</c:forEach>
					</div>
					
				<!-- 가입승인 된 회원만 상품등록 가능하게 조건문 -->
				
				<c:set var="status" value="${company.companyStatus}" />
					
				<c:if test="${status == '승인완료'}">
					<div align="right"> 
				<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
							<a href="goodsReg"> Add Goods </a>
				</button>
			           </div>
				</c:if>
						
				<c:if test="${company.companyStatus == '미승인'}">
						            가입 승인 후에 상품 등록 서비스를 이용하실 수 있습니다.
				</c:if>
			
			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Load More
				</a>
			</div>

		</div>

</div>
	<!-- FOOTER -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->


<!--===============================================================================================-->	
	<script src="YYYView/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/bootstrap/js/popper.js"></script>
	<script src="YYYView/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/daterangepicker/moment.min.js"></script>
	<script src="YYYView/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/slick/slick.min.js"></script>
	<script src="YYYView/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="YYYView/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="YYYView/vendor/sweetalert/sweetalert.min.js"></script>
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
				swal(Success, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		}); 

		/*---------------------------------------------*/

	/*	$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});*/
	
	</script>

<!--===============================================================================================-->
	<script src="YYYView/js/main.js"></script>

</body>
</html>