<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" 
			src="http://code.jquery.com/jquery-latest.js" ></script>
			  		<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	//request된값을 text에 저장
	$("#id1").val("${userId}" );
	if("${userId}"==""){
		$("#confirm").html("다시작성해 주세요.");
		$("#confirmNum").val("1")
	}else{
	// msg값을 div에 출력
		$("#confirm").html("${msg}");
		$("#confirmNum").val("${num}");
	}
	$("#btn").click(function(){
		$(opener.document).find("#id1").val($("#id1").val());
		$(opener.document).find("#confirmNum").
		val($("#confirmNum").val());
		window.close();
	});
})
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
<div class="container">
<form name="frm" method="post" action ="confirmId" >
<div class="col-lg-1">
<input type = "text" name="id1" id="id1" class="form-control"/><br /></div>
<input type = "hidden" name = "confirmNum" 
			id="confirmNum" />
<div id="confirm"></div>
<input type="submit" value="ID중복확인" class="button">
<input type="button" value="닫기"  id = "btn" class="button"/>
</form>
</div>
</body>
</html>