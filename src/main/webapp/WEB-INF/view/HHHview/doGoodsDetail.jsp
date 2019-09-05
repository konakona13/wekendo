<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />
<%
	response.setCharacterEncoding("utf-8");
 %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Kendo Detail</title>
		<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="HHHview/css/util.css">
	<link rel="stylesheet" type="text/css" href="HHHview/css/main.css">
<!--===============================================================================================-->

</head>
<body class="animsition">
	



	<!--Body 시작-->
	<form action="selectBuyGoods" id="frm">
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



									<c:forEach var="Imgs" items="${goodImgs}">
											
											<c:if test="${Imgs.goodsNum eq goods.goodsNum}">	
																	
												<div class="item-slick3" data-thumb="YYYView/upload/${Imgs.goodsImgName }">
													<div class="wrap-pic-w pos-relative">
														<img src="YYYView/upload/${Imgs.goodsImgName }" alt="IMG-PRODUCT">
														<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="YYYView/upload/${Imgs.goodsImgName }">
															<i class="fa fa-expand"></i>
														</a>
													</div>
												</div>
												
											</c:if>
											
									</c:forEach>

				

	
							</div>
						</div>
					</div>
				</div>
				
				
		

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h2 >
						${goods.goodsName}
						</h2>
						<input type="hidden" id="goodPlaceName" name="goodPlaceName" value="${goods.goodsName}">
						<p>
							<input type="hidden" id="goodPlaceName" name="goodPlaceName" value="${goods.goodsName}">
							<input type="hidden" id="goodPlaceNum" name="goodPlaceNum" value="${goods.goodsNum}">
							<input type="hidden" id="companyNum" name="companyNum" value="${goods.companyNum}">
							<input type="hidden" id="totalPrice" name="totalPrice" value="${goods.goodsPrice}" >
							<input type="hidden" id="goodsKind" value="${goodsKind}" >
						</p>

						
					   	
					  
					    
						<br/>
						<jsp:include page="testCalander.jsp" flush="false"/>
						
						
						
   						<br/> 
   						 <p>총대여일 <input type="number" id="buyDays" name="buyDays" min="1" max="30" value="1" required/> </p>
					    <br/> 
					    
					    <p>금액(1일1인) : <span id="goodspri">${goods.goodsPrice}</span></p>
					    <br/>
					    <h5>총금액 : <span id="buyPrice">${goods.goodsPrice}</span></h5>
					    <p></p>

						<!--  -->
						<div class="p-t-33">

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									

									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"  id="selctPlaceBtn">
										선택하기
									</button>
								</div>
							</div>	
						</div>
					
						<!--  -->
						
					</div>
				</div>
			</div>
</form>
			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">상세설명</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">추가정보</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">이용후기 (1)</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
									${goods.goodsDetail}<br />
								</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<ul class="p-lr-28 p-lr-15-sm">
										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												연락처
											</span>
											
   						

											<span class="stext-102 cl6 size-206">
												${company.companyPh}
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												상세주소
											</span>

											<span class="stext-102 cl6 size-206">
												${company.companyAddr}
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												주의사항
											</span>

											<span class="stext-102 cl6 size-206">
												${goods.goodsDanger}
											</span>
										</li>

										
									</ul>
								</div>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="reviews" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<div class="flex-w flex-t p-b-68">
											<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6">
												<img src="HHHview/images/avatar-01.jpg" alt="AVATAR">
											</div>

											<div class="size-207">
												<div class="flex-w flex-sb-m p-b-17">
													<span class="mtext-107 cl2 p-r-20">
														Ariana Grande
													</span>

													<span class="fs-18 cl11">
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star"></i>
														
													</span>
												</div>

												<p class="stext-102 cl6">
													Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos
												</p>
											</div>
										</div>
										
										<!-- Add review -->
										<form class="w-full">
											<h5 class="mtext-108 cl2 p-b-7">
												Add a review
											</h5>

											<p class="stext-102 cl6">
												Your email address will not be published. Required fields are marked *
											</p>

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
													<input class="dis-none" type="number" name="rating">
												</span>
											</div>

											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">Your review</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="name">Name</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="name" type="text" name="name">
												</div>

												<div class="col-sm-6 p-b-5">
													<label class="stext-102 cl3" for="email">Email</label>
													<input class="size-111 bor8 stext-102 cl2 p-lr-20" id="email" type="text" name="email">
												</div>
											</div>

											<button class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">
												Submit
											</button>
										</form>


									</div>
								</div>
							</div>
						</div>
						<!-- - -->
					</div>
				</div>
			</div>
		</div>


	</section>

	
	
	
	
        
		
<script type="text/javascript">
	$(function(){
		$("#selctPlaceBtn").click(function()
		{
			
			if($("#goodsKind").val() == "place")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("PlaceName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("PlaceNum").value = txt;
				var txt = $('#buyDays').val();
				opener.document.getElementById("placeDays").value = txt;
				
				}
			else if($("#goodsKind").val() == "hotel")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("hotelName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("hotelNum").value = txt;
				var txt = $('#buyDays').val();
				opener.document.getElementById("hotelDays").value = txt;
				}
			else if($("#goodsKind").val() == "rent")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("rentName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("rentNum").value = txt;
				}
			else if($("#goodsKind").val() == "mento")
				{
				var txt = $('#goodPlaceName').val();
				opener.document.getElementById("mentoName").value = txt;
				var txt = $('#goodPlaceNum').val();
				opener.document.getElementById("mentoNum").value = txt;
				}
			$("#frm").submit();
			
			 
			 /* var txt = $('#companyNum').val();
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
				opener.document.getElementById("buyPrice").value = txt; */
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
			$('#totalPrice').val(price);
		});
		
		$("#buyDays").change(function()
				{
					var price = $('#goodspri').text();
					price = Number(price);
					
					var dayby = $('#buyDays').val();
					
					price = price*dayby;
					var totalPrice = $('#buyPrice').text(price);
					$('#totalPrice').val(price);
				});
	
		
	});

function changePrice() {
	var price = $('#goodspri').text();
	price = Number(price);
	var dayby = $('#buyDays').val();
	
	price = price*dayby;
	var totalPrice = $('#buyPrice').text(price);
	$('#totalPrice').val(price);
}

</script>


<!--===============================================================================================-->
	<script src="HHHview/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/bootstrap/js/popper.js"></script>
	<script src="HHHview/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	
<!--===============================================================================================-->
	<script src="HHHview/vendor/slick/slick.min.js"></script>
	<script src="HHHview/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="HHHview/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="HHHview/vendor/sweetalert/sweetalert.min.js"></script>
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