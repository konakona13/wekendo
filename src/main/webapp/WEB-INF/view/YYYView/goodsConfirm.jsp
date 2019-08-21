<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<table>

<c:if test="${! empty hotList}">

<tr align="center" valign="middle">
      <td colspan="4">승인 대기 목록</td>
      <td align=right>
         <font size=2>${ReadCountUpdate}</font>
      </td>
   </tr>
   
   <tr align="center" valign="middle" bordercolor="#333333">
      <td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
         <div align="center">번호</div>
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
         <div align="center">승인</div>
      </td>
      <td style="font-family:Tahoma;font-size:8pt;" width="17%">
         <div align="center">승인 상태</div>
      </td>
   </tr>
   <tr align="right">
      <td colspan="5">
            <a href="GoodsReg">[글쓰기]</a>
      </td>
   </tr>

<c:forEach var="hotplace" items="${hotList}">
   <tr align="center" valign="middle" bordercolor="#333333"
      onmouseover="this.style.backgroundColor='F8F8F8'"
      onmouseout="this.style.backgroundColor=''">
      <td height="23" style="font-family:Tahoma;font-size:10pt;">
         ${hotplace.hpNum}
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="left">

         
         <a href="./HpMainView.hp?num=${hotplace.hpNum}">
         <img  width=50% alt="" src="HotplaceView/fileupload/${hotplace.hpFile }">&nbsp;
		 ${hotplace.hpSubject }         
         </a>
         </div>
      </td>
      
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">${hotplace.memberId}</div>
      </td>
      <td style="font-family:Tahoma;font-size:10pt;">
         <div align="center">
         <fmt:formatDate value="${hotplace.hpDate }"type="Date" />
         </div>
      </td>   
   </tr>
</c:forEach>
</c:if>

 </table>
 

</body>
</html>