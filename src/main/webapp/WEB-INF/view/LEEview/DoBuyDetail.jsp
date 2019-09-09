<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>About</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="LEEview/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="LEEview/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="LEEview/css/util.css">
	<link rel="stylesheet" type="text/css" href="LEEview/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition" style="height: auto;">
	
	<!-- Header -->

	<!-- Cart -->


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('LEEview/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			활동번호  ${DoBuyDetail.doNum }(${DoBuyDetail.doName }) 의 상세내역
		</h2>
	</section>	


	<!-- Content page -->
	<section class="bg0 p-t-75 p-b-120">
		<div class="container">
			<div class="row p-b-148">
				<div class="col-md-7 col-lg-8">
					<div class="p-t-7 p-r-85 p-r-15-lg p-r-0-md">
						<h3 class="mtext-111 cl2 p-b-16">
							모집날짜 : 
						</h3>

						<p class="stext-113 cl6 p-b-26">
							<fmt:formatDate value="${DoBuyDetail.openDate }" pattern="yyyy년 MM월 dd일" /> 
							~ <fmt:formatDate value="${DoBuyDetail.closeDate }" pattern="yyyy년 MM월 dd일" />						
						</p>

						<h3 class="mtext-111 cl2 p-b-16">
							활동날짜 :
						</h3>

						<p class="stext-113 cl6 p-b-26">
							<fmt:formatDate value="${DoBuyDetail.startDate }" pattern="yyyy년 MM월 dd일" /> 
~ <fmt:formatDate value="${DoBuyDetail.endDate }" pattern="yyyy년 MM월 dd일" />						
						</p>
						<h3 class="mtext-111 cl2 p-b-16">
							활동인원:
						</h3>

						<p class="stext-113 cl6 p-b-26">
							${DoBuyDetail.doPP }						
						</p>
						<h3 class="mtext-111 cl2 p-b-16">
							활동호스트명 :
						</h3>

						<p class="stext-113 cl6 p-b-26">
							${DoBuyDetail.memName }						
						</p>
						<h3 class="mtext-111 cl2 p-b-16">
							호스트연락처 :
						</h3>

						<p class="stext-113 cl6 p-b-26">
							${DoBuyDetail.memPh }					
						</p>
						<h3 class="mtext-111 cl2 p-b-16">
							활동상세 :
						</h3>

						<p class="stext-113 cl6 p-b-26">
							${DoBuyDetail.doDetail }			
						</p>
					</div>
				</div>

				<div class="col-11 col-md-5 col-lg-4 m-lr-auto">
					<div class="how-bor1 ">
						<div class="hov-img0">
							호스트프로필:<img src="LEEview/upload/${DoBuyDetail.profile }" alt="IMG">
						</div>
					</div>
				</div>
			</div>
			
			</div>
	</section>	
	
		

	<!-- Footer -->



	<!-- Back to top -->


<!--===============================================================================================-->	
	<script src="LEEview/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="LEEview/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="LEEview/vendor/bootstrap/js/popper.js"></script>
	<script src="LEEview/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="LEEview/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="LEEview/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="LEEview/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
	<script src="LEEview/js/main.js"></script>
	
</body>
</html>