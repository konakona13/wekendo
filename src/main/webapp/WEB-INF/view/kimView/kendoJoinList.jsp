<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	response.setCharacterEncoding("utf-8");
	session.getAttribute("memAuth");
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

a { text-decoration:none }
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

			<c:set var ="doImgKind" value="${kendoJoin.doImg.doImgKind}" scope="session" />
				<c:if test="${doImgKind == 'main'}">	
					<img src="HHHview/doIMG/${kendoJoin.doImg.doImgName}"  width="400"><br/>
				</c:if>
		</div>
	</td>
	<td class = "desc2" >
		<span class="pnum" id="pnum">상품번호 : ${kendoJoin.doNum}</span><br />
	<!-- 게스트아이디 : ${memAuth.id}<br/> -->
		호스트번호 : ${kendoJoin.hostNum}<br />
		<input type = "hidden" value = "${memAuth.id}" id = "memId" name = "memId"/>
		<c:set var ="doStatus" value="${kendoJoin.doStatus}" scope="session" />

		<c:if test="${doStatus == 'inviting'}">
		<h3 id="kendoNum"><input type = "hidden" value = "${kendoJoin.doNum}" name = "doNum"/><a href="./kendoDetail/${kendoJoin.doNum}">${kendoJoin.doName}</a></h3><br />
		</c:if>

		<c:if test="${doStatus == 'invited' || doStatus == 'doing' || doStatus == 'docomplete' || doStatus == 'doend' || doStatus == 'CANCEL'}">
		<h3 style="color:grey;"><input type = "hidden" value = "${kendoJoin.doNum}" name = "doNum"/>${kendoJoin.doName}</h3><br />
		</c:if>
		모집인원 : ${kendoJoin.doNowPp}/${kendoJoin.doPp}<br/>
	</td>
</tr>
<tr>
	<td class = "desc3" >
		<div class="right">
	
		<c:if test="${doStatus == 'inviting'}">
			<div>
			<span class="price" id="price"><fmt:formatNumber pattern="###,###,###" value="${kendoJoin.paymentKim.payDutch}" />원</span><br />
			</div>
		</c:if>
		<c:if test="${doStatus == 'invited'}">
			<div>
			<h3 style="color:red;">모집종료</h3>
			</div>
		</c:if>	
		<c:if test="${doStatus == 'doing'}">
			<div>
			<h3 style="color:red;">활동중</h3>
			</div>
		</c:if>			
		<c:if test="${doStatus == 'doend'}">
			<div>
			<h3 style="color:red;">활동종료</h3>
			</div>
		</c:if>	
		<c:if test="${doStatus == 'cashcomplete'}">
			<div>
			<h3 style="color:red;">정산종료</h3>
			</div>
		</c:if>			
		<c:if test="${doStatus == 'CANCEL'}">
			<div>
			<h3 style="color:red;">활동취소</h3>
			</div>
		</c:if>	
		</div></td>
</tr>
</table>
<hr>
</c:forEach>
<div>

<c:if test="${empty kendoJoins}">
Do 내역이 없습니다.
</c:if>
</div>

<br/>               

        
<a href="main" >메인</a>
</body>
</html>