<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" 
				uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 가입</title>
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
<form:form action = "CompanyJoinAction" name = "frm" id = "frm" method="POST"
        commandName="companyJoinCommand" enctype="Multipart/form-data">
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
	<tr><td width = 200 ><b>* 기업회원구분</b></td>
		<td width = 400 >
			<select name="companyKind">
				<option value="place">활동장소업체</option>
				<option value="hotel">숙박업체</option>
				<option value="car">렌터카업체</option>
				<option value="mentor">멘토</option>
			</select>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 사업자번호 </b></td>
		<td width = 400 >
			<form:input path ="companyBn" 
				id = "companyBn" size = "12" maxlength="10"/>
			<form:errors path="companyBn" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 회사명</b></td>
		<td width = 400 >
			<form:input path ="companyName" 
				id = "companyName" size = "12" maxlength="10"/>
			<form:errors path="companyName" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 대표자명 </b></td>
		<td width = 400 >
			<form:input path="companyCap" 
				id = "companyCap" size = "12" maxlength="10" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 이메일 </b></td>
		<td width = 400 >
			<form:input path="managerEmail" 
				id = "managerEmail" size = "30" maxlength="28"/>
			<form:errors path="managerEmail" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 담당자명 </b></td>
		<td width = 400 >
			<form:input path="managerName" 
				id = "managerName" size = "30" maxlength="28"/>
			<form:errors path="managerName" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 주소 </b></td>
		<td width = 400 >
			<form:input path="companyAddr" 
				id = "companyAddr" size = "30" maxlength="28"/>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 연락처 </b></td>
		<td width = 400 >
			<form:input path="companyPh" 
				id = "companyPh" size = "30" maxlength="28"/>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 주거래은행 </b></td>
		<td width = 400 >
			<select name="companyBank">
				<option value="woorie">우리은행</option>
				<option value="ibk">기업은행</option>
				<option value="hana">하나은행</option>
				<option value="sinhan">신한은행</option>
			</select>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 정산계좌번호 </b></td>
		<td width = 400 >
			<form:input path="companyAcc" 
				id = "companyAcc" size = "30" maxlength="28"/>
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