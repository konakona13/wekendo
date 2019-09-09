<%@page import="Command.LEECommand.AuthInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" 
			uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String msg111 = request.getParameter("msg111");
	if(msg111 == null) msg111 = "";
	boolean isId = false;// 쿠키 여부
	String userid = "";
	Cookie [] cookies = request.getCookies();
	if(cookies != null && cookies.length >0){
		for(Cookie c : cookies)	{
			if(c.getName().equals("id")){
				isId = true;
				userid = c.getValue();
			}else if(c.getName().equals("auto")){
				session.setAttribute("memAuth", c.getValue());
			}
		}
	}
	String memNum = (String)session.getAttribute("memNum");
	String comNum = (String)session.getAttribute("comNum");
	String adminId = (String)session.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">
<!-- Bootstrap -->
        <link href="../plugin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- font awesome -->
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- Custom style -->
        <link rel="stylesheet" href="../plugin/bootstrap/css/style.css" media="screen" title="no title" charset="utf-8">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="../plugin/bootstrap/js/bootstrap.min.js"></script>
        <script src="../config/js/login.js"></script>
          		<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<head>
<style>
.input-group {
    margin-top: 1em;
    margin-bottom: 1em;
} 

body {
	margin-top: 100px;
	margin-left:250px;
	font-family: 'Nanum Gothic', sans-serif;
	line-height: 1.6;
}

.login-box {
    line-height: 2.3em;
    font-size: 1em;
    color: #aaa;
    margin-top: 1em;
    margin-bottom: 1em;
    padding-top: 0.5em;
    padding-bottom: 0.5em;
}	 

</style>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
 <script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">

	$(function(){
		$("#btn1").click(function(){
			if($("#id1").val() == ""){
				$("#idmsg").html("아이디를 입력하세요.");
				$("#id1").focus();
				return false;
			}
			if($("#pw").val() == ""){
				$("#pwmsg").html("비밀번호를 입력하세요.");
				$("#pw").focus();
				return false;
			}
			
			$("#frm").submit();

		});
		$("#btn").bind('click',function(){
			var option = {
				type : "POST",
				url : "login_pro.do", //loginPro.jsp
				beforeSubmit : application_check,
				success : application_Ok,
				error : function(){
					
				}
			}
			$("#frm").ajaxSubmit(option);
			return false;
		});
	});
	function application_Ok(responseText, statusText, xhr, $form){
		if(statusText == 'success'){
			if(responseText == '0'){
				$("#msg").html("정보가 부족합니다.");
				document.frm.id1.value = "";
				document.frm.pw.value = "";
				document.frm.id1.focus();
			}else if(responseText == '1'){
				$("#msg").html("아이디가 존재하지 않습니다.");
				document.frm.id1.value = "";
				document.frm.pw.value = "";
				document.frm.id1.focus();
			}else if(responseText == '2'){
				$("#msg").html("비밀번호가 일치하지 않습니다.");
				document.frm.pw.value = "";
				document.frm.pw.focus();
			}else{
				location.href = "main";
			}
		}
	}
	function application_check(){
		if($("#id1").val() == ""){
			$("#idmsg").html("아이디를 입력하세요.");
			$("#id1").focus();
			return false;
		}
		if($("#pw").val() == ""){
			$("#pwmsg").html("비밀번호를 입력하세요.");
			$("#pw").focus();
			return false;
		}	
	}
</script>
</head>
<body>
<!-- 로그인 되지 않았을 때 화면 -->
<%if(session.getAttribute("memAuth")== null && session.getAttribute("comAuth")== null){ %>
<div class="container" style="width: 2000px;">
            <div class="row">
                <div class="col-sm-3">

                    <div class="login-box well">

<form:form action="loginPro" name="frm" method="post" id="frm" 
commandName="loginCommand">
<div class="container custom-control custom-radio" style="color: black; margin-left: 40px;">
	<label><input type="radio" name="selectLogin" value="normal" checked="checked" class="custom-control-input"></label>일반회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="selectLogin" value="company">기업회원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="selectLogin" value="admin">관리자
	</div>
	   <span id = "msg"  style="color:red"><%=msg111 %></span>
	
		<div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span><input type ="text" id="id1" name="id1" class="form-control"
				value="<%=userid %>" placeholder="아이디를 입력하세요."/>
			<form:errors path="id1" /></div>
			<div id = "idmsg"></div>
<div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>

		<input type="password" id="pw" name="pw" class="form-control" placeholder="비밀번호를 입력하세요."/>
		<form:errors path="pw" /></div>
<div class="container">
		<input type="button" id="btn1" value="로그인" 
		 class="btn btn-primary" style="margin-left: 20px; width: 200px;">
		 <a href="${url}">
<img width="150" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" style="margin-left: 30px;"/></a></div>
		 <br>
			<!-- 
			<input type="button" id="btn" value="Ajax를 이용한 전송" 
			padding="15px"/>
			 -->
	
		
	
			<a href="memberJoin" class="btn btn-default btn-block" >일반회원 가입</a>
			<a href="companyJoin" class="btn btn-default btn-block">기업회원 가입</a>
			<div id="naver_id_login" style="text-align:center"></div>
</form:form>
</div></div></div></div>
<% }else if(session.getAttribute("memAuth")!= null && memNum.substring(0, 2).equals("NM")){ %>
<!-- 로그인 된 후의 화면(일반회원) -->
<%= session.getAttribute("memAuth") %> 님 환영합니다.<br />
<div id="container" style="width: 900px; margin: 30px;" class="container">
<table class="table table-bordered">
<tr>
<td rowspan="6" width="200" align="center"><img src="LEEview/upload/${memAuth.profile }" class="img-rounded"/></td><td width="200">일반회원 : ${memAuth.memNum }</td>
</tr>
<tr>
<td>아이디 : ${memAuth.id }</td>
</tr>
<tr>
<td>이름 : ${memAuth.name }</td>
</tr>
<tr>
<td>연락처 : ${memAuth.memPh1 }</td>
</tr>
<tr>
<td>주소 : ${memAuth.addr }</td>
</tr>
<tr>
<td>이메일 : ${memAuth.email }</td>
</tr>
</table>
<a href="Logout1" class="btn btn-primary" style="margin-right: 10px;">로그아웃</a>
<a href="memDoList?memNum=${memAuth.memNum }" class="btn btn-info" style="margin-right: 30px;">내 활동 보기</a>
<a href="main" class="btn btn-success">메인으로 이동</a>
<!-- 
<a href="memberModify" >정보수정</a>
<a href="edit/pwModify" >비밀번호변경</a>


<a href="goods_list" >상품리스트</a>
<a href="survey" >설문지</a>
<a href="submission" >파일 업로드</a>
<a href="email" >메일보내기</a>
<a href="emailAll" >전체 메일 보내기</a>
<a href="ajaxForm" >Ajax</a>
<a href= "domino" >도미노 속성</a>
 -->
 </div>
<% }else if(session.getAttribute("comAuth")!= null && comNum.substring(0, 2).equals("CO")){ %>
<!-- 로그인 된 후의 화면(기업회원) -->

<%= session.getAttribute("comAuth") %> 님 환영합니다.<br />
<div id="container" style="width: 900px; margin: 30px;" class="container">
<table class="table table-bordered">
<tr>
<td rowspan="9" width="200" align="center"><img src="LEEview/images/company.jpg" class="img-rounded" /></td><td width="400">회사명 : ${comAuth.name }</td>
</tr>
<tr>
<td>사업자번호 : ${comAuth.comBN }</td>
</tr>
<tr>
<td>대표자명 : ${comAuth.comCap }</td>
</tr>
<tr>
<td>주소 : ${comAuth.addr }</td>
</tr>
<tr>
<td>연락처 : ${comAuth.memPh1 }</td>
</tr>
<tr>
<td>담당자명 : ${comAuth.comManager }</td>
</tr>
<tr>
<td>이메일 : ${comAuth.email }</td>
</tr>
<tr>
<td>계좌번호 : ${comAuth.comAcc }</td>
</tr>
<tr>
<td>주거래은행 : ${comAuth.comBank }</td>
</tr>
</table>
<div class="container" style="margin: 10px;">
<a href="Logout1" class="btn btn-primary" style="margin-right: 10px;">로그아웃</a>
<a href="goodsMain" class="btn btn-info" style="margin-right: 10px;">내 상품리스트</a>
<a href="companyCash" class="btn btn-info" style="margin-right:100px;">정산내역 확인</a>
<a href="comMain" class="btn btn-success">메인으로 이동</a>
</div>
<!-- 
<a href="memberModify" >정보수정</a>
<a href="edit/pwModify" >비밀번호변경</a>
<a href="member_list" >회원리스트</a>
<a href="goods_list" >상품리스트</a>
<a href="survey" >설문지</a>
<a href="submission" >파일 업로드</a>
<a href="email" >메일보내기</a>
<a href="emailAll" >전체 메일 보내기</a>
<a href="ajaxForm" >Ajax</a>
 -->
 </div>
<% }else if(session.getAttribute("comAuth")!= null && adminId.equals("admin")){ %>
관리자 페이지<br>
관리자 이름 : ${comAuth.name }<br>
 <a href="Logout1" >로그아웃</a>
 <a href="kendo_list" >주문관리-활동리스트</a>
 <a href="Cashin" >매출관리</a>
 <a href="confirmList" >상품관리 - 업체상품승인</a>
 <a href="goodsMain" >상품관리 - 업체 상품리스트</a>
 <a href="companyReg" >회원관리 - 기업 가입 승인</a>
 <!-- 
<a href="memberModify" >정보수정</a>
<a href="edit/pwModify" >비밀번호변경</a>
<a href="board_list" >게시글</a>


<a href="submission" >파일 업로드</a>
<a href="email" >메일보내기</a>
<a href="emailAll" >전체 메일 보내기</a>
<a href="ajaxForm" >Ajax</a>

 -->
 <%} %>
</body>
</html>