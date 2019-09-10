<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 승인_관리자페이지</title>	
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
<script type="text/javascript" 	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"  src="/mybatis-spring-smrit/js/jquery.form.js"></script>

<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">

$(function(){
	$("#confirm").click(function(){
			swal("Confirm", "승인완료", "success");			
			opener.location.href ='/confirmList/ok';
			$("#okfrm").submit();
		});
});


</script>
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
					
          				<c:if test="${admin == null}">
          				<a href="loginmain"  class="flex-c-m trans-04 p-lr-25">로그인</a>
          				</c:if>
						<c:if test="${admin != null}">
          				<a href="Logout1"  class="flex-c-m trans-04 p-lr-25">로그아웃</a>
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
								<a href="adminMain">Home</a>
							</li>

							<li class="active-menu">
								<a href="memcomList">회원관리</a>
                                <ul class="sub-menu">
                                	<li><a href="companyReg">기업가입승인</a></li>
									<li><a href="memcomList">회원리스트</a></li>
									

								</ul>								
							</li>

							<li class="active-menu">
                                <a href="goodsMain">상품관리</a>
                                <ul class="sub-menu">
									<li><a href="confirmList">상품승인</a></li>
									<li><a href="goodsMain">상품리스트</a></li>
								</ul>
							</li>

							<li class="active-menu">
                                <a href="kendo_list">DO상품관리</a>
                                <ul class="sub-menu">
									<li><a href=""kendo_list"">주문내역</a></li>
								</ul>
                            </li>
                            
							<li class="active-menu">
                                <a href="Cashin">매출관리</a>
                                <ul class="sub-menu">
									<li><a href="Cashin">매출관리</a></li>
									<li><a href="Cashin">정산관리</a></li>
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
						<a href="sendBoxList" class="flex-c-m p-lr-10 trans-04">쪽지함</a>  
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
					<a href="kendoJoinList">추천DO</a>
					
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
	<br><br><br><br>

<!-- 관리자만 볼 수 있게  -->
<c:if test="${comNum == 'admin'}">
	<div class="bg0 m-t-23 p-b-140">
		<div class="container" >
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
				
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						All Goods(${qty})
					</button>


				  
				</div>
			</div>

				<!-- 상품승인 리스트 -->
				<div class="row isotope-grid">
					<table width=100% class="table table-hover">
						<tr align="center" valign="middle">
							<td colspan="8">기업 상품 승인 관리 목록</td>
						</tr>
						<tr>

							<td>상품번호</td>
							<td>상품구분</td>
							<td>상품명</td>
							<td>작성자</td>
							<td>등록일</td>
							<td>승인상태</td>
							<td>관리</td>
						</tr>

			
						<c:if test="${! empty list}">
							<c:forEach var="list" items="${list}">

								<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${list.goodsStatus}">
									
									<div class="block2">
									<div class="block2-txt flex-w flex-t p-t-14">
									
										
										<tr>
										<form action="confirmList/ok" method="POST" name="okfrm">
											<td><input type="hidden" value="${list.goodsNum}" name="goodsNum">${list.goodsNum}</td>
											
											<td>${list.companyKind }
												<input type="hidden"  name="filter" value="${list.companyKind }"></div>
 											</td>
											<td><a href="goodsRegDetail.goods/${list.goodsNum}"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
													${list.goodsName} </a></td>
											<td>${list.companyName}</td>
											<td>&nbsp; <fmt:formatDate value="${list.regDate}"
													pattern="yy.MM.dd" /> &nbsp;
											</td>
											<td>&nbsp; ${list.goodsStatus} &nbsp;</td>
											<c:set var="status" value="${list.goodsStatus}" />
											<td>
												<c:if test="${status == '미승인'}">			
												<a href="/confirmList/ok">								
												<button  id="confirm"  
													class="flex-c-m stext-101 cl0 size-10 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10">승인</button>
												</a>	
												</c:if>
											</td>
										</form>
										</tr>
										
									
									</div>
									</div>
								</div>

							</c:forEach>
						</c:if>

					</table>
				</div>
			</div>
	</div>
	</c:if>
	
	
	
	<div>
		<c:if test="${empty list}">
			미승인 내역이 없습니다.
		</c:if>
	</div>

	<c:if test="${comNum != 'admin' || empty comNum}">
		<script>swal ( "Warning" ,  "관리자만 이용 가능한 페이지입니다." ,  "error" ) </script>
	</c:if>


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
	<script src="YYYView/js/main.js"></script>
</body>
</html>