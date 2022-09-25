<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
#wrap{
  display: flex;
  justify-content: center;
  align-items:center;
  min-height: 100vh;
}
.lab{
	display: flex;
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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function loginMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(id == "") {
			alert("아이디를 입력해주세요.")
		} else if(pw == ""){
			alert("비밀번호를 입력해주세요.")
		} else {
			$.ajax({
				url: 'loginMember.do',
				type: 'POST',
				data: {
					memberId:id,
					memberPassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert(id + "님 로그인성공!");
						location="main.do";
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})
		}		
	}
	
	function loginEmployee() {
		var id = $('#employeeId').val();
		var pw = $('#employeePassword').val();
		if(id == ""){
			alert("아이디를 입력해 주세요.")
		} else if(pw == "") {
			alert("비밀번호를 입력해 주세요.")
		} else {
			$.ajax({
				url: 'loginEmployee.do',
				type: 'POST',
				data: {
					employeeId:id,
					employeePassword:pw
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == 1){
						alert(id + "님 로그인성공!");
						location="main.do";
					} else {
						alert("아이디나 비밀번호를 확인해 주세요.");
					}
				}
			})			
		}
	}
</script>
<title>로그인</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="a">
<div class="container" id="wrap">
	<div align="center">
		<img src="${pageContext.request.contextPath}/resource/img/petindelight.png" style="width:300px">
		<br><br><br><br>
		<div class="container" align="center">
		<div class="form-group" style="width:300px">
           <label for="memberId" class="lab">아이디</label>
           <input type="text" id="memberId" class="form-control" style="width:300px" name="memberId" placeholder="아이디 입력해주세요" >          
		</div>
		<div class="form-group" style="width:300px">
           <label for="memberPassword" class="lab">비밀번호</label>
           <input type="password" id="memberPassword" class="form-control" style="width:300px" name="memberPassword" placeholder="비밀번호 입력해주세요" >
        </div>
  		<div class="from-group" align="center">
  		   	<input type="button" class="btn" onclick="loginMember()" value="로그인"/>
       		<button type="button" class="btn" onclick="location.href='signUp.do'">회원 가입</button><br><br>
        </div>
        <div class="from-group" align="center">
       		<a href="findMemberId.do">아이디 찾기</a> / <a href="findMemberPassword.do">비밀번호 찾기</a>
        </div>
        </div>
	</div>
</div>
</div>       
<div id="footer" align="center">
<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>