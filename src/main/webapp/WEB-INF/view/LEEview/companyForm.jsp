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
 		<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
<style>
body {margin-top:20px;
      margin-left:30px;
     font-family:맑은 고딕,돋움,굴림;
     color:black;
     font-size:8pt;
    }
table {border-collapse:separate;
       font-size:9pt;
      margin-left:0;
     }
img {border:none;}
select {font-size:8pt
        font-family:맑은 고딕,돋움,굴림;
      height:22px
      }
option {border:#cccccc solid 1px;
        font-family:돋움,굴림;
      color:black;
      font-size:12px;}
input {height:18px;}
th,td {padding-left:20px;
       text-align:left;
      background-image:url(images/member/dot.gif);
      background-repeat:no-repeat;
      background-position:left;
      border-bottom:#eeeeee solid 1px;
     }
#pink_line {margin-left:"0";}
#member_button {margin-top:10px;
                text-align:center;
            }
#mbname,#mbid,#mbpw,#mbpw2,#email_dns,#mbpw3 {width:150px;
                                              height:18px;
                                  }
#mbjumin_1,#mbjumin_2,#zip_h_1,#zip_h_2 {width:68px;
                                         height:18px;
                              }
#addr_h1 {width:350px;
          height:18px;
       }
#addr_h2 {width:700px;
          height:18px;
       }
#mbpw2 {width:200px;
        height:18px;
      }
#cel1,#tel_h2_1,#tel_h2_2 {width:68px;}
#tel_h1 {width:55px;}
.button {
  font-size: 12px;
  font-weight: 600;
  color: white;
  padding: 6px 25px 0px 20px;
  margin: 10px 8px 20px 0px;
  display: inline-block;
  text-decoration: none;
  width: 100px; height: 27px; 
  -webkit-border-radius: 5px; 
  -moz-border-radius: 5px; 
  border-radius: 5px; 
  background-color: #3a57af; 
  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
  box-shadow: 0 3px rgba(58,87,175,.75);
  transition: all 0.1s linear 0s; 
  top: 0px;
  position: relative;
  text-align: center;
}

.button:hover {
  top: 3px;
  background-color:#2e458b;
  -webkit-box-shadow: none; 
  -moz-box-shadow: none; 
  box-shadow: none;
  
}
/* .help-block 을 일단 보이지 않게 설정 */
        #myForm .help-block{
            display: none;
        }
        /* glyphicon 을 일단 보이지 않게 설정 */
        #myForm .glyphicon{
            display: none;
        }
</style>
<body >
<div class="container">
<h3>기업회원 회원가입</h3>
<form:form action = "CompanyJoinAction" name = "frm" id = "frm" method="POST"
        commandName="companyJoinCommand" enctype="Multipart/form-data">
	<table width = 600 align = "center" border = 0
			cellpadding = 3 class="table table-striped">
	<tr><td width = 200 bgcolor="#b0e0e6" colspan="2"><b>아이디입력 </b></td>
		
	</tr>
	<tr><td width = 200 >
		<b>* 아이디 </b></td>
		<td width = 400 >
			<form:input path="id1" id = "id1"  name="id1" class="form-control"
			placeholder = "영소문자,숫자만 사용가능하며 8자리 이상 작성해주세요."
				size = "12" maxlength="10"/>
			<input type="button" value="중복확인" id = "confirmId" class="button"/>
			<div id = "msg"></div>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 비밀번호 </b></td>
		<td width = 400 >
			<form:password path="pw" 
				id = "pw" size = "12" maxlength="10" class="form-control"
				placeholder = "영문+숫자조합 12자리 이상 작성해주세요." />
			<form:errors path="pw" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 비밀번호 확인 </b></td>
		<td width = 400 >
			<form:password path="pw1" 
				id = "pw1" size = "12" maxlength="10" class="form-control"/>
			<form:errors path="pw1" />
		</td>
	</tr>
	<tr><td width = 200 bgcolor="#b0e0e6" colspan="2" ><b>기본정보 입력 </b></td>
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
				id = "companyBn" size = "12" maxlength="10" class="form-control"/>
			<form:errors path="companyBn" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 회사명</b></td>
		<td width = 400 >
			<form:input path ="companyName" 
				id = "companyName" size = "12" maxlength="10" class="form-control"/>
			<form:errors path="companyName" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 대표자명 </b></td>
		<td width = 400 >
			<form:input path="companyCap" 
				id = "companyCap" size = "12" maxlength="10" class="form-control" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 이메일 </b></td>
		<td width = 400 >
			<form:input path="managerEmail" 
				id = "managerEmail" size = "30" maxlength="28" class="form-control"
				placeholder ="예) wecando@wecando.com"/>
			<form:errors path="managerEmail" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 담당자명 </b></td>
		<td width = 400 >
			<form:input path="managerName" 
				id = "managerName" size = "30" maxlength="28" class="form-control"/>
			<form:errors path="managerName" />
		</td>
	</tr>
	<tr><td width = 200 ><b>* 주소 </b></td>
		<td width = 400 >
			<form:input path="companyAddr" 
				id = "companyAddr" size = "30" maxlength="28" class="form-control"/>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 연락처 </b></td>
		<td width = 400 >
			<form:input path="companyPh" 
				id = "companyPh" size = "30" maxlength="28" class="form-control"
				placeholder ="숫자만 입력해주세요 (-없이)"/>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 주거래은행 </b></td>
		<td width = 400 >
			<select name="companyBank">
				<option value="우리은행">우리은행</option>
				<option value="기업은행">기업은행</option>
				<option value="하나은행">하나은행</option>
				<option value="신한은행">신한은행</option>
			</select>
		</td>
	</tr>
	<tr><td width = 200 ><b>* 정산계좌번호 </b></td>
		<td width = 400 >
			<form:input path="companyAcc" 
				id = "companyAcc" size = "30" maxlength="28" class="form-control"/>
		</td>
	</tr>
	<tr>
		<td colspan=2> 
			<input type ="submit" value="가입" id="submit1" class="button" style="float: right;" />
			<input type ="button" value="취소" class="button"	 style="float: right;"
				onclick="javascript:location.href='loginmain'" />
		</td>
	</tr>
	</table>
	<input type = "hidden" name = "confirmNum" 
			id="confirmNum" value="2"/>
</form:form>
</div>
</body>
</html>