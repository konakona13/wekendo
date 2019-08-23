<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 승인_관리자페이지</title>
</head>
<body>
	상품 등록 승인
	<div>
		<table border ="1" >
        	<tr>
				<td>상품번호</td>			
                <td>상품명</td>
                <td>작성자</td>
                <td>등록일</td>
                <td>승인상태</td>
                <td>관리</td>                      
             </tr>
<c:if test="${! empty list}">                
	<c:forEach var="list" items="${list}">
            <tr>
                <td><input type="text" name = "chkGoodsNum" value="${list.goodsNum}"/></td>  
                <td>${list.goodsName}</td>  
                <td>${list.companyNum}</td>   
                <td>${list.regDate}</td>
                <td>${list.goodsStatus}</td>
                <td>
                	<input type="button" value="승인" id="confirm" 
                	 onclick="javascript:location.href='goodsConfirm'"/>
                	<input type="button" value="거부" id="confirm" 
                	 onclick="javascript:location.href='goodsCancel'"/>
                
                </td>      
             </tr>
        
	</c:forEach>
</c:if>               
		</table>     
	</div>
	
	<div>
<c:if test="${empty list}">
미승인 내역이 없습니다.
</c:if>
	</div>

<br/>               

        
<a href="../goodsMain" >메인</a>
</body>
</html>