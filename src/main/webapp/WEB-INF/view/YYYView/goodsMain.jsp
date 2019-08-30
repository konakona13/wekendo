<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
			uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 
			uri="http://java.sun.com/jsp/jstl/fmt" %>			

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<script type="text/javascript">

</script>
</head>
<body>

<table width=50% border="1" cellpadding="0" cellspacing="0">

<tr align="center" valign="middle">
      <td colspan="5">상품 목록</td>
      <td colspan="1">개수 : ${list.size()}</td>
   </tr>
   
   <tr align="center" valign="middle" bordercolor="#333333">
      <td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
         <div align="center">상품번호</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
         <div align="center">상품구분</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="40%">
         <div align="center">제목</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="14%">
         <div align="center">작성자</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="10%">
         <div align="center">날짜</div>
      </td>
	  <td style="font-family:Tahoma;font-size:8pt;" width="17%">
         <div align="center">승인상태</div>
      </td>
   </tr>

<c:forEach var="list" items="${list}" varStatus="status">
   <tr align="center" valign="middle">
      <td height="23" style="font-family:Tahoma;font-size:10pt;">
         ${list.goodsNum}
      </td>
       <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">${list.companyKind}</div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="left">
         <a href="./goodsRegDetail.goods/${list.goodsNum}" >
        <!-- <img  width=50% alt="" src="YYYView/fileupload/${imgList.goodsImgName}">&nbsp;  --> 
		 ${list.goodsName}         
         </a>
         </div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">${list.companyName}</div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center"> 
         <fmt:formatDate value="${list.regDate}" pattern="yy.MM.dd" />
         </div>
      </td>
         
      <td style="font-family:Tahoma;font-size:10pt;">
		${list.goodsStatus}
      </td>   
      
   </tr>
</c:forEach>

<c:if test="${empty list}">
	<tr rowspan="5" align="center" valign="middle">
	<td colspan="6">
			<font size=2>상품을 등록해 주세요.</font>
	</td>
	</tr>
</c:if>

<!-- 가입승인 된 회원만 상품등록 가능하게 조건문 -->

<c:set var="status" value="${company.companyStatus}" />
	
<c:if test="${status == '승인완료'}">
		   <tr align="right">
		      <td colspan="6">
		            <a href="goodsReg">[글쓰기]</a>
		      </td>
		   </tr>
</c:if>
		
<c:if test="${company.companyStatus == '미승인'}">
  		   <tr align="center">
		      <td colspan="6">
		            가입 승인 후에 상품 등록 서비스를 이용하실 수 있습니다.
		      </td>
		   </tr>
</c:if>


 </table>
 
 <a href="./main">메인</a>&nbsp;&nbsp;
 
</body>
</html>