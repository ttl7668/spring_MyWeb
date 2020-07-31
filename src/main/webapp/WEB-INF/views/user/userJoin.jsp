<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


	<!--폼 섹션-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    <div class="titlebox">
                       	 회원가입
                    </div>
                    <form action="joinForm" name="joinForm" method="post">
                        <div class="form-group"><!--사용자클래스선언-->
                            <label for="id">아이디</label>
                            <div class="input-group"><!--input2탭의 input-addon을 가져온다 -->
                                <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 (영문포함 4~12자 이상)">
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary" id="idCheckBtn">아이디중복체크</button>
                                </div>
                            </div>
                            <span id="msgId"></span><!--자바스크립트에서 추가-->
                        </div>
                        <div class="form-group"><!--기본 폼그룹을 가져온다-->
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" name="userPw" id="userPw" placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)">
                            <span id="msgPw"></span><!--자바스크립트에서 추가-->
                        </div>
                        <div class="form-group">
                            <label for="password-confrim">비밀번호 확인</label>
                            <input type="password" class="form-control" name="pwConfirm" id="pwConfirm" placeholder="비밀번호를 확인해주세요.">
                             <span id="msgPw-c"></span><!--자바스크립트에서 추가-->
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력하세요.">
                        </div>
                        <!--input2탭의 input-addon을 가져온다 -->
                        <div class="form-group">
                            <label for="hp">휴대폰번호</label>
                            <div class="input-group">
				<select class="form-control phone1" name="userPhone1" id="userPhone1">
					<option>010</option>
					<option>011</option>
					<option>017</option>
					<option>018</option>
				</select> 
				<input type="text" class="form-control phone2" name="userPhone2" id="userPhone2" placeholder="휴대폰번호를 입력하세요.">
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary">본인인증</button>
                                </div>
                            </div>
                        </div>
			<div class="form-group email-form">
			  <label for="email">이메일</label><br>
			  <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일">
			  <select class="form-control" name="userEmail2" id="userEmail2">
			    <option>@naver.com</option>
			    <option>@daum.net</option>
			    <option>@gmail.com</option>
			    <option>@hanmail.com</option>
			    <option>@yahoo.co.kr</option>
			  </select>
			</div>
                        <!--readonly 속성 추가시 자동으로 블락-->
                        <div class="form-group">
                            <label for="addr-num">주소</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="addrZipNum" id="addrZipNum" placeholder="우편번호" readonly>
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary" onclick="goPopup()">주소찾기</button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="addrBasic" id="addrBasic" placeholder="기본주소">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소">
                        </div>

                        <!--button탭에 들어가서 버튼종류를 확인한다-->
                        <div class="form-group">
                            <button type="button" class="btn btn-lg btn-success btn-block" id="joinBtn">회원가입</button>
                        </div>

                        <div class="form-group">
                            <button type="button" class="btn btn-lg btn-info btn-block">로그인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="../include/footer.jsp" %>
    <script>
        /*아이디 형식 검사 스크립트*/
        var id = document.getElementById("userId");
        id.onkeyup = function() {
            /*자바스크립트의 정규표현식 입니다*/
            /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
            var regex = /^[A-Za-z0-9+]{4,12}$/; 
            if(regex.test(document.getElementById("userId").value )) {
                document.getElementById("userId").style.borderColor = "green";
                document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";

            } else {
                document.getElementById("userId").style.borderColor = "red";
                document.getElementById("msgId").innerHTML = "";
            }
        }
        /*비밀번호 형식 검사 스크립트*/
        var pw = document.getElementById("userPw");
        pw.onkeyup = function(){
            var regex = /^[A-Za-z0-9+]{8,16}$/;
             if(regex.test(document.getElementById("userPw").value )) {
                document.getElementById("userPw").style.borderColor = "green";
                document.getElementById("msgPw").innerHTML = "사용가능합니다";
            } else {
                document.getElementById("userPw").style.borderColor = "red";
                document.getElementById("msgPw").innerHTML = "";
            }
        }
        /*비밀번호 확인검사*/
        var pwConfirm = document.getElementById("pwConfirm");
        pwConfirm.onkeyup = function() {
            var regex = /^[A-Za-z0-9+]{8,16}$/;
            if(document.getElementById("pwConfirm").value == document.getElementById("userPw").value ) {
            	pwConfirm.style.borderColor = "green";
                document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
            } else {
                document.getElementById("pwConfirm").style.borderColor = "red";
                document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
            }
        }        
        
        //주소 팝업창
       function goPopup(){
           // 주소검색을 수행할 팝업 페이지를 호출합니다.
           // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
           var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
           
           // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
        }

        function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
        	//팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        	
        	document.getElementById("addrZipNum").value = zipNo;
        	document.getElementById("addrBasic").value=roadAddrPart1;
        	document.getElementById("addrDetail").value=addrDetail;
        	      	
        	  /*               
            document.form.roadAddrPart1.value = roadAddrPart1; //도로명주소
            document.form.addrDetail.value = addrDetail; //고객입력상세주소
            document.form.zipNo.value = zipNo; //우편번호

          document.form.admCd.value = admCd;
            document.form.rnMgtSn.value = rnMgtSn;
            document.form.bdMgtSn.value = bdMgtSn;
            document.form.detBdNmList.value = detBdNmList;
            document.form.bdNm.value = bdNm;
            document.form.bdKdcd.value = bdKdcd;
            document.form.siNm.value = siNm;
            document.form.sggNm.value = sggNm;
            document.form.emdNm.value = emdNm;
            document.form.liNm.value = liNm;
            document.form.rn.value = rn;
            document.form.udrtYn.value = udrtYn;
            document.form.buldMnnm.value = buldMnnm;
            document.form.buldSlno.value = buldSlno;
            document.form.mtYn.value = mtYn;
            document.form.lnbrMnnm.value = lnbrMnnm;
            document.form.lnbrSlno.value = lnbrSlno;
            document.form.emdNo.value = emdNo; 
            */

        }
        
        $("#idCheckBtn").click(function(){
        	console.log($("#userId").css("borderColor"))
        	 if($("#userId").val()=='' || $("#userId").css("borderColor")=="rgb(255, 0, 0)"){
             
        		 alert("아이디규칙을 확인하세요");
        		 return;
        	 }
        	var userId = $("#userId").val();

         	$.ajax({
        		type:"POST",
        		url:"idCheck",
        		data:JSON.stringify({"userId":userId}),
        		contentType:"application/json; charset=utf-8",
        		success:function(data){
        			console.log(data)
        			if(data==1){//있는 아이디
        				alert("중복된 아이디입니다.")
        			}else{
        				alert("사용가능한 아이디입니다")
        				
        			}
        		},
        		error:function(status,error){
        			
        		}
        	}) 
        })
        
        $("#joinBtn").click(function(){
        	if(document.joinForm.userId.value===''){
        		alert("아이디는 필수")
        		document.joinForm.userId.focus();
    			return; 
        	}else if(document.joinForm.userPw.value===''){
        		alert("비번은 필수")
        		document.joinForm.userPw.focus();
        		return;
        	}else if(document.joinForm.userName.value===''){
        		alert("이름은 필수")
        		document.joinForm.userName.focus();
        		return;
        	}else if(document.joinForm.userEmail1.value===''){
        		alert("이메일 필수")
        		document.joinForm.userEmail1.focus();
        		return;
        	}else if(document.joinForm.addrZipNum.value===''){
        		alert("우편번호필수")
        		document.joinForm.addrZipNum.focus();
        		return;
        	}else{
        		document.joinForm.submit();
        	}
        	
        	/*
        	var userId = $("#userId") //컨트롤러에서 넘어온 게시글 번호
    		var userPw = $("#userId").val();//reply 태그값
    		var userName = $("#userName").val();//replyId 태그값
    		var userPhone1 = $("#userPhone1").val();
    		
        	
        	$.ajax({
        		type:"POST",
        		url:"joinForm",
        		data:JSON.stringify({"userId":userId,
        							 "userPw":userPw,
        							 "userName":userName,
        							 "userPhone1":userPhone1,
        							 "userPhone2":userPhone2,
        							 "userEmail1":userEmail1,
        							 "userEmail2":userEmail2,
        							 "addrZipNum":addrZipNum,
        							 "addrBasic":addrBasic,
        							 "addrDetail":addrDetail
        							 }),
        		contentType:"application/json; charset=utf-8",
        		success:function(data){
        			console.log(data)
        			if(data==1){
        				
        			}else{
        				
        				
        			}
        		},
        		error:function(status,error){
        			
        		}
        	}) 
        	 */
        })
    </script>
</body>
</html>