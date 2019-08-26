<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>활동상세내역</title>
</head>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-latest.js" ></script>
<script type="text/javascript" 
 			src="/mybatis-spring-smrit/js/jquery.form.js"></script>
<script type="text/javascript">
</script>
<body>
<h1>>활동번호  ${doDetail.doNum } 의 상세내용</h1><br>
회원번호 : ${doDetail.hostNum }<br>
활동명 : ${doDetail.doName }<br>
활동시작일: ${doDetail.startDate }<br>
활동종료일: ${doDetail.endDate }<br>
모집시작일: ${doDetail.openDate }<br>
모집종료일: ${doDetail.closeDate }<br>
활동상세설명: ${doDetail.doDetail }<br>
활동제한1: ${doDetail.optGender }<br>
활동제한2: ${doDetail.optAge }<br>
활동진행상태: ${doDetail.status }<br>
</body>
</html>