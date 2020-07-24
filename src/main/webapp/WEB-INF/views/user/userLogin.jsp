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

    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7 col-xs-10 login-form">
                    <div class="titlebox">
                        로그인
                    </div>
                    <form action="loginForm" name="loginForm" method="post">
                        <div class="form-group"><!--사용자클래스선언-->
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디">
                         </div>
                         <div class="form-group"><!--사용자클래스선언-->
                            <label for="id">비밀번호</label>
                            <input type="password" class="form-control" name="userPw" id="userPw" placeholder="비밀번호">
                         </div>
                         <div class="form-group">
                            <button type="button" class="btn btn-info btn-block" id="loginBtn">로그인</button>
                            <button type="button" class="btn btn-primary btn-block" id="joinBtn">회원가입</button>
                         </div>
                    </form>                
                </div>
            </div>
        </div>
    </section>
    <%@ include file="../include/footer.jsp" %>

	<script>
	
	$("#loginBtn").click(function(){
		
		 if($("#userId").val() == ''){
				alert("아이디입력하시오 ");
				$("#userId").focus();
			return;
			 }else if($("#userPw").val() == ''){
					alert("비번입력하시오");
					$("#userPw").focus();
				return;
			 }else{
				 document.loginForm.submit();
				 alert(msg)
			 }
	})
 	
	
	
	$("#joinBtn").click(function(){
			
		location.href="userJoin";
	})
	
	
					
		
	</script>
</body>
</html>