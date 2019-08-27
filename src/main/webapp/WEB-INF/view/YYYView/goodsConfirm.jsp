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
<script type="text/javascript">
	function mapL(val){
		$.ajax({
			type:"POST",
			url :"mapM",
			data: "mapLNum=" +val,
			datatype: "html",
			success: function(data1){
				$("#mapMedium").html(data1);
				$("#mapSmall").html("");//a테이블 선택 변경시 c테이블 나오지않도록
			}
		});
	}
	
	function confirm(){
		$("#confirm").click(function(){
			
			location.href="confirmList/ok";
		})
		$("#confirm").click(function(){
	
		location.href="confirmList/no";
		})
	});

</script>
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
		<form action= "confirmList/ok" method="POST" name="okfrm">
		    <tr>
                <td><input type="text" name = "goodsNum" id="goodsNum" value="${list.goodsNum}"/></td>  
                <td>${list.goodsName}</td>  
                <td>${list.companyNum}</td>   
                <td>${list.regDate}</td>
                <td>${list.goodsStatus}</td>
                <td>
                	<input type="submit" value="승인" id="confirm" />
                	<input type="button" value="거부" id="cancel" onclick="javascript:location.href='confirmList'"/>
                
                </td>      
             </tr>
           </form> 
        
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

        
<a href="./" >메인</a>
</body>
</html>