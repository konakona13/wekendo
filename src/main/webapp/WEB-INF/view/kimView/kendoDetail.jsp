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
	<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>

<script type="text/javascript">
	$(function(){
		$("#doQty").change(function(){
			var doQty = parseInt($("#doQty").val());
			var doPrice = parseInt($("#doPrice").val());
			var totalPrice = doQty * doPrice ;
			$("#totalPrice").val(totalPrice);
		});
		
		$("#goPament").click(function(){
			if($("#memId").val() == null){
				alert('로그인이 필요합니다.');
				return false;
			}
			
			var memGen = $("#gender").val();
			var memBirth = $("#birth").val();
			var doOptGender = $("#doOptGender").val();
			var doOptAge = $("#doOptAge").val();
			
		    if(doOptGender != 'allPP' && memGen != doOptGender){
				alert('모집 성별이 맞지 않습니다.');
				return false;
			} 
			if(${toDay.year - membOpt.memberBir.year +1} < 20){
				alert('모집 연령이 맞지 않습니다.');
				return false;
			}
			
		});
	});

</script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
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

			<span class="stext-109 cl4">
				수상레저
			</span><br/>
			<% session.getAttribute("memAuth"); %> <input type = "hidden" id = "memId" name = "memId" value = "${memAuth.id}"/>${memAuth.id} 님 로그인 중 <br/>
        
			
		</div>
	</div>
		



	<!--Body 시작-->

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
			
				<form name="kendoJoin" action="kendoJoin" method="POST"> 
				
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>


							
							<div class="slick3 gallery-lb">
							
							<c:forEach var="kendoImg" items="${kendoImgs}">
							<c:set var ="doImgKind" value="${kendoImg.doImgKind}" scope="session" />
							<c:if test="${doImgKind == 'main'}">	
													
								<div class="item-slick3" data-thumb="../HHHview/doIMG/${kendoImg.doImgName}">
									<div class="wrap-pic-w pos-relative">
										<img src="../HHHview/doIMG/${kendoImg.doImgName}" alt="IMG-PRODUCT">
										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../HHHview/doIMG/${kendoImg.doImgName}">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								
							</c:if>
							<c:if test="${doImgKind != 'main'}">	
													
								<div class="item-slick3" data-thumb="../HHHview/doIMG/${kendoImg.doImgName}">
									<div class="wrap-pic-w pos-relative">
										<img src="../HHHview/doIMG/${kendoImg.doImgName}" alt="IMG-PRODUCT">
										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../HHHview/doIMG/${kendoImg.doImgName}">
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
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
						<input type = "hidden" name = "doName" value = "${kendoDtail.doName}"/>${kendoDtail.doName}
						</h4>
						
						<p>
							활동번호 :<input type = "hidden" name = "doNum" value = "${kendoDtail.doNum}"/>${kendoDtail.doNum}<br />
                  			호스트번호 : <input type = "hidden" name = "hostNum" value = "${kendoDtail.hostNum}"/>${kendoDtail.hostNum}<br />              
      					  	 *성별 제한: <input type = "hidden" id = "doOptGender" value = "${kendoDtail.doOptGender}"/>${kendoDtail.doOptGender}<br />
						  	 *나이 제한 : <input type = "hidden" id = "doOptAge" value = "${kendoDtail.doOptAge}"/>${kendoDtail.doOptAge}<br />
									<input type = "hidden" name = "doName" value = "${kendoDtail.doName}"/>${kendoDtail.doName}</h3> <br />
							모집인원  :<input type = "hidden" name = "doPp" value = "${kendoDtail.doPp}"/>${kendoDtail.doNowPp}/${kendoDtail.doPp}<br />
						  	<input type = "hidden" name = "doNowPp" value = "${kendoDtail.doNowPp}"/><br />
							신청수량 : <input type = "number" id ="doQty" name = "doQty" min="1" max="${kendoDtail.doPp - kendoDtail.doNowPp}" required/><br /> 
							가 격 : <input type = "hidden" name = "doPrice"  id ="doPrice" value = "${kendoDtail.paymentKim.payDutch}"/><fmt:formatNumber pattern="###,###,###" value="${kendoDtail.paymentKim.payDutch}" />원<br /> 
							총금액 : <input type = "text" name = "totalPrice"  id ="totalPrice" value="" placeholder=""/><fmt:formatNumber pattern="###,###,###" value="" />원<br />  
						</p>
						
						<!-- member 정보 -->
						<c:if test="${memAuth.id != null}">
							*사용자 성별:<input type = "hidden" id = "gender" name = "gender" value = "${membOpt.gender}"/>${membOpt.gender}<br /> 
							*사용자 생일:<input type = "hidden" id = "birth" name = "birth" value = "${membOpt.memberBir}"/>${membOpt.memberBir}<br /> 
							
							<fmt:formatDate  value="${toDay}" pattern="yyyy"/><br/>
						   <fmt:formatDate value="${membOpt.memberBir}"  pattern="yyyy"/><br/>
						   <fmt:formatNumber value="${toDay.year - membOpt.memberBir.year +1}" />
						</c:if>
						<input type = "submit" value = "활동참가" id = "goPament" name = "doJoin"/>
		

						<!--  -->
						<div class="p-t-33">

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>
										

										<input class="mtext-104 cl3 txt-center num-product" type = "number" id ="doQty" name="num-product" min="1" max="${kendoDtail.doPp - kendoDtail.doNowPp}" required/>
										
										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>

									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
										구매하기
									</button>
								</div>
							</div>	
						</div>
</form>
						<!--  -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

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
									<input type = "hidden" value="${kendoDtail.doDetail}"/>${kendoDtail.doDetail}<br />
									<c:forEach var="kendoImg" items="${kendoImgs}">
										<c:set var ="doImgKind" value="${kendoImg.doImgKind}" scope="session" />
										<c:if test="${doImgKind != 'main'}">
										<br/>
                						<img src="../HHHview/doIMG/${kendoImg.doImgName}"  width="400"><br/>
										</c:if>
                					</c:forEach>
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
												Weight
											</span>

											<span class="stext-102 cl6 size-206">
												0.79 kg
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Dimensions
											</span>

											<span class="stext-102 cl6 size-206">
												110 x 33 x 100 cm
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Materials
											</span>

											<span class="stext-102 cl6 size-206">
												60% cotton
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Color
											</span>

											<span class="stext-102 cl6 size-206">
												Black, Blue, Grey, Green, Red, White
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												Size
											</span>

											<span class="stext-102 cl6 size-206">
												XL, L, M, S
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
												<img src="images/avatar-01.jpg" alt="AVATAR">
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
														<i class="zmdi zmdi-star"></i>
														<i class="zmdi zmdi-star-half"></i>
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
					</div>
				</div>
			</div>
		</div>


	</section>


		



<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
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
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	<script src="js/main.js"></script>

</body>
</html>