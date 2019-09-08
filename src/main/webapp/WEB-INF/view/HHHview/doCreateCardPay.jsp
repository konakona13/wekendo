<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		var txt = "카드결제완료";
		opener.document.getElementById("confirmPay").value = txt;
		
		opener.document.getElementById("cardCompany").value = $("#cardCompany").val();
		opener.document.getElementById("cardNum").value = $("#cardNum").val();
		opener.document.getElementById("cardCvc").value = $("#cardCvc").val();
		opener.document.getElementById("cardPass").value =  $("#cardPass").val();
		opener.document.getElementById("cardDate").value =  $("#cardDate").val();
		opener.document.getElementById("cardEmail").value =  $("#cardEmail").val();
		
		opener.payComplete();
		
		window.close();
	});
});



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


<body>


    <form action="결제완료.html">
    	<table class="container">
    	<tr>
    	<td>
    	<h1>카드결제</h1>
    	</td>
    	</tr>
    	
    	<tr>
    	<td>
    	 카드사명
    	</td>
    	<td>
    	 <select name="" id="cardCompany">
            <option value="sinhan">신한</option>
            <option value="samsung">삼성</option>
            <option value="hyundai">현대</option>
        </select>
    	</td>
    	</tr>
        
        <tr>
    	<th>
    	 카드번호
    	</th>
    	<td>
    	 <input type="text" id="cardNum">
    	</td>
    	</tr>
    	
    	<tr>
    	<th>
    	 CVC
    	</th>
    	<td>
    	 <input type="text" id="cardCvc">
    	</td>
    	</tr>
        
       <tr>
    	<th>
    	 카드비밀번호
    	</th>
    	<td>
    	<input type="password" id="cardPass">
    	</td>
    	</tr>
    	
    	<tr>
    	<th>
    	 카드유효기간
    	</th>
    	<td>
    	<input type="text" id="cardDate">
    	</td>
    	</tr>
    	
    	<tr>
    	<th>
    	 이메일
    	</th>
    	<td>
    	<input type="text" id="cardEmail">
    	</td>
    	</tr>
    	
    	<tr>
    	<td><input id="cardPay" type="submit" value="결제" class="button"></td>
    	</tr>
        
       
        </table>  
       
    </form>
   


</body>
</html>