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
<title>Insert title here</title>
<meta charset="UTF-8">
<style type="text/css">
.desc1, .desc2 {vertical-align: top;}
.desc3{vertical-align: bottom;}
.thum {
	float: left;
	margin-right: 10px
}
</style>

</head>
<body>
<h3>Do List</h3>

	<div>
		<table border ="1" >
        	<tr>
        		<td>Do No.</td>

                <td>DO 이름</td>
				<td>HOST 번호</td>
                <td>DO 시작날짜</td>
                <td>DO 종료날짜</td>
                <td>DO 진행상태</td>  

				<td>모집인원</td>
				<td>현재인원</td>				
				<td>단가  금액</td>        
                                  
             </tr>
<c:if test="${! empty kendoJoins}">                
	<c:forEach var="kendoJoin" items="${kendoJoins}">
            <tr>

				<td>${kendoJoin.doNum}</td>  
                <td>${kendoJoin.doName}</td>  
           		<td>${kendoJoin.hostNum}</td>                 
                <td>${kendoJoin.doStartDate}</td>  
                <td>${kendoJoin.doEndDate}</td>   
                <td>${kendoJoin.doStatus}</td>

				<td>${kendoJoin.doPp}</td>
				<td>${kendoJoin.doNowPp}</td>				
				<td>${kendoJoin.paymentKim.payDutch}</td>  
             </tr>
	</c:forEach>
</c:if>               
		</table>     
	</div>


<c:forEach var="kendoJoin" items="${kendoJoins}">
<div id="kendoJoin_list" class="kendoJoin_list">
<table id = "list" border = "0" cellspacing = "0">
<tr>
	<td class = "desc1"rowspan=2 width="300" >
		<div class="thum">
		<img class="thum" src="" width="200">
		</div>
	</td>
	<td class = "desc2" >
		<span class="pnum" id="pnum">상품번호 : ${kendoJoin.doNum}</span><br />
		호스트번호 : ${kendoJoin.hostNum}<br />
		<c:set var ="doNowPp" value="${kendoJoin.doNowPp}" scope="session" />
		<c:set var ="doPp" value="${kendoJoin.doPp}" scope="session" />
		<c:if test="${doNowPp < doPp}">
		<h3><input type = "hidden" value = "${kendoJoin.doNum}" name = "doNum"/><a href="./kendoDetail/${kendoJoin.doNum}">${kendoJoin.doName}</a></h3><br />
		</c:if>
		<c:if test="${doNowPp == doPp}">
		<h3 style="color:grey;"><input type = "hidden" value = "${kendoJoin.doNum}" name = "doNum"/><a href="">${kendoJoin.doName}</a></h3><br />
		</c:if>
		모집인원 : ${kendoJoin.doNowPp}/${kendoJoin.doPp}<br/>
	</td>
</tr>
<tr>
	<td class = "desc3" >
		<div class="right">
	
		<c:if test="${doNowPp < doPp}">
			<span class="price" id="price"><fmt:formatNumber pattern="###,###,###" value="${kendoJoin.paymentKim.payDutch}" />원</span><br />
		</c:if>
		<c:if test="${doNowPp == doPp}">
			<h3 style="color:red;">모집종료</h3>
		</c:if>	
		</div></td>
</tr>
										
	

</table>
<hr>
</c:forEach>












	
	<div>
<c:if test="${empty kendoJoins}">
Do 결제 내역이 없습니다.
</c:if>
	</div>

<br/>               

        
<a href="main" >메인</a>
</body>
</html>