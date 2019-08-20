<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
				uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 가입</title>
<script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript">
$(function(){

	$("#submit1").click(function(){
		if($("#id1").val()==""|| $("#id1").val()==null){
			$("#id1").focus();
			$("#msg").html("아이디를 입력하세요");
			return false;
		}
		if($("#pw").val()==""|| $("#pw").val()==null){
			$("#pw").focus();
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if($("#pw").val() != $("#pw1").val()){
			$("#pw1").focus();
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if($("#userName").val()==""|| $("#userName").val()==null){
			$("#userName").focus();
			alert("사용자 이름을 입력하세요.");
			return false;
		}

		if($("#userBir").val()==""|| $("#userBir").val()==null){
			$("#userBir").focus();
			alert("사용자 생년월일을 입력하세요.");
			return false;
		}
		if($("#userGender").val()==""|| $("#userGender").val()==null){
			$("#userGender").focus();
			alert("사용자 성별을 입력하세요.");
			return false;
		}

		if($("#userPh1").val()==""|| $("#userPh1").val()==null){
			$("#userPh1").focus();
			alert("사용자 연락처을 입력하세요.");
			return false;
		}
		if($("#confirmNum").val() == "1"){
			$("#msg").html("아이디 중복확인을 해주세요.");
			return false;
		}
		$("#frm").submit();
	});

	$("#confirmId").click(function(){
		if($("#id1").val()==""|| $("#id1").val()==null){
			$("#id1").focus();
			$("#msg").html("아이디를 입력하세요");
			return false;
		}
		var url = "confirmId?id1="+$("#id1").val();
		open(url,"confirm","width=300, height=500");
	});
});
</script>
</head>
<body bgcolor="#e0ffff">
<form:form action = "MemberJoinAction" name = "frm" id = "frm" method="POST"
        commandName="memberJoinCommand" enctype="Multipart/form-data">
	<table width = 600 align = "center" border = 1 
			cellpadding = 3 >
	<tr><td width = 200 bgcolor="#b0e0e6" ><b>아이디입력 </b></td>
		<td width = 400 bgcolor="#b0e0e6" >&nbsp;</td>
	</tr>
	<tr><td width = 200 >
		<b>* 아이디 </b></td>
		<td width = 400 >
			<form:input path="id1" id = "id1"  name="id1"
				size = "12" maxlength="10"/>
			<input type="button" value="중복확인" id = "confirmId" />
			<div id = "msg"></div>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 비밀번호 </b></td>
		<td width = 400 >
			<form:password path="pw" 
				id = "pw" size = "12" maxlength="10"/>
			<form:errors path="pw" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 비밀번호 확인 </b></td>
		<td width = 400 >
			<form:password path="pw1" 
				id = "pw1" size = "12" maxlength="10"/>
			<form:errors path="pw1" />
		</td>
	</tr>
	<tr><td width = 200 bgcolor="#b0e0e6" ><b>기본정보 입력 </b></td>
		<td width = 400 bgcolor="#b0e0e6" >&nbsp;</td>
	</tr> 
	<tr><td width = 200 ><b>* 이름 </b></td>
		<td width = 400 >
			<form:input path ="userName" 
				id = "userName" size = "12" maxlength="10"/>
			<form:errors path="userName" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 생년월일 및 성별 </b></td>
		<td width = 400 >
			<form:input path="userBir" 
				id = "userBir" size = "12" maxlength="10" />
			-
			<form:input path="userGender" 
				id = "userGender" size = "1" maxlength="1"/>******
		</td>
	</tr>
	<tr><td width = 200 ><b>* 이메일 </b></td>
		<td width = 400 >
			<form:input path="userEmail" 
				id = "userEmail" size = "30" maxlength="28"/>
			<form:errors path="userEmail" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 주소 </b></td>
		<td width = 400 >
			<form:input path="userAddr" 
				id = "userAddr" size = "30" maxlength="28"/>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 연락처 </b></td>
		<td width = 400 >
			<form:input path="userPh1" 
				id = "userPh1" size = "30" maxlength="28"/>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 프로필사진 </b></td>
		<td width = 400 >
			<input type="file" name = "profile" size = "30" />
		</td>
	</tr>
	<tr>
		<td colspan=2> 
			<input type ="submit" value="가입" id="submit1" />
			<input type ="button" value="취소"	
				onclick="javascript:location.href='loginmain'" />
		</td>
	</tr>
	</table>
	<input type = "hidden" name = "confirmNum" 
			id="confirmNum" value="2"/>
</form:form>
</body>
</html>