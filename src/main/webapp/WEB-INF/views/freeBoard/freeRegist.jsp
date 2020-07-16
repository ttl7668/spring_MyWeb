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

	<!--게시판-->
    <section>
       <div class="container">
            <div class="row">
                <div class="col-xs-12 content-wrap">
                    <div class="titlebox">
                        <p>자유게시판</p>
                    </div>
                    
                    <form action="registForm" name="registForm" method="post">
                    <table class="table">
                        <tbody class="t-control">
                            <tr>
                                <td class="t-title">NAME</td>
                                <td><input class="form-control input-sm" name="writer"></td>
                            </tr>
                            <tr>
                                <td class="t-title">TITLE</td>
                                <td><input class="form-control input-sm" name="title"></td>
                            </tr>
                            <tr>
                                <td class="t-title">COMMNET</td>
                                <td>
                                <textarea class="form-control" rows="7" name="content"></textarea>
                                </td>                 
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="titlefoot">
                        <button class="btn" id="registBtn">등록</button>
                        <button class="btn" onclick="location.href='freeList'">목록</button>
                    </div>
                    </form>
                </div>
            </div>    
       </div>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    	var registBtn = document.getElementById("registBtn");
    	registBtn.onclick=function(){
    		//form태그는 docunment.name 으로 접근 
    		if(document.registForm.writer.value===''){
    			alert("이름을입력하세요")
    			document.registForm.writer.focus();
    			return; //강제종료
    		}else if(document.registForm.title.value===''){
    			alert("제목을입력하세요")
    			document.registForm.title.focus();
    			return; //강제종료
    		}else if(document.registForm.content.value===''){
    			alert("내용을입력하세요")
    			document.registForm.content.focus();
    			return; //강제종료
    		}else{
    			document.registForm.submit();
    		}
    	}
    </script>
    
</body>
</html>