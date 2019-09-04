<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <script type="text/javascript" 
 src="http://code.jquery.com/jquery-latest.js" ></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//도미노
	   $(function(){
	      $.ajax({
	         type:"POST",
	         url :"mapL",
	         datatype: "html",
	         success: function(data1){
	            $("#mapMain").html(data1);
	         }
	      });
	      
	     $("#btn").click(function()
	     {
	    	var mapss = $("#mapSmallSS").val();
			$("#testH").val(mapss);
			
		});
	     
	     
	   });

</script>  
</head>
<body>

	   지역선택	 <div id = "mapMain"> </div> 
	   
	 테스트 출력 <input type="text" id="testH">
	 <input type="button" value="버튼" id="btn">
</body>
</html>