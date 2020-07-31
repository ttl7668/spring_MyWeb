<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>인덱스를 만들어 보자</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	
</head>
<body>
	
	<%@ include file="../include/header.jsp" %>
	<!--게시판-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 write-wrap">
                        <div class="titlebox">
                            <p>상세보기</p>
                        </div>
                        
                        <form action="freeModify" name="detailForm" method="post">
                            <div>
                                <label>DATE</label>
                                <p><fmt:formatDate value="${boardVO.regdate }" pattern="yyyy-MM-dd"/></p>
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name='bno' readonly value="${boardVO.bno }">
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" name='writer' readonly value="${boardVO.writer }">
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name='title' readonly value="${boardVO.title }">
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name='content' readonly>${boardVO.content }</textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">변경</button>
                            <button type="button" class="btn btn-dark" onclick="location.href='freeList'">목록</button>
                    </form>
                </div>
            </div>
        </div>
        </section>
        
        <section style="margin-top: 80px;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-md-9 write-wrap">
                        <form class="reply-wrap">
                            <div class="reply-image">
                                <img src="../resources/img/profile.png">
                            </div>
                            <!--form-control은 부트스트랩의 클래스입니다-->
	                    <div class="reply-content">
	                        <textarea class="form-control" rows="3" id="reply"></textarea>
	                        <div class="reply-group">
	                              <div class="reply-input">
	                              <input type="text" class="form-control" placeholder="이름" id="replyId">
	                              <input type="password" class="form-control" placeholder="비밀번호" id="replyPw">
	                              </div>
	                              
	                              <button type="button" class="right btn btn-info" id="replyRegist">등록하기</button>
	                        </div>
	
	                    </div>
                        </form>

                        <!--여기에접근 반복-->
                        <div id="replyList">
                <!--         <div class='reply-wrap'>
                            <div class='reply-image'>
                                <img src='../resources/img/profile.png'>
                            </div>
                            <div class='reply-content'>
                                <div class='reply-group'>
                                    <strong class='left'>honggildong</strong> 
                                    <small class='left'>2019/12/10</small>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
                                    <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
                                </div>
                                <p class='clearfix'>여기는 댓글영역</p>
                            </div>
                        </div> -->
                        
                        </div>
                        <button class="form-control" id="moreList">더보기(페이징)</button>
                    </div>
                </div>
            </div>
        </section>
        
        <%@ include file="../include/footer.jsp" %>
        
        
        <script>
        	//화면 로딩이 끝난 직후 실행되는 제이쿼리
        	$(document).ready(function(){
        		$("#replyRegist").click(function(){
        			add();
        		})
        		//등록함수 
        		function add(){
        			
        			var bno = "${boardVO.bno }" //컨트롤러에서 넘어온 게시글 번호
        			var reply = $("#reply").val();//reply 태그값
        			var replyId = $("#replyId").val();//replyId 태그값
        			var replyPw = $("#replyPw").val();//replyPw 태그값
        			
        			console.log(reply)
 					
        			if(reply===''||replyId===''||replyPw===''){
        				alert("이름,비번,내용을 입력하세요");
        				return;
        			}
        			console.log({"bno":bno,"reply":reply,"replyId":replyId,"replyPw":replyPw});
        			
        			$.ajax({
        				type:"POST", //요청방식
        				url:"../reply/replyRegist",
        				data:JSON.stringify({"bno":bno,"reply":reply,"replyId":replyId,"replyPw":replyPw}), //문자열의 형태로 변경해서 요청
        				dataType:"text", //서버로 부터 어떤형식으로 받을건지
        				contentType:"application/json; charset=utf-8", //기본값은 폼형식을 지정하는데 제이슨 형식으로 보낼때는 반드시 타입을 명시해야함 
        			 	success:function(data){ //요청성공시 돌려받을 콜백함수
       
        			 		if(data==1){	//등록성공
        			 			$("#reply").val("");
        			 			$("#replyId").val("");
        			 			$("#replyPw").val("");
        			 			getList(1,true); //목록메서드
        			 			
        			 		}else{
        			 			alert("등록에 실패햇습니다. 잠시후 다시 시도하세요")
        			 		}
        			 	},
        			 	error :function(status,error){ //에러 발생시 실행시킬 콜백함수
        			 		alert("등록에 실패햇습니다.")
        			 	}
        			 	
        			})
        			
        		} //add함수 끝
        		
        		//더보기 버튼처리(클릭시 전역변수 페이지번호에 +1 값을 전달)
        		$("#moreList").click(function(){
        			
        			getList(++page,false);
        			
        		})
        		
        		//목록 요청
        		var page = 1; //페이지번호
        		var strAdd=""; //화면에 그려넣을 태그를 문자열의 형태로 추가할 변수
        		
        		getList(1,true); //상세화면 진입시에 리스트 목록을 가져옴
        		function getList(pageNum,reset){//매개변수로 페이지번호,화면리셋여부
        			
        			var bno = "${boardVO.bno }";//게시글 번호
        			
        			$.getJSON(
        					"../reply/getList/" + bno+"/"+pageNum,
        					function(data){
        				 	console.log(data);
        				 	
        				 	var total = data.total;//댓글의 총게시글 수 
        				 	var data = data.list; //댓글 리스트
        				 	
        				 	if(page*20>=total){//페이지번호 * 데이터수가 전체게시글 개수보다 크면 더보기를 삭제
        				 		$("#moreList").css("display","none");
        				 		
        				 	}else{
        				 		$("#moreList").css("display","block");
        				 	}
        				 	
        				 	if(reset==true){ //insert,delete,update 다음에는 댓글을 누적하고 있는 strAdd변수를 초기화
        				 		strAdd ="";
        						page = 1;
        				 	}
        				 	
        				 	if(data.length<=0){//응답 데이터의 길이가 0보다 같거나 작으면 함수 종료
        				 		return; //함수종료
        				 	}
        				 	
        				 	//var strAdd = "";//화면에 그려넣을 태그를 문자열의 형태로 추가할 변수 
        				 	for(var i = 0; i<data.length;i++){
        				 		strAdd += "<div class='reply-wrap' style='display:none;'>";
        				 		strAdd += "<div class='reply-image'>";
        				 		strAdd += "<img src='../resources/img/profile.png'>";
        				 		strAdd += "</div>";
        				 		strAdd += "<div class='reply-content'>";
        				 		strAdd += "<div class='reply-group'>";
        				 		strAdd += "<strong class='left'>"+data[i].replyId+"</strong>";
        				 		strAdd += "<small class='left'>"+timeStamp(data[i].replyDate)+"</small>" ;
        				 		strAdd += "<a href='"+data[i].rno+"' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
        				 		strAdd += "<a href='"+data[i].rno+"' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
        				 		strAdd += "</div>";
        				 		strAdd += "<p class='clearfix'>"+data[i].reply+"</p>";
        				 		strAdd += "</div>";
        				 		strAdd += "</div>";
        				 	}
        				 	
        				 	$("#replyList").html(strAdd); //replyList에 문자열형식으로 추가
        				 	$(".reply-wrap").fadeIn(1000); 
        				 	//화면을 그릴때 reply-wrap를 display:none으로 선언하고 제이쿼리 페이드인함수로 서서히 보이게 처리
        				}
        			)
        					
        		}//getList 함수 끝
        		
        		//수정삭제
        		/*
        		에이젝스의 실행이 더 늦게 완료가 되므로 실제 이벤트의 선언이 먼저 실행되게 합니다.
        		그러면 화면에 댓글 관련 창은 아무것도 등록 되지 않은 형태이므로, 일반클릭이벤트가 동작하지 않습니다.
        		이때 이미존재하는 replyList에 이벤트를 등록하고 이벤트를 자식에게 전파시켜 사용하는 제이쿼리의 이벤트 위임 함수를 
        		반드시 써야 합니다.(비동기는 순서를 기다리지 않음)
        		*/
        		
        		/* $("#replyList").on("click","a",function(){
        			//1. 수정버튼인지 삭제인지 확인
        			//제이쿼리 this는 자바스크립트 event.target코드와 비슷합니다.
        			event.preventDefault();
        			console.log(event.target)
        			console.log($(this))
        			//모달창 히든태그에 댓글의 번호를 세팅 
        			var rno=$(this).attr("href");
        			$("#modalRno").val(rno);
        			
        			//hasClass는 매개값이 포함되었으면 true 아니면 false를 반환하는 클래스확인 함수입니다.
        			if($(this).hasClass("replyModify")){
        				//수정 모달형식으로 변경
        				$(".modal-title").html("댓글수정");
        				$("#modalReply").css("display","inline");
        				$("#modalModBtn").css("display","inline");
        				$("#modalDelBtn").css("display","none");
        				$("#replyModal").modal("show");
        			}else{
        				//삭제 모달형식으로 변경
        				$(".modal-title").html("댓글삭제");
        				$("#modalReply").css("display","none");
        				$("#modalModBtn").css("display","none");
        				$("#modalDelBtn").css("display","inline");
        				$("#replyModal").modal("show");
        			}
        			
        
        		})
        		 */
        		//수정함수
        		$("#modalModBtn").click(function(){
        			/*
        			1.모달창에 rno값,reply값, replyPw값을 얻습니다.
        			2.ajax 함수를 이용해서 post방식으로 reply/update 요청, 필요한값은 JSON형식으로 처리해서 요청
        			3.서버에서는 요청을 받아서 비밀번호를 확인하고 비밀번호가 맞다면 업데이트를 진행.
        			4.만약 비밀번호가 틀렷다면 0을 반환해서 비밀번호가 틀렷습니다. 경고창을 띄우세요.
        			5.업데이트가 진행된 다음에는 modal장의 값을 공백으로 초기화 시키세요.
        			*/
        			var rno =$("#modalRno").val();
        			var reply = $("#modalReply").val();
        			var replyPw = $("#modalPw").val();
        		        			
        			if(reply===""||rno===""||replyPw===""){
        				alert("내용,비번을 확인하세요");
        				return;
        			}
        			
        			$.ajax({
        				type:"POST", //요청방식
        				url:"../reply/update",
        				data:JSON.stringify({"rno":rno,"reply":reply,"replyPw":replyPw}), //문자열의 형태로 변경해서 요청
        				dataType:"text", //서버로 부터 어떤형식으로 받을건지
        				contentType:"application/json; charset=utf-8", //기본값은 폼형식을 지정하는데 제이슨 형식으로 보낼때는 반드시 타입을 명시해야함 
        			 	success:function(data){ //요청성공시 돌려받을 콜백함수
       						console.log(data)
        			 		if(data==1){	//등록성공
        			 			alert("수정 성공")
        			 			$("#modalReply").val(""); //수정창 비우기
        			 			$("#modalPw").val(""); //비번창 비우기
        			 			$("#replyModal").modal("hide"); //모달창 닫기
        			 			getList(1,true);
        			 		        			 			
        			 		}else{
        			 			alert("비밀번호확인하세요");
        			 			$("#modalPw").val("");
        			 		}
        			 	},
        			 	error :function(status,error){ //에러 발생시 실행시킬 콜백함수
        			 		alert("수정에 실패햇습니다.")
        			 	}
        			        				
        			})
        		})
        		
        		//삭제함수
        		$("#modalDelBtn").click(function(){
        			/*
        			1.모달창에 rno값, replyPw값을 얻습니다.
        			2.ajax 함수를 이용해서 post방식으로 reply/delete 요청, 필요한값은 JSON형식으로 처리해서 요청
        			3.서버에서는 요청을 받아서 비밀번호를 확인하고 비밀번호가 맞다면 삭제를 진행.
        			4.만약 비밀번호가 틀렷다면 0을 반환해서 비밀번호가 틀렷습니다. 경고창을 띄우세요.
        			*/
        			var rno =$("#modalRno").val();
        			var replyPw = $("#modalPw").val();
        			
        			if(replyPw==""){
        				alert("비번을 확인하세요")
        			}
        			
        			$.ajax({
        				type:"POST",
        				url:"../reply/delete",
        				data:JSON.stringify({"rno":rno,"replyPw":replyPw}),
        				dataType:"text",
        				contentType:"application/json; charset=utf-8",
        				success:function(data){
        					console.log(data)
        					if(data==1){
        						alert("삭제 성공")
        						$("#modalPw").val("");
        						$("#replyModal").modal("hide");
        						getList(1,true);
        						
        					}else{
        						alert("비번이 틀렸습니다.")
        						$("#modalPw").val("");
        					}
        				},
        				error:function(status,error){
        					alert("삭제 실패")
        				}
        			})
        			
        		})
        
        		//날짜처리 함수
        		function timeStamp(millis){
        			var date = new Date(); //현재 날짜를 밀리초로 변환 - 등록밀리초= 시간차
        			var gap = date.getTime()-millis ;
         			
        			var time; //리턴할 시간
        			if(gap<1000*60*60*24){//1일 이하인 경우
        				
        				if(gap<1000*60*60){ //1시간 미만인 경우 
        					time="방금전";
        				
        				}else{//1시간 이상인 경우
        					time= parseInt(gap / (1000*60*60))+"시간전";
        				}
        					
        			}else { //1일 이상인 경우
        				
        				var today = new Date(millis);
        				var year = today.getFullYear();
        				var month = today.getMonth()+1;
        				var day = today.getDate();
        				var hour = today.getHours();
        				var minute = today.getMinutes();
        				var second = today.getSeconds();
        				
        				time = year+"년"+month+"월"+day+"일"+hour+":"+minute+":"+second;
        			}
        			
        			return time;
        		}
        		
        	}) //ready 함수 끝
        	
        </script>
        
    <button type="button" data-toggle="modal" data-target="#replyModal">확인</button>        
	<!-- 모달 -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					<h4 class="modal-title">댓글수정</h4>
				</div>
				<div class="modal-body">
					<!-- 수정폼 id값을 확인하세요-->
					<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
					<div class="reply-group">
						<div class="reply-input">
						    <input type="hidden" id="modalRno">
							<input type="password" class="form-control" placeholder="비밀번호" id="modalPw">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
					</div>
					</div>
					<!-- 수정폼끝 -->
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>