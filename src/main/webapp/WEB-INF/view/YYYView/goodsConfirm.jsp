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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	function mapL(val){
		$.ajax({
			type:"POST",
			url :"mapM",
			data: "mapLNum=" +val,
			datatype: "html",
			success: function(data1){
				$("#mapMedium").html(data1);
				$("#mapSmall").html("");//a테이블 선택 변경시 c테이블 나오지않도록
			}
		});
	}
	
	function confirm(){
		$("#confirm").click(function(){
			
			location.href="confirmList/ok";
		})
		$("#confirm").click(function(){
	
		location.href="confirmList/no";
		})
	}

</script>
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
</head>
<body class="animsition">

<!-- 관리자만 볼 수 있게  -->
<c:if test="${comNum == 'admin'}">
	<div class="bg0 m-t-23 p-b-140">
		<div class="container" >
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
			</div>

				<!-- 상품승인 리스트 -->
				<div class="row isotope-grid">
					<table width=100% class="table table-hover">
						<tr align="center" valign="middle">
							<td colspan="8">기업 상품 리스트</td>
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

								<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${list.companyKind}">
									
									<div class="block2">
									<div class="block2-txt flex-w flex-t p-t-14">
									
										
										<tr>
										<form action="confirmList/ok" method="POST" name="okfrm">
											<td><input type="hidden" value="${list.goodsNum}" name="goodsNum">${list.goodsNum}</td>
											<td>${list.companyKind }</td>
											<td><a href="goodsRegDetail.goods/${list.goodsNum}"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
													${list.goodsName} </a></td>
											<td>${list.companyName}</td>
											<td>&nbsp; <fmt:formatDate value="${list.regDate}"
													pattern="yy.MM.dd" /> &nbsp;
											</td>
											<td>&nbsp; ${list.goodsStatus} &nbsp;</td>
											<c:set var="status" value="${list.goodsStatus}" />
											<c:if test="${status == '미승인'}">
											<td><input type="submit" value="승인" id="confirm" /></td>
											</c:if>
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