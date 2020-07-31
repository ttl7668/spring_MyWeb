<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 폼을 이용한 업로드 enctype선언 -->
	<!-- 단일파일 -->
	<form action="upload_ok" enctype="multipart/form-data" method="post">
		파일선택:<input type="file" name="file"><br>
		<input type="submit" value="업로드">
	</form>
	<hr/>
	<!-- 다중파일업로드:multiple속성 -->
	<form action = "upload_ok2" enctype="multipart/form-data" method="post">
		파일선택:<input type="file" name="file" multiple="multiple"><br>
		<input type="submit" value="업로드">
	</form>
	<hr/>
	<!-- 복수태그를 사용한 여러파일 -->
	<form action="upload_ok3" enctype="multipart/form-data" method="post">
		파일선택:<input type="file" name="file"><br>
		파일선택:<input type="file" name="file"><br>
		파일선택:<input type="file" name="file"><br>
		<input type="submit" value="업로드">
	</form>
</body>
</html>