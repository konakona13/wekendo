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
</head>
<body>

<table width=50% border="1" cellpadding="0" cellspacing="0">

<tr align="center" valign="middle">
      <td colspan="3">상품 목록</td>
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

<c:forEach var="list" items="${list}">
   <tr align="center" valign="middle">
      <td height="23" style="font-family:Tahoma;font-size:10pt;">
         ${list.goodsNum}
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="left">
         <a href="./GoodsRegDetail.goods?num=${list.goodsNum}">
         <%-- <img  width=50% alt="" src="YYYView/fileupload/${list2.goodsImgName}">&nbsp; --%>
		 ${list.goodsName}         
         </a>
         </div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">${list.companyNum}</div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">
         <fmt:formatDate value="${list.regDate}" type="both" />
         </div>
      </td>
         
      <td style="font-family:Tahoma;font-size:10pt;">
		${list.goodsStatus}
      </td>   
      
   </tr>
</c:forEach>

   <tr align="right">
      <td colspan="5">
            <a href="GoodsReg">[글쓰기]</a>
      </td>
   </tr>
<c:if test="${empty list}">
	<tr align="center" valign="middle">
		<td colspan="4">MVC 회원리스트</td>
		<td align=right>
			<font size=2>등록된 회원이 없습니다.</font>
		</td>
	</tr>
</c:if>
 </table>
 
</body>
</html>