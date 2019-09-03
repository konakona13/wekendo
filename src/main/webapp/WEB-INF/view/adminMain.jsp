<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String memberNum = (String)session.getAttribute("memNum");
	session.getAttribute("memAuth");
	response.setCharacterEncoding("utf-8");
	String admin = (String)session.getAttribute("admin");
	
 %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>WEKENDO</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">

$(function(){
  $("#menu_memMng").mouseout(function(){
    $("#memMngMsg").hide();
  });
  $("#menu_memMng").mouseover(function(){
    $("#memMngMsg").html('<a href="#">일반회원&nbsp;</a>  <a href="#">기업회원&nbsp;</a>');
			//$("#menu_activity").focus();
    //$("#actmsg").focus();
    $("#memMngMsg").show();
  });


  $("#menu_goodsMng").mouseout(function(){
    $("#goodsMsg").hide();
  });
  $("#menu_goodsMng").mouseover(function(){
    $("#goodsMsg").html('<a href="#">장소상품&nbsp;</a>  <a href="#">숙박상품&nbsp;</a>	<a href="#">렌트카상품&nbsp;</a>	<a href="#">멘토상품&nbsp;</a>');
    $("#goodsMsg").show();
  });


  
  $("#menu_doMng").mouseout(function(){
	 $("#doMngMsg").hide();
  });
  $("#menu_doMng").mouseover(function(){
	$("#doMngMsg").html('<a href="#">DO리스트&nbsp;</a>');
	$("#doMngMsg").show();
  });

  
  

  
  $("#menu_orderMng").mouseout(function(){
	 $("#orderMsg").hide();
  });
  $("#menu_orderMng").mouseover(function(){
	$("#orderMsg").html('<a href="#">DO리스트&nbsp;</a>');
	$("#orderMsg").show();
  });
  
  

  $("#menu_salesMng").mouseout(function(){
	$("#salesMsg").hide();
  });
  $("#menu_salesMng").mouseover(function(){
	$("#salesMsg").html('<a href="#">월별매출&nbsp;</a>');
	$("#salesMsg").show();
  });
  
});

</script>
<style type="text/css">

table{
	text-align: center;
}
</style>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/font-icon.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head>
<body>
<!-- header top section -->
<section class="banner" role="banner">
  <header id="header">
    <div class="header-content clearfix"> <a class="logo" href="memberMain.html"><img src="images/logom.png" width = "200" alt=""></a>
      <nav class="navigation" role="navigation">
        <ul class="primary-nav">
          <li>
          	<c:if test="${admin == null}">
          		<a href="loginmain">로그인</a>
          	</c:if>
          	<c:if test="${admin != null}">
          		<a href="Logout1">로그아웃</a>
          	</c:if>
          </li>
          <li><a href="#">고객센터</a></li>
        </ul>
      </nav>
      <a href="#" class="nav-toggle">Menu<span>Menu</span></a> </div>
  </header>
</section>
<!-- header top section --> 



<!-- header menu section -->

<section id="hero" class="section ">
  <div class="container">
    <div class="row">
      <div class="col-md-7 col-sm-6 hero"><!--
        <div class="hero-content">
            <ul class="main_menu">
                <li><a href="#"><h4>추천DO  </h4> </a></li>
                <li ><a href="#" id = "activity"><h4>액티비티DO</h4></a></li>
                <li><a href="#"><h4>취미DO  </h4></a></li>
                <li><a href="#"><h4>DO만들기  </h4></a></li>
                <li><a href="#"><h4>마이페이지  </h4></a></li>
            </ul>           
        </div>-->
      </div>
    </div>
  </div>
</section>

<!-- header menu section --> 

<table align="center"  width="750" border="1">
  <tr>
    <td width = "150" id = "menu_memMng" class="menu_memMng" ><a href="memcomList"><h4>회원관리-가입회원 리스트</h4> </a><br/></td>
    <td width = "150" id = "menu_goodsMng" class="menu_goodsMng" ><a href="confirmList"><h4>상품관리-업체상품승인</h4></a><br/></td>
    <td width = "150" id = "menu_goodsMng" class="menu_goodsMng" ><a href="goodsMain"><h4>상품관리-업체상품리스트</h4></a><br/></td>
    <td width = "150" id = "menu_orderMng" class="menu_orderMng"><a href="kendo_list"><h4>주문관리-활동리스트</h4></a><br/></td>
    <td width = "150" id = "menu_orderMng" class="menu_orderMng"><a href="Cashin"><h4>매출관리-정산관리</h4></a><br/></td>
    
  </tr>


  <tr>
    <td></td>
    <td id = "menu_activity"><div id="actmsg"></div></td>
    <td id = "menu_hobby"><div id="hobmsg"></div></td>
    <td></td>
    <td></td>
  </tr>

 
</table> 

<!-- portfolio grid section -->
<section id="portfolio">
    <div class="container">
    <!-- <div class="row">
            <div class="col-lg-12 text-center">
                <hr class="section">
            </div>
        </div>
    -->
    <br/><br/>
    <div class="">
    
    <c:if test="${admin != null}">
    <h5> ${admin} 님 로그인 되었습니다.</h5> <br/><br/>
    </c:if>
    
        <img src="images/main_event1.jpg" class="img-responsive" alt="" align = "center"/>
    </div>
<br/><br/>

<h4>** 추천 DO</h4>
    <div class="col-sm-6 portfolio-item"> <a href="kendoDetail" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h3>oooo</h3>
            <h4>oooo</h4>
          </div>
        </div>

        <img src="images/portfolio/work-1.jpg" class="img-responsive" alt=""> </a> </div>

       
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h3>czarna kawka</h3>
            <h4>Branding</h4>
          </div>
        </div>
        <img src="images/portfolio/work-2.jpg" class="img-responsive" alt=""> </a> </div>

<h4>** 추천 멘토</h4>          
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h3>czarna kawka</h3>
            <h4>Branding</h4>
          </div>
        </div>
        <img src="images/portfolio/work-3.jpg" class="img-responsive" alt=""> </a> </div>
       
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h3>czarna kawka</h3>
            <h4>Branding</h4>
          </div>
        </div>
        <img src="images/portfolio/work-4.jpg" class="img-responsive" alt=""> </a> </div>

<br/><br/>
<h4>** 추천 장소</h4>         
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h3>czarna kawka</h3>
            <h4>Branding</h4>
          </div>
        </div>
        <img src="images/portfolio/work-5.jpg" class="img-responsive" alt=""> </a> </div>
      <div class="col-sm-6 portfolio-item"> <a href="work-details.html" class="portfolio-link">
        <div class="caption">
          <div class="caption-content">
            <h3>czarna kawka</h3>
            <h4>Branding</h4>
          </div>
        </div>
        <img src="images/portfolio/work-6.jpg" class="img-responsive" alt=""> </a> </div>
    </div>
  </div>
</section>
<!-- portfolio grid section --> 
<!-- service section -->
<section id="service" class="service section">
  <div class="container">
    <div class="row">
      <div class="col-md-5 col-sm-6">
        <h4>We're expert to create beautiful design & smart technology</h4>
        <p>Nullam at enim mauris. Donec et nunc ipsum. Suspendi tempus fringilla ipsu Cras metus euismod velit gravida at nunc ipsum.</p>
      </div>
      <div class="col-md-7 col-sm-6">
        <div class="col-md-4 col-sm-6 service text-center"> <span class="icon icon-browser"></span>
          <div class="service-content">
            <h5>Web & Mobile</h5>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 service text-center"> <span class="icon icon-trophy"></span>
          <div class="service-content">
            <h5>Branding</h5>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 service text-center"> <span class="icon icon-megaphone"></span>
          <div class="service-content">
            <h5>Digital Marketing</h5>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- service section --> 
<!-- footer section -->
<footer class="footer">
  <div class="container">
    <div class="col-md-6 left">
      <h4>Let's work together</h4>
      <p> Call: 612.269.8419 OR Email : <a href="mailto:hello@agency.com"> hello@agency.com </a></p>
    </div>
    <div class="col-md-6 right">
      <p>© 2015 All rights reserved. All Rights Reserved<br>
        Made with <i class="fa fa-heart pulse"></i> by <img src="images/logom.png" width = "120" alt=""></p>
    </div>
  </div>
</footer>
<!-- footer section --> 

<!-- JS FILES --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.fancybox.pack.js"></script> 
<script src="js/retina.min.js"></script> 
<script src="js/modernizr.js"></script> 
<script src="js/main.js"></script>
</body>
</html>