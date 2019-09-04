<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Contact</title>
<!--===============================================================================================-->	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src = "YYYView/js/jquery.form.js"></script>
<script>
	//도미노
	   $(function(){
	      $.ajax({
	         type:"POST",
	         url :"mapL",
	         datatype: "html",
	         success: function(data1){
	            $("#mapMain").html(data1);
	         }
	      });
	   
	      $.ajax({
	         type:"POST",
	         url :"themeL",
	         datatype: "html",
	         success: function(dataTheme1){
	            $("#themeMain").html(dataTheme1);
	         }
	      });
	   })

</script>
<script type="text/javascript">

	var oTbl;
	var i = 1;
	//Row 추가
	function insRow() {
	oTbl = document.getElementById("addTable");
	var oRow = oTbl.insertRow();
	oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
	var oCell = oRow.insertCell();
	var frmTag;
	if(i < 20){
		var frmTag = "<input type=file name='report' style=width:350px; height:20px;> ";
		frmTag += "<input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
		oCell.innerHTML = frmTag;
		i++;
	}
	//삽입될 Form Tag
	
	}
	//Row 삭제
	function removeRow() {
	oTbl.deleteRow(oTbl.clickedRowIndex);
	}
	
	function frmCheck()
	{
	var frm = document.form;
	
	for( var i = 1; i <= frm.elements.length - 1; i++ ){
	   if( frm.elements[i].name == "file" + i )
	   {
	       if( !frm.elements[i].value ){
	           alert("텍스트박스에 값을 입력하세요!");
	               frm.elements[i].focus();
		 return;
	        }
	    }
	 }
	}

</script>
<!--===============================================================================================-->	

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
	<link rel="stylesheet" type="text/css" href="YYYView/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="YYYView/css/util.css">
	<link rel="stylesheet" type="text/css" href="YYYView/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	
	<!-- Header -->
	

	<!-- Cart -->
	


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('YYYView/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Add Goods
		</h2>
	</section>	


	<!--작성 폼 -->
	<section class="bg0 p-t-104 p-b-116">
		<div class="container">
		<form:form action="goodsRegAction" name="frm" id="frm" method="POST" commandName="placeRegCommand" enctype="multipart/form-data">
			<div class="flex-w flex-tr">
			
				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">

						<h4 class="mtext-105 cl2 txt-center p-b-30">
							Goods Registration Form
						</h4>
						 지역선택<div id = "mapMain" class="bor8 m-b-20 how-pos4-parent"></div>
						
						테마선택 <div id = "themeMain" class="bor8 m-b-20 how-pos4-parent"></div>
												
						
						회사명 <div class="bor8 m-b-20 how-pos4-parent">
									${comAuth.name}
						</div>
						
						상품명 <div class="bor8 m-b-20 how-pos4-parent">
							 <form:input path="goodsName" type="text" name="goodsName" placeholder=""/>
						</div>
						
						<div class="bor8 m-b-20 how-pos4-parent">
							이미지 : <input type="file" name="report"	multiple="multiple" /> 대표 이미지
							<table id="addTable" >
								<tr>
									<td align="left"></td>
								</tr>
								<tr>
								<td>
									<div class="flex-w size-217">
										<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
										<input name="addButton" type="button" onClick="insRow()" value="add" />
										</a>
									</div>
								</td>
								</tr>
							</table>
						</div>
						
					  

				</div>

				<div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">

						상세내용 <div class="bor8 m-b-20 how-pos4-parent">
							 <form:textarea path = "goodsDetail" class="stext-111 cl2 plh3 size-120 p-lr-28 p-tb-25" type="textarea" name="goodsDetail" placeholder="What's your Goods?" />
					  </div>
					  
					  <div class="bor8 m-b-20 how-pos4-parent">
							주의사항 <form:input path = "goodsDanger" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="goodsDanger" placeholder="나이제한 or 성별제한 등"/>
						</div>
						
						<div class="bor8 m-b-20 how-pos4-parent">
							상품금액 <form:input  path = "goodsPrice" class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text" name="goodsPrice" placeholder="1인당 금액 산정하여 작성"/>
						</div>
					
					<input type ="submit" value ="Submit" onclick="frmCheck()" class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
						
				</div>
				
				</div>
				</form:form>
		</div>
	</section>	
	
	
	<!-- Map -->
	
	<!-- Footer -->
	
	<!-- Back to top -->
	

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
	<script src="YYYView/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="YYYView/js/map-custom.js"></script>
<!--===============================================================================================-->
	<script src="YYYView/js/main.js"></script>

</body>
</html>