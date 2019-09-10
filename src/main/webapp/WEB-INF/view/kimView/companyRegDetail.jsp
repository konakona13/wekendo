<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	response.setCharacterEncoding("utf-8");
 %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	
	<form name="frm" action="comRegOk" method="POST">
	<div class = "container">
	<h4>** 기업회원 가입 승인 상세</h4><br/>
		<table class="table table-striped">
        	<tr>
				<td>기업회원번호</td>
				<td>
					<input type="hidden" name = "chkComNum" value="${companyDetail.companyNum}"/>${companyDetail.companyNum}
				</td>
			</tr>
			<tr>	
				<td>기업회원분류</td>
				<td>${companyDetail.companyKind}</td>
			</tr>
			<tr>	
				<td>기업회원 아이디</td>
				<td>${companyDetail.companyId}</td>
			</tr>
			<tr>
                <td>사업자등록번호</td>
                <td>${companyDetail.companyBn}</td>
            </tr>
 			<tr>
                <td>기업회원 이름</td>
                <td>${companyDetail.companyName}</td>
            </tr>  
 			<tr>
                <td>대표이사 이름</td>
                <td>${companyDetail.companyCap}</td>
            </tr>                     
			<tr>
                <td>담당자</td>
                <td>${companyDetail.managerName}</td> 
            </tr>
			<tr>
                <td>전화번호</td>
                <td>${companyDetail.companyPh}</td> 
            </tr>
 			<tr>
                <td>이메일</td>
                <td>${companyDetail.companyEmail}</td> 
            </tr>           
			<tr>
                <td>주소</td>
                <td>${companyDetail.companyAddr}</td>
            </tr>
			<tr>
                <td>거래은행명</td>
                <td>${companyDetail.companyBank}</td>
            </tr>
			<tr>
                <td>계좌번호</td>
                <td>${companyDetail.companyAcc}</td>
            </tr>                        
			<tr>
                <td>승인상태</td>
                <td>${companyDetail.companyStatus}</td>                 
             </tr>              
		</table> 
		
		<input type = "submit" value = "가입승인" name = "comRegOk"/>
		</div>
 	</form>		    

	


<br/>               

</body>
</html>