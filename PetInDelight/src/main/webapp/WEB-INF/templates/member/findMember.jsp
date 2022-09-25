<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<style>
.btn{
	background-color: #FFA500;
	color: white;
}
.btn:hover{
	background-color: #FFA500;
	color: white;
}
html {
height: 100%;
}
body {
margin: 0;
height: 100%;
}
.a {
min-height: 100%;
}
</style>
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container" style="width:500px">
	<div class="page-header">
		<h1>아이디 / 비밀번호 찾기</h1>		
	</div>
</div>
<div class="container" style="width:500px">
	<div class="container" style="width:350px">
		<label for="findId">고객님의 정보와 일치하는 아이디 목록입니다.</label><br><br><br><br>
		<h3>${findById}</h3>
	</div>
	<br><br><br><br>
	<div align="center">
		<input type="button" class="btn" onclick="location.href='modifylogin.do'" value="로그인하러가기">
		<input type="button" class="btn" onclick="location.href='findMemberPassword.do'" value="비밀번호찾기"/>
	</div>
</div>
<br>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>