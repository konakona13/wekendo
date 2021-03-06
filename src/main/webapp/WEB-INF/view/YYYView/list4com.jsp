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
	<link rel="stylesheet" type="text/css" href="kimView/css/util.css">
	<link rel="stylesheet" type="text/css" href="kimView/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						쉼표가 필요한 순간, 위켄두
					</div>

					<div class="right-top-bar flex-w h-full">
					
						<c:if test="${comAuth.id == null}">
						<a href="loginmain" class="flex-c-m trans-04 p-lr-25">기업회원가입/로그인</a>
						</c:if>
						
						<c:if test="${comAuth.id != null}">
						<a href="Logout1" class="flex-c-m trans-04 p-lr-25">로그아웃</a>  
						<a href="loginmain" class="flex-c-m trans-04 p-lr-25">마이페이지</a>
						<a href="sendBoxList" class="flex-c-m p-lr-10 trans-04">쪽지함</a> 
						</c:if> 
                        <a href="#" class="flex-c-m trans-04 p-lr-25">고객센터</a>        
                                      
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">
					
					<!-- Logo desktop -->		
					<a href="#" class="logo">
						<img src="kimView/images/icons/logom.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu">
								<a href="companyMain">Home</a>
							</li>

							<li class="active-menu">
                                <a href="goodsMain">상품관리</a>
                                <ul class="sub-menu">
									<li><a href="goodsMain">상품리스트</a></li>
									<li><a href="goodsReg">상품등록</a></li>
								</ul>
							</li>

							<li class="active-menu">
                                <a href="orderCompany">주문관리</a>
                                <ul class="sub-menu">
									<li><a href="orderCompany">주문내역</a></li>
								</ul>
                            </li>
                            
							<li class="active-menu">
                                <a href="companyCash">매출관리</a>
                                <ul class="sub-menu">
									<li><a href="companyCash">매출관리</a></li>
									<li><a href="companyCash">정산관리</a></li>
								</ul>
                            </li>
                            
							<li class="active-menu">
                                <a href="#">상품문의</a>
                                <ul class="sub-menu">
									<li><a href="#">문의내역</a></li>

								</ul>
                            </li>							
						</ul>
					</div>	

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>	
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->		
			<div class="logo-mobile">
				<a href="index.html"><img src="kimView/images/icons/logom.png"" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						쉼표가 필요한 순간, 위켄두
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
					
					
						<c:if test="${memAuth.id == null}">
						<a href="loginmain" class="flex-c-m p-lr-10 trans-04">회원가입 / 로그인</a>
						</c:if>
						
						<c:if test="${memAuth.id != null}">
						<a href="Logout1" class="flex-c-m p-lr-10 trans-04">로그아웃</a>  
						<a href="loginmain" class="flex-c-m p-lr-10 trans-04">마이페이지</a>
						</c:if>  
                        <a href="#" class="flex-c-m p-lr-10 trans-04">고객센터</a>        
                        

					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="main">Home</a>

					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>


				<li>
					<a href="kendoJoinList" class="label1 rs1" data-label1="hot">액티비티</a>
                    <ul class="sub-menu">
                        <li><a href="kendoJoinList">테마파크</a></li>
                        <li><a href="home-02.html">스포츠</a></li>
                        <li><a href="home-03.html">아웃도어</a></li>
                        <li><a href="kendoJoinList">수상레저</a></li>
                        <li><a href="home-03.html">투어/관람</a></li>
                        <li><a href="home-03.html">대회/축제</a></li>
                        <li><a href="home-03.html">공연/전시</a></li>
                        <li><a href="home-03.html">기타</a></li>
                    </ul>
				</li>

				<li>
					<a href="kendoJoinList">취미</a>
                    <ul class="sub-menu">
                        <li><a href="index.html">외국어</a></li>
                        <li><a href="home-02.html">책</a></li>
                        <li><a href="kendoJoinList">음악</a></li>
                        <li><a href="home-03.html">사진</a></li>
                        <li><a href="home-03.html">게임</a></li>
                        <li><a href="home-03.html">요리</a></li>
                        <li><a href="home-03.html">봉사</a></li>
                        <li><a href="home-03.html">반려동물</a></li>
                        <li><a href="home-03.html">기타</a></li>
                    </ul>
				</li>


                <c:if test="${memAuth.id != null}">
                <li class="active-menu">
                	<a href="loginmain">DO만들기</a>
				</li>
				</c:if> 
							
                <c:if test="${memAuth.id == null}">
                	<li class="active-menu">
                   		<a href="doCreateEnter">DO만들기</a>
					</li>
				</c:if> 

			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="kimView/images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat
							</a>

							<span class="header-cart-item-info">
								1 x $19.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star
							</a>

							<span class="header-cart-item-info">
								1 x $39.00
							</span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather
							</a>

							<span class="header-cart-item-info">
								1 x $17.00
							</span>
						</div>
					</li>
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total: $75.00
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a>

						<a href="shoping-cart.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

		

	<!-- Slider -->
	


	<!-- Banner -->
	<div class="sec-banner bg0 p-t-80 p-b-50">

		<div class="container">
    <c:if test="${comAuth.id != null}">
    <h5> ${comAuth.id} 님 환영합니다.</h5> <br/><br/>
    </c:if>

		</div>
	</div>
	
	
	<!-- GoodsList -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						All Goods(${size})
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