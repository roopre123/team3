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
.lab{
	display: flex;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function unSignUpMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(id == ""){
			alert("아이디를 입력해주세요.")
		} else if(pw == ""){
			alert("비밀번호를 입력해주세요.")
		} else {
			$.ajax({
				url: 'unSignUpMember.do',
				type: 'POST',
				data: {
					memberId:id,
					memberPassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert("회원 탈퇴 성공");
						location.href = 'login.do';
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})
		}			
	}
</script>
<title>회원 탈퇴</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container" style="width:500px">
	<div class="page-header">
		<h1>회원 탈퇴</h1>
	</div>
</div>
<div class="container" style="width:500px"> 
	<div class="container" style="width:350px">  
        <div class="form-group">
            <label for="memberId" class="lab">아이디</label><br>
            <input type="text" id="memberId" name="memberId" placeholder="사용자 아이디">
        </div>       
       	 <div class="form-group">
            <label for="memberPassword" class="lab">비밀번호</label><br>
            <input type="text" id="memberPassword" name="memberPassword" placeholder="사용자 비밀번호">
        </div>
        <div class="form-group" align="center">
        	<button type="button" id="unSignUpMember" class="btn" onclick="unSignUpMember()">회원 탈퇴</button>
        	<button type="button"class="btn"  onclick="location.href='selectMember.do'">뒤로 가기</button>
        </div>
	</div>
</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>
