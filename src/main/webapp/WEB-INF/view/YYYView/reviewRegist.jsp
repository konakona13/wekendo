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
	<title>Review</title>
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
	<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#submit").click(function(){
	 swal("Success", "리뷰가 등록되었습니다.", "success");
	 $("#reviewFrm").submit();
	 document.location.href = '/reviewAction';
	});
});

</script>

</head>
<body class="animsition">
	
<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
							<a class="nav-link active" data-toggle="tab" href="#reviews" role="tab">이용 후기</a>
					</ul>
						
			<!-- Reivew자리 -->
	
	<div class="tab-content p-t-43" id="reviews" role="tabpanel">
	
		<div class="row">
		
			<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
			<c:forEach var="dodo" items="${dodo}">
			<br>
				<div class="p-b-30 m-lr-15-sm">					
					
					<!-- Add review -->
					
					
					<form class="w-full" action="reviewAction" name ="reviewFrm" id ="reviewFrm" method = "post">
					
					<div class="p-b-30 m-lr-15-sm">	
						<h5 class="mtext-108 cl2 p-b-7" id="name">
							${dodo.goodsName}
						</h5>
						<input type="hidden" value="${dodo.goodsNum}" id="goodsNum" name="goodsNum">
						<input type="hidden" value="${dodo.companyNum}" id="companyNum" name="companyNum">
						<input type="hidden" value="${dodo.doNum}" id="doNum" name="doNum">

						<!-- <p class="stext-102 cl6">
							Your email address will not be published. Required fields are marked *
						</p> -->

						<div class="flex-w flex-m p-t-50 p-b-23">
							<span class="stext-102 cl3 m-r-16">
								Your Rating
							</span>

							<span class="wrap-rating fs-18 cl11 pointer">
								<i class="item-rating pointer zmdi zmdi-star-outline"></i>
								<i class="item-rating pointer zmdi zmdi-star-outline"></i>
								<i class="item-rating pointer zmdi zmdi-star-outline"></i>
								<i class="item-rating pointer zmdi zmdi-star-outline"></i>
								<i class="item-rating pointer zmdi zmdi-star-outline"></i>
								<input class="dis-none" type="number" name="reviewScore" />
							</span>
						</div>

						<div class="row p-b-25">
							<div class="col-12 p-b-5">
								<label class="stext-102 cl3" for="review">Your review</label>
								<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="reviewContent"></textarea>
							</div>

							<div class="col-sm-6 p-b-5">
								<label class="stext-102 cl3" for="name">Name</label>
								<span class="stext-102 cl3 m-r-16">${memAuth.name}</span>
							</div>
						</div>
						
						<div align="center">
								<button id ="submit" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">Submit</button>
						</div>
						</div>
						
						</form>
						
					
					</div>
					<hr width="100%">
					
					</c:forEach>
			
				</div>
			
			</div>
			
		</div>
		
	</div>
	</div>
	</div>

		



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
	<script src="YYYView/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	<script src="YYYView/js/main.js"></script>

</body>
</html>