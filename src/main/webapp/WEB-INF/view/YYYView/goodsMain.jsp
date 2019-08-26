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
      <td colspan="4">상품 목록</td>
      <td>개수 : ${list.size()}</td>
   </tr>
   
   <tr align="center" valign="middle" bordercolor="#333333">
      <td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
         <div align="center">상품번호</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="50%">
         <div align="center">제목</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="14%">
         <div align="center">작성자</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="17%">
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
         <div align="left">
         <a href="./goodsRegDetail.goods/${list.goodsNum}">
        <!-- <img  width=50% alt="" src="YYYView/fileupload/${imgList.goodsImgName}">&nbsp;  --> 
		 ${list.goodsName}         
         </a>
         </div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">${company[status.index].companyName }</div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">
         ${list.regDate}
         </div>
      </td>
         
      <td style="font-family:Tahoma;font-size:10pt;">
		${list.goodsStatus}
      </td>   
      
   </tr>
</c:forEach>

<c:if test="${empty list}">
	<tr rowspan="5" align="center" valign="middle">
	<td colspan="5">
			<font size=2>등록된 상품이 없습니다.</font>
	</td>
	</tr>
</c:if>


   <tr align="right">
      <td colspan="5">
            <a href="goodsReg">[글쓰기]</a>
      </td>
   </tr>

 </table>
 
</body>
</html>