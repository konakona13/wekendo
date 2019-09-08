<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
	uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" 
	uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
<script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
 
  <!-- 가져옴 시작 -->
 	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <!-- 가져옴 끝 -->
 
<script type="text/javascript">
$(function(){
	$("#cardPay").click(function()
	{
		/* if($("#id1").val()==""|| $("#id1").val()==null)
		{
			$("#id1").focus();
			$("#msg").html("아이디를 입력하세요");
			return false;
		}
		var url = "confirmId?id1="+$("#id1").val(); */
		var url = "doCreateCardPay"
		open(url,"cardPay","width=500, height=300");
	});
	
	$("#kakaoBtn").click(function()
			{
				/* if($("#id1").val()==""|| $("#id1").val()==null)
				{
					$("#id1").focus();
					$("#msg").html("아이디를 입력하세요");
					return false;
				}
				var url = "confirmId?id1="+$("#id1").val(); */
				var url = "kakao?doName="+$("#doName").val()
						 +"&sumPrice="+$("#sumPrice").val();
				open(url,"kakaoPay","width=600, height=600");
	});
});

function payComplete()
{
   $("#comp").submit();
}

function payFail()
{
	location.href = "main";
}

</script>
    
</head>
<style>
body {margin-top:20px;
      margin-left:30px;
     font-family:맑은 고딕,돋움,굴림;
     color:black;
     font-size:8pt;
    }
table {border-collapse:separate;
       font-size:9pt;
      margin-left:0;
     }
img {border:none;}
select {font-size:8pt
        font-family:맑은 고딕,돋움,굴림;
      height:22px
      }
option {border:#cccccc solid 1px;
        font-family:돋움,굴림;
      color:black;
      font-size:12px;}
input {height:18px;}
th,td {padding-left:20px;
       text-align:left;
      background-image:url(images/member/dot.gif);
      background-repeat:no-repeat;
      background-position:left;
      border-bottom:#eeeeee solid 1px;
     }
#pink_line {margin-left:"0";}
#member_button {margin-top:10px;
                text-align:center;
            }
#mbname,#mbid,#mbpw,#mbpw2,#email_dns,#mbpw3 {width:150px;
                                              height:18px;
                                  }
#mbjumin_1,#mbjumin_2,#zip_h_1,#zip_h_2 {width:68px;
                                         height:18px;
                              }
#addr_h1 {width:350px;
          height:18px;
       }
#addr_h2 {width:700px;
          height:18px;
       }
#mbpw2 {width:200px;
        height:18px;
      }
#cel1,#tel_h2_1,#tel_h2_2 {width:68px;}
#tel_h1 {width:55px;}
.button {
  font-size: 12px;
  font-weight: 600;
  color: white;
  padding: 6px 25px 0px 20px;
  margin: 10px 8px 20px 0px;
  display: inline-block;
  text-decoration: none;
  width: 100px; height: 27px; 
  -webkit-border-radius: 5px; 
  -moz-border-radius: 5px; 
  border-radius: 5px; 
  background-color: #3a57af; 
  -webkit-box-shadow: 0 3px rgba(58,87,175,.75); 
  -moz-box-shadow: 0 3px rgba(58,87,175,.75); 
  box-shadow: 0 3px rgba(58,87,175,.75);
  transition: all 0.1s linear 0s; 
  top: 0px;
  position: relative;
  text-align: center;
}

.button:hover {
  top: 3px;
  background-color:#2e458b;
  -webkit-box-shadow: none; 
  -moz-box-shadow: none; 
  box-shadow: none;
  
}
/* .help-block 을 일단 보이지 않게 설정 */
        #myForm .help-block{
            display: none;
        }
        /* glyphicon 을 일단 보이지 않게 설정 */
        #myForm .glyphicon{
            display: none;
        }
</style>



<body bgcolor="#e0ffff">
		
<div class="container">		

<fieldset>
<table width = 600 align = "center" border = 0 
			cellpadding = 3 class="table table-striped">
			<tr>
			<td colspan="2"><h1>최종견적서</h1></td>
			</tr>
			
    		
    		<tr>
    		<td width="100"> <b>고객명(활동장)</b> </td>
    		<td width="500">${memAuth.name }</td>
    		</tr>
    		
    		<tr>
    		
    		<td width="200"><b>활동명</b> </td>
    		<td width="400">${kendo.doName}</td>
    		</tr>
    		
    		<tr>
    		
    		<td width="200"><b>활동시작일</b>  </td>
    		<td width="400">${kendo.doStartDate}</td>
    		</tr>
    		
    		<tr>
    		
    		<td width="200"> <b>활동종료일</b>  </td>
    		<td width="400">${kendo.doEndDate}</td>
    		</tr>
    		
    		<tr>
    		
    		<td width="200"><b>모집인원</b>  </td>
    		<td width="400">${kendo.doPp}</td>
    		</tr>
    

	<c:forEach var="goods" items="${goodsList}">
    <c:set var="goodsNum" value="${goods.goodPlaceNum}"></c:set>
    
    <%-- <c:if test="${fn:contains(goodsNum,'GDP') }">
     	<p>if활동장소명 : ${goods.goodPlaceName} </p>
    	<p>장소이용금액 : ${goods.totalPrice} </p>
   	</c:if>  --%>
   	
	    <c:choose>
				<c:when test="${fn:contains(goodsNum,'GDP') }">
					<tr>
					<th bgcolor="#b0e0e6" colspan="2">=장소상품=</th>
					</tr>
					<tr>
					
					<td width="200"><b>활동장소명</b>  </td>
    				<td width="400">${goods.goodPlaceName}</td>
					</tr>
					<tr>
					
					<td width="200"><b>장소사용기간</b>  </td>
    				<td width="400">${goods.buyDays} 일</td>
					</tr>
					<tr>
					
					<td width="200"><b>장소이용금액</b>  </td>
    				<td width="400">${goods.totalPrice}</td>
					</tr>
					<tr>
					<td bgcolor="#b0e0e6" colspan="2">    </td>
					
					</tr>
					
				</c:when>
				
				<c:when test="${fn:contains(goodsNum,'GDH') }">
					<tr>
					<th bgcolor="#b0e0e6" colspan="2">=숙박상품=</th>
					</tr>
					<tr>
					
					<td width="200"><b>숙박상품명</b>  </td>
    				<td width="400">${goods.goodPlaceName}</td>
					</tr>
					<tr>
					
					
					</tr>
					<tr>
					
					<td width="200" ><b>숙박이용총금액</b>  </td>
    				<td width="400">${goods.totalPrice}</td>
					</tr>
					
				 	
				</c:when>
				
				<c:when test="${fn:contains(goodsNum,'GDC') }">
					<tr>
					<th bgcolor="#b0e0e6" colspan="2">=렌트카상품=</th>
					</tr>
					<tr>
					
					<td width="200"><b>렌터카상품명</b>  </td>
    				<td width="400">${goods.goodPlaceName}</td>
					</tr>
					<tr>
					
					<td width="200"><b>렌터카이용기간</b>  </td>
    				<td width="400">${goods.buyDays} 일</td>
					</tr>
					<tr>
					
					<td width="200"><b>렌터카이용총금액</b>  </td>
    				<td width="400">${goods.totalPrice}</td>
					</tr>
					
				    
				</c:when>
				
				<c:when test="${fn:contains(goodsNum,'GDM') }">
					<tr>
					<th bgcolor="#b0e0e6" colspan="2">=멘토상품=</th>
					</tr>
					<tr>
					
					<td width="200"><b>멘토명</b>  </td>
    				<td width="400">${goods.goodPlaceName}</td>
					</tr>
					<tr>
					
					<td width="200"><b>멘토이용기간</b>  </td>
    				<td width="400">${goods.buyDays} 일</td>
					</tr>
					<tr>
					
					<td width="200"><b>멘토이용총금액</b>  </td>
    				<td width="400">${goods.totalPrice}</td>
					</tr>
					
				 	
				</c:when>
				
				<c:otherwise> ... </c:otherwise>
				
	    </c:choose>
	</c:forEach>
   
    <tr>
	
	<td width="200"><b>결제 금액</b>  </td>
    				<td width="400">${sumPrice}</td>
	</tr>
    
    
    <tr>
	
	</tr>

	
	<tr>
	<td colspan="2"><input type="button" id="cardPay" value="카드결제" class="button"></td>
	</tr>
	
	<tr>
	<td colspan="2">
	<form action="kakao" method="post">
            <input type="button" id="kakaoBtn" value="카카오페이" class="button">
            <input type="hidden" name="doName" id="doName" value="${kendo.doName}">
            <input type="hidden" name="sumPrice" id="sumPrice" value="${sumPrice}">
    </form>
    <form action="doPayComplete" id="comp">
    	
    	<input type="hidden" id="hostNum" name="hostNum" value="${kendo.hostNum }">
    	<input type="hidden" id="pp" name="pp" value="${kendo.doPp}">
    	<input type="hidden" id="price" name="price" value="${placeGoods.goodsPrice}">
    	
    	<p><input type="hidden" id="cardCompany" name="cardCompany"></p>
    	<p><input type="hidden" id="cardNum" name="cardNum"></p>
        <p><input type="hidden" id="cardCvc" name="cardCvc"></p>
        <p><input type="hidden" id="cardPass" name="cardPass"></p>
        <p><input type="hidden" id="cardDate" name="cardDate"></p>
        <p><input type="hidden" id="cardEmail" name="cardEmail" value="none"></p>
    	
    </form>
    <input id="confirmPay" type="hidden" value="미완료">
	</td>
	
	
	</tr>
	
	
    
    
</table>
</fieldset>
</div>    
</body>
</html>