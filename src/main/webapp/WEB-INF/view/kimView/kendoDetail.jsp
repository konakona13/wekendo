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
	<link rel="icon" type="image/png" href="../kimView/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../kimView/css/util.css">
	<link rel="stylesheet" type="text/css" href="../kimView/css/main.css">
<!--===============================================================================================-->
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

			var memGen = $("#gender").val();
			var memBirth = $("#birth").val();
			var doOptGender = $("#doOptGender").val();
			var doOptAge = $("#doOptAge").val();
			
			//alert("회원생일 :" + memBirth);
			//alert("연령제한 :" + doOptAge);

			
		    if(doOptGender != '무관' && memGen != doOptGender){
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

</head>
<body class="animsition">
	

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="../main" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<br/>
			<% session.getAttribute("memAuth"); %> <input type = "hidden" id = "memId" name = "memId" value = "${memAuth.id}"/>${memAuth.id} 님 로그인 중 <br/>
        
			<form name="kendoJoin" action="kendoJoin" method="POST"> 
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



									<c:forEach var="kendoImg" items="${kendoImgs}">
											<c:set var ="doImgKind" value="${kendoImg.doImgKind}" scope="session" />
											<c:if test="${doImgKind == 'main'}">	
																	
												<div class="item-slick3" data-thumb="../HHHview/doIMG/${kendoImg.doImgName}">
													<div class="wrap-pic-w pos-relative">
														<img src="../HHHview/doIMG/${kendoImg.doImgName}" alt="IMG-PRODUCT" width="450" height="400">
														<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../HHHview/doIMG/${kendoImg.doImgName}">
															<i class="fa fa-expand"></i>
														</a>
													</div>
												</div>
												
											</c:if>
											<c:if test="${doImgKind != 'main'}">	
																	
												<div class="item-slick3" data-thumb="../HHHview/doIMG/${kendoImg.doImgName}" >
													<div class="wrap-pic-w pos-relative">
														<img src="../HHHview/doIMG/${kendoImg.doImgName}" alt="IMG-PRODUCT" width="450" height="400">
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
					
					<form name="kendoJoin" action="kendoJoin" method="POST"> 
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
						<input type = "hidden" name = "doName" value = "${kendoDtail.doName}"/>${kendoDtail.doName}
						</h4>
						
						<p>
							활동번호 : <input type = "hidden" name = "doNum" value = "${kendoDtail.doNum}"/>${kendoDtail.doNum}<br />
                  			호스트번호 : <input type = "hidden" name = "hostNum" value = "${kendoDtail.hostNum}"/>${kendoDtail.hostNum}<br />              
      					  	 *성별 제한 : <input type = "hidden" id = "doOptGender" value = "${kendoDtail.doOptGender}"/>${kendoDtail.doOptGender}<br />
						  	 *나이 제한 : <input type = "hidden" id = "doOptAge" value = "${kendoDtail.doOptAge}"/>${kendoDtail.doOptAge}<br/>
							모집인원  :<input type = "hidden" name = "doPp" value = "${kendoDtail.doPp}"/>${kendoDtail.doNowPp} / ${kendoDtail.doPp}<br />
						  	<input type = "hidden" name = "doNowPp" value = "${kendoDtail.doNowPp}"/>
								
															
							가  격 : <input type = "hidden" name = "doPrice"  id ="doPrice" value = "${kendoDtail.paymentKim.payDutch}"/><fmt:formatNumber pattern="###,###,###" value="${kendoDtail.paymentKim.payDutch}" /> 원<br/><br /> 
							수  량 : <input  type = "number"  id ="doQty" name="doQty" min="1" max="${kendoDtail.doPp - kendoDtail.doNowPp}" required/><br />
							총금액 : <input type = "text" name = "totalPrice"  id ="totalPrice" value="" placeholder=""/><fmt:formatNumber pattern="###,###,###" value="" /> 원<br />  
						</p>

						<c:if test="${memAuth.id != null}">
							<h6 style="color:white;">*사용자 성별:<input type = "hidden" id = "gender" name = "gender" value = "${membOpt.gender}"/>${membOpt.gender}</h6><br /> 
							<h6 style="color:white;">*사용자 생일:<input type = "hidden" id = "birth" name = "birth" value = "${membOpt.memberBir}"/>${membOpt.memberBir}</h6><br /> 
							
							<h6 style="color:white;"><fmt:formatDate  value="${toDay}" pattern="yyyy"/></h6><br/>
						   <h6 style="color:white;"><fmt:formatDate value="${membOpt.memberBir}"  pattern="yyyy"/></h6><br/>
						   <h6 style="color:white;"><fmt:formatNumber value="${toDay.year - membOpt.memberBir.year +1}" /></h6>
						</c:if>

		

						<!--  -->
						<div class="p-t-33">

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">


									<button onclick="document.getElementById('kendoJoin').submit();" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
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
							<a class="nav-link" data-toggle="tab" href="#information" role="tab">주의사항</a>
						</li>

					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">
						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">
									<input type = "hidden" value="${kendoDtail.doDetail}"/>${kendoDtail.doDetail}<br/><br/>
									<c:forEach var="kendoImg" items="${kendoImgs}">
										<img src="../HHHview/doIMG/${kendoImg.doImgName}" width = "300px" alt="IMG-PRODUCT" width="450" height="200">
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
												환불안내
											</span>

											<span class="stext-102 cl6 size-206">
												구매 후 일주일 이내 환불가능
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												포함사항
											</span>

											<span class="stext-102 cl6 size-206">
												장소이용료, (숙박, 차량렌트, 멘토 강습)
											</span>
										</li>

										<li class="flex-w flex-t p-b-7">
											<span class="stext-102 cl3 size-205">
												불포함 사항
											</span>

											<span class="stext-102 cl6 size-206">
												식사
											</span>
										</li>

									</ul>
								</div>
							</div>
						</div>

						<!-- - -->
			
						<!-- - -->
					</div>
				</div>
			</div>
		</div>


	</section>


		



<!--===============================================================================================-->	
	<script src="../kimView/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/bootstrap/js/popper.js"></script>
	<script src="../kimView/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/daterangepicker/moment.min.js"></script>
	<script src="../kimView/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/slick/slick.min.js"></script>
	<script src="../kimView/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="../kimView/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/sweetalert/sweetalert.min.js"></script>
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
/*
		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
*/	
	</script>
<!--===============================================================================================-->
	<script src="../kimView/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	<script src="../kimView/js/main.js"></script>

</body>
</html>