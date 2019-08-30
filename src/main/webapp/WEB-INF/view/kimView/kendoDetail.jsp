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
<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.js" ></script>

<script type="text/javascript">
	$(function(){
		$("#doQty").change(function(){
			var doQty = parseInt($("#doQty").val());
			var doPrice = parseInt($("#doPrice").val());
			var totalPrice = doQty * doPrice ;
			$("#totalPrice").val(totalPrice);
		});
		
		$("#goPament").click(function(){
			var memGen = $("#gender").val());
			var memBirth = $("#birth").val());
			var doOptGender = $("#doOptGender").val());
			var doOptAge = $("#doOptAge").val());
			
			if(memGen == doOptGender)
		});
	});

</script>

</head>
<body>
    <div>
        <h3>상품상세페이지</h3>

        <% session.getAttribute("memAuth"); %> <input type = "hidden" name = "memId" value = "${memAuth.id}"/>${memAuth.id} 님 로그인 중 <br/>
        
        <form name="kendoJoin" action="kendoJoin" method="POST">        
        <table >
            <tr>
                <td width="450">
                <div>
				<c:forEach var="kendoImg" items="${kendoImgs}">
				<c:set var ="doImgKind" value="${kendoImg.doImgKind}" scope="session" />
					<c:if test="${doImgKind == 'main'}">
					<br/>
                			<img src="../HHHview/doIMG/${kendoImg.doImgName}"  width="400"><br/>
					</c:if>
                </c:forEach>
                </div>
                </td>
                <td>활동번호 :<input type = "hidden" name = "doNum" value = "${kendoDtail.doNum}"/>${kendoDtail.doNum}<br />
                  호스트번호 : <input type = "hidden" name = "hostNum" value = "${kendoDtail.hostNum}"/>${kendoDtail.hostNum}<br />
                
      	 성별 제한: <input type = "hidden" id = "doOptGender" value = "${kendoDtail.doOptGender}"/>${kendoDtail.doOptGender}<br />
       	나이제한 : <input type = "hidden" id = "doOptAge" value = "${kendoDtail.doOptAge}"/>${kendoDtail.doOptAge}<br />
               
               <!-- 활동구분 :<input type = "hidden" name = "theme" value = "취미>커피"/> 취미>  <br />
                    활동지역 :<input type = "hidden" name = "map" value = "서울>영등포구>양평동"/> 서울>영등포구>양평동 <br /> -->
                    <h3><input type = "hidden" name = "doName" value = "${kendoDtail.doName}"/>${kendoDtail.doName}</h3> <br />
                    모집인원  :<input type = "hidden" name = "doPp" value = "${kendoDtail.doPp}"/>${kendoDtail.doNowPp}/${kendoDtail.doPp}<br />
                <input type = "hidden" name = "doNowPp" value = "${kendoDtail.doNowPp}"/><br />
                    신청가능수량 : <input type = "number" id ="doQty" name = "doQty" min="1" max="${kendoDtail.doPp - kendoDtail.doNowPp}" required/><br /> 
                    가 격 : <input type = "hidden" name = "doPrice"  id ="doPrice" value = "${kendoDtail.paymentKim.payDutch}"/><fmt:formatNumber pattern="###,###,###" value="${kendoDtail.paymentKim.payDutch}" />원<br /> 
		     총금액 : <input type = "text" name = "totalPrice"  id ="totalPrice" value="" placeholder=""/><fmt:formatNumber pattern="###,###,###" value="" />원<br />                     
     	<!-- member 정보 -->
     	<input type = "hidden" id = "gender" name = "gender" value = "${membOpt.gender}"/>
     	<input type = "hidden" id = "birth" name = "birth" value = "${membOpt.memberBir}"/>
     	
                    <input type = "submit" value = "활동참가" id = "goPament" name = "doJoin"/>
                    <input type = "submit" value = "찜하기" name = "bookmark"/><br />       
                </td>
            </tr> 
    
            <tr>
               <td colspan="2">
				<c:forEach var="kendoImg" items="${kendoImgs}">
				<c:set var ="doImgKind" value="${kendoImg.doImgKind}" scope="session" />
					<c:if test="${doImgKind != 'main'}">
					${kendoDtail.doNum}/${kendoImg.doImgNum}/${kendoImg.doImgKind}/${kendoImg.doImgName}<br/>
                			<img src="../HHHview/doIMG/${kendoImg.doImgName}"  width="400"><br/>
					</c:if>
                </c:forEach>
				</td> 
			</tr> 
			<tr>
				<td colspan="2">
				<br/>
                     상세설명
                     <br/>
                <input type = "hidden" value="${kendoDtail.doDetail}"/>${kendoDtail.doDetail}<br />
                 </td>
            </tr>
            
        </table>
        </form>
    </div>
</body>
</html>