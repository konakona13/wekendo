<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	response.setCharacterEncoding("utf-8");
	session.getAttribute("memAuth");
 %>
 <!DOCTYPE html>
<html lang="en">
<head>
	<title>Product List</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="kimView/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="kimView/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="kimView/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="kimView/css/util.css">
	<link rel="stylesheet" type="text/css" href="kimView/css/main.css">
<!--===============================================================================================-->
<style>
body {
	margin-top: 100px;
	font-family: 'Trebuchet MS', serif;
	line-height: 1.6
}

.container {
	width: 1000px;
	margin: 0 auto;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: black;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
	border: 1;
}

ul.tabs li.current {
	background: white;
	color: black;
}

.tab-content {
	display: none;
	background: white;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}
</style>
<style type="text/css">
.desc1, .desc2 {vertical-align: top;}
.desc3{vertical-align: bottom;}
.thum {
	float: left;
	margin-right: 10px
}

a { text-decoration:none }
</style>
</head>
<body class="animsition">
	

<!-- BODY 시작-->

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="main" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

		</div>
	</div>
		

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				
  

	
	
<!-- start -->	
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
						
						
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
							<c:forEach var="kendoJoin" items="${kendoJoins}">	
							<br/><br/>
								<div>
									
								
									<c:set var ="doImgKind" value="${kendoJoin.doImg.doImgKind}" scope="session" />
									<c:if test="${doImgKind == 'main'}">	
										<img src="HHHview/doIMG/${kendoJoin.doImg.doImgName}"  width="450" height="300"><br/>
									</c:if>
								</div>
								<h1 style="color:white;">sdf</h1><br/>
							
								
									
							</c:forEach>
							
								
						</div>
					</div>
				</div>





<!--start-->			
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
					<c:forEach var="kendoJoin" items="${kendoJoins}">
					<hr>
					
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							<span class="pnum" id="pnum">
							<h6>상품   번호 : ${kendoJoin.doNum}</h6>
							<h6>호스트번호 : ${kendoJoin.hostNum}</h6><br/>
							</span>
							<input type = "hidden" value = "${memAuth.id}" id = "memId" name = "memId"/>
							<c:set var ="doStatus" value="${kendoJoin.doStatus}" scope="session" />							
							<c:if test="${doStatus eq 'inviting'}">
								<h4 id="kendoNum"><input type = "hidden" value = "${kendoJoin.doNum}" name = "doNum"/>${kendoJoin.doName}</h4><br />
							</c:if>								
							<c:if test="${doStatus eq 'invited' || doStatus eq 'DOING' || doStatus eq 'doing' || doStatus eq 'docomplete' || doStatus eq 'doend' || doStatus eq 'CANCEL'}">
								<h4 style="color:blue;"><input type = "hidden" value = "${kendoJoin.doNum}" name = "doNum"/>${kendoJoin.doName}</h4><br />
							</c:if>
						</h4>

					<br/>
						<span><h5>모집인원 : ${kendoJoin.doNowPp}/${kendoJoin.doPp}<h5></span><br/>
					<c:if test="${doStatus == 'inviting'}">
						<span class="price" id="price"><h5>상품가격 : <fmt:formatNumber pattern="###,###,###" value="${kendoJoin.paymentKim.payDutch}" />원<h5></span><br />
					</c:if>
					<c:if test="${doStatus == 'invited'}">
						<h5 style="color:red;">모집종료</h5>
					</c:if>	
					<c:if test="${doStatus == 'doing'}">
						<h5 style="color:red;">활동중</h5>
					</c:if>			
					<c:if test="${doStatus == 'doend'}">
						<h5 style="color:red;">활동종료</h5>
					</c:if>	
					<c:if test="${doStatus == 'cashcomplete'}">
						<h5 style="color:red;">정산종료</h5>
					</c:if>			
					<c:if test="${doStatus == 'CANCEL'}">
						<h5 style="color:red;">활동취소</h5>
					</c:if>	



						
						<!--button  -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
								<c:if test="${memAuth.id == null}">
                            		<button type="button" onclick="location.href='loginmain'" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">상세보기
									</button>
								</c:if>
								<c:if test="${memAuth.id != null}">
								<c:if test="${doStatus != 'inviting'}">
									<button type="button" onclick="#" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">상세보기
									</button>
								</c:if>
								
								<c:if test="${doStatus == 'inviting'}">
									<button type="button" onclick="location.href='./kendoDetail/${kendoJoin.doNum}'" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">상세보기
									</button>
								</c:if>
								</c:if>

									
								</div>
							</div>	
						</div>
<br/>

						<!-- button  -->
</c:forEach>
					</div>
				</div>
		<!--  -->	
		
		
		
		
		
		
		
			</div>
		</div>


	</section>







	<!-- BODY -->

		



<!--===============================================================================================-->	
	<script src="kimView/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="kimView/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="kimView/vendor/bootstrap/js/popper.js"></script>
	<script src="kimView/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="kimView/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="kimView/vendor/daterangepicker/moment.min.js"></script>
	<script src="kimView/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="kimView/vendor/slick/slick.min.js"></script>
	<script src="kimView/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="kimView/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="kimView/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="kimView/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="kimView/vendor/sweetalert/sweetalert.min.js"></script>
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
				swal("주문 할 수 없는 상품입니다.");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="kimView/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	<script src="kimView/js/main.js"></script>

</body>
</html>