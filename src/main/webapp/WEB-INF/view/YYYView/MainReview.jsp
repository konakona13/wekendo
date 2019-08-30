<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String hpNum = (String)session.getAttribute("num");
	%>

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	var reply_count = 0; //원래 DB에 저장하고 저장 아이디 번호를 넘겨줘야 하는데 DB 없이 댓글 소스만 있어 DB 에서 아이디 증가하는것처럼 스크립트에서 순번을 생성
            	var status = false; //수정과 대댓글을 동시에 적용 못하도록
                 
                $("#list").click(function(){
                	alert("게시판 리스트로 이동");
                    //location.href = "/board/list";
                });
                 
                //댓글 저장
                $("#reply_save").click(function(){
                     
                    //널 검사
                    if($("#reply_writer").val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_writer").focus();
                        return false;
                    }
                     
                    if($("#reivewScore").val().trim() == ""){
                        alert("평점을 매겨주세요.");
                        $("#reivewScore").focus();
                        return false;
                    }
                     
                    if($("#replyContent").val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#replyContent").focus();
                        return false;
                    }
                     
                    var reply_content = $("#replyContent").val().replace("\n", "<br>"); //개행처리
                     
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : "0",  
                            depth           : "0",
                            reply_writer    : $("#reply_writer").val(),
                            reply_password  : $("#reply_password").val(),
                            reply_content   : reply_content
                    };
                     
                    var reply_id;
                     
                    //ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                    /*
                    $.ajax({
                        url         :   "/board/reply/save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    
                    reply_id = reply_count++;//DB에 저장했다 하고 순번을 생성
                    
                    var reply_area = $("#reply_area");
                     
                    var reply = 
                        '<tr reply_type="main">'+
                        '   <td width="820px">'+
                        reply_content+
                        '   </td>'+
                        '   <td width="100px">'+
                        $("#reply_writer").val()+
                        '   </td>'+
                        '   <td width="100px">'+
                        '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                        '   </td>'+
                        '   <td align="center">'+
                        '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                        '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                        '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                        '   </td>'+
                        '</tr>';
                         
                     if($('#reply_area').contents().size()==0){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }
 
                    //댓글 초기화
                    $("#reply_writer").val("");
                    $("#reply_password").val("");
                    $("#reply_content").val("");
                     
                });
                 
                //댓글 삭제
                $(document).on("click","button[name='reply_del']", function(){
                     
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 삭제를 한다.
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/del",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 
                                check = true;
                                                                 
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    check = true;//삭제 되면 체크값을 true로 변경
                     
                    if(check){
                        //삭제하면서 하위 댓글도 삭제
                        var prevTr = $(this).parent().parent().next(); //댓글의 다음
                         
                        while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                            prevTr = prevTr.next();
                            prevTr.prev().remove();
                        }
                         
                        //마지막 리플 처리
                        if(prevTr.attr("reply_type") == undefined){
                            prevTr = $(this).parent().parent();
                            prevTr.remove();
                        }
                         
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                
                //댓글 수정 입력
                $(document).on("click","button[name='reply_modify']", function(){
                	
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var r_type = $(this).attr("r_type");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                        alert("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 패스워드 확인
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    /*
                    $.ajax({
                        url         :   "/board/reply/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                 
                                check = true;
                                                                 
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                    
                    check = true;//패스워드가 맞으면 체크값을 true로 변경
                    
                    if(status){
                		alert("수정과 대댓글은 동시에 불가합니다.");
                		return false;
                	}
                	
                	status = true;
                    
                    if(check){
                    	//자기 위에 댓글 수정창 입력하고 기존값을 채우고 자기 자신 삭제
                    	var txt_reply_content = $(this).parent().prev().prev().prev().html().trim(); //댓글내용 가져오기
                    	if(r_type=="sub"){
                    		txt_reply_content = txt_reply_content.replace("→ ","");//대댓글의 뎁스표시(화살표) 없애기
                    	}
                    	
                    	var txt_reply_writer = $(this).parent().prev().prev().html().trim(); //댓글작성자 가져오기
                    	
                    	//입력받는 창 등록
                        var replyEditor = 
                           '<tr id="reply_add" class="reply_modify">'+
                           '   <td width="820px">'+
                           '       <textarea name="reply_modify_content_'+reply_id+'" id="reply_modify_content_'+reply_id+'" rows="3" cols="50">'+txt_reply_content+'</textarea>'+ //기존 내용 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="text" name="reply_modify_writer_'+reply_id+'" id="reply_modify_writer_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="작성자" value="'+txt_reply_writer+'"/>'+ //기존 작성자 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="password" name="reply_modify_password_'+reply_id+'" id="reply_modify_password_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="패스워드"/>'+
                           '   </td>'+
                           '   <td align="center">'+
                           '       <button name="reply_modify_save" r_type = "'+r_type+'" reply_id="'+reply_id+'">등록</button>'+
                           '       <button name="reply_modify_cancel" r_type = "'+r_type+'" r_content = "'+txt_reply_content+'" r_writer = "'+txt_reply_writer+'" reply_id="'+reply_id+'">취소</button>'+
                           '   </td>'+
                           '</tr>';
                        var prevTr = $(this).parent().parent();
                       	//자기 위에 붙이기
                        prevTr.after(replyEditor);
                        
                        //자기 자신 삭제
                        $(this).parent().parent().remove(); 
                    }
                     
                });
                //댓글 수정 취소
                $(document).on("click","button[name='reply_modify_cancel']", function(){
                	//원래 데이터를 가져온다.
                	var r_type = $(this).attr("r_type");
                	var r_content = $(this).attr("r_content");
                	var r_writer = $(this).attr("r_writer");
                	var reply_id = $(this).attr("reply_id");
                	
                	var reply;
                	//자기 위에 기존 댓글 적고 
                	if(r_type=="main"){
                		reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                	}else{
                		reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                	}
                	
                	var prevTr = $(this).parent().parent();
                   	//자기 위에 붙이기
                    prevTr.after(reply);
                   	
                  	//자기 자신 삭제
                    $(this).parent().parent().remove(); 
                  	
                    status = false;
                	
                });
                
              	//댓글 수정 저장
                $(document).on("click","button[name='reply_modify_save']", function(){
                	
                	var reply_id = $(this).attr("reply_id");
                	
                	//널 체크
                    if($("#reply_modify_writer_"+reply_id).val().trim() == ""){
                        alert("이름을 입력하세요.");
                        $("#reply_modify_writer_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_password_"+reply_id).val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        $("#reply_modify_password_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_content_"+reply_id).val().trim() == ""){
                        alert("내용을 입력하세요.");
                        $("#reply_modify_content_"+reply_id).focus();
                        return false;
                    }
                	//DB에 업데이트 하고
                	//ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                	var reply_content = $("#reply_modify_content_"+reply_id).val().replace("\n", "<br>"); //개행처리
                    
                	var r_type = $(this).attr("r_type");
                	
                	var parent_id;
                	var depth;
                	if(r_type=="main"){
                		parent_id = "0";
                		depth = "0";
                	}else{
                		parent_id = $(this).attr("reply_id");
                		depth = "1";
                	}
                	
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            parent_id       : parent_id, 
                            depth           : depth,
                            reply_writer    : $("#reply_modify_writer_"+reply_id).val(),
                            reply_password  : $("#reply_modify_password_"+reply_id).val(),
                            reply_content   : reply_content
                    };
                    /*
                    $.ajax({
                        url         :   "/board/reply/update",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                reply_id = retVal.reply_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                	//수정된댓글 내용을 적고
                    if(r_type=="main"){
                		reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_reply" reply_id = "'+reply_id+'">댓글</button>'+
                            '       <button name="reply_modify" r_type = "main" reply_id = "'+reply_id+'">수정</button>      '+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>      '+
                            '   </td>'+
                            '</tr>';
                	}else{
                		reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button name="reply_modify" r_type = "sub" reply_id = "'+reply_id+'">수정</button>'+
                            '       <button name="reply_del" reply_id = "'+reply_id+'">삭제</button>'+
                            '   </td>'+
                            '</tr>';
                	}
                    
                    var prevTr = $(this).parent().parent();
                   	//자기 위에 붙이기
                    prevTr.after(reply);
                   	
                  	//자기 자신 삭제
                    $(this).parent().parent().remove(); 
                  	
                    status = false;
                	
                });
                 
                //글 삭제
                $("#delete").click(function(){
                     
                    var password = $("input[name='password']");
                     
                    if(password.val().trim() == ""){
                        alert("패스워드를 입력하세요.");
                        password.focus();
                        return false;
                    }
                     
                    //ajax로 패스워드 검수 후 수정 페이지로 포워딩
                    //값 셋팅
                    var objParams = {
                            id       : $("#board_id").val(),    
                            password : $("#password").val()
                    };
                    
                    alert("패스워드 체크하고 맞으면 게시글 삭제후 리스트 페이지 이동");
                    /*                 
                    //ajax 호출
                    $.ajax({
                        url         :   "/board/del",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                alert(retVal.message);
                            }else{
                                alert("삭제 되었습니다.");
                                location.href = "/board/list";
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    */
                     
                });
                 
            });
        </script>
    </head>
    <style>
        textarea{
              width:100%;
            }
             
        .reply_reply {
                border: 2px solid #FF50CF;
            }
        .reply_modify {
                border: 2px solid #FFBB00;
            }
    </style>
    <body>
        <input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
        <div align="center">
            </br>
            </br>
           
            <table border="1" width="1200px" id="reply_area">
                <tr reply_type="all"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
                    <td colspan="4">리뷰를 작성해주세요.</td>
                </tr>
                <!-- 댓글이 들어갈 공간 -->
            </table>
            <form action="HpMainView.hp?num=${hpNum}" method="post">
            <table border="1" width="600px" bordercolor="#46AA46">
                <tr>
                <td width="300px">
                <input type="hidden" name="reviewNum" value="글번호" />
           		<a id="reply_writer">이름: ${member.meberName}</a></td>
        		<td>  평점:<select id ="reivewScore" name="reivewScore" class="reivewScore">
					<OPTION value=""></OPTION>
					<OPTION value="1">1</OPTION>
					<OPTION value="2">2</OPTION>
					<OPTION value="3">3</OPTION>
					<OPTION value="4">4</OPTION>
					<OPTION value="5">5</OPTION>
					<OPTION value="6">6</OPTION>
					<OPTION value="7">7</OPTION>
					<OPTION value="8">8</OPTION>
					<OPTION value="9">9</OPTION>
					<OPTION value="10">10</OPTION>
				</select></td>
           <td><button id="replySave" name="replySave" value="submit">댓글 등록</button>
           </td>
           </tr>
          <tr>
           <td>
           	  <textarea id="reviewComment" name="reviewComment" rows="4" cols="50" placeholder="댓글을 입력하세요."></textarea>
           </td>
           </tr>
            </table>
            </form>

        </div>
    </body>
</html>