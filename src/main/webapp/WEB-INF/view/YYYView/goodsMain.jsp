<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
<form id="frm" name="frm" method="POST">
<tr align="center" valign="middle">
      <td colspan="3">내 상품 목록</td>
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
   </tr>
   <tr align="right">
      <td colspan="5">
            <a href="goodsRegist">[글쓰기]</a>
      </td>
   </tr>
 </form>
 </table>
 
</body>
</html>