<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<!DOCTYPE html>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
%>
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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function loginMember() {
		var id = $('#memberId').val();
		var pw = $('#memberPassword').val();
		if(pw == ""){
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
						alert("확인되셨습니다.");
						location="modifyMember.do";
					} else {
						alert("비밀번호를 확인해 주세요.");
					}
				}
			})			
		}		
	}
</script>
<title>수정 로그인</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container" style="width:500px">
	<div class="page-header">
		<h1>수정화면 로그인</h1>
	</div>
</div>
<input type="hidden" id="memberId" name="memberId" value="${SessionMemberId}">
<div class="container" style="width:500px">
	<table class="table" border="2">
		<tr>
			<th style="padding:13px 0 0 15px" width="100"><label for="memberPassword">비밀번호</label></th>
			<td align="left"><input type="password" width="400" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력해주세요" ></td>
		</tr>
	</table>
	<div align="center">	
		<div class="pull-left">
			<input type="button" class="btn" onclick="location='main.do'" value="메인으로"/>
		</div>
		<div class="pull-right">
			<input type="button" class="btn" onclick="loginMember()" value="확인"/>
		</div>
	</div>
</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>