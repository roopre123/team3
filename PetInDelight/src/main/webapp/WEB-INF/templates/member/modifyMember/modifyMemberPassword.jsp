<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pid.members.service.MembersVO"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
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
#wrap{
  display: flex;
  justify-content: center;
  align-items:center;
  min-height: 100vh;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">	
	$(function(){
		$('#newPassword').keyup(function(){
    	  	$('#memberCheckPassword').html('');
		});
			$('#memberCheckPassword').keyup(function(){
    		if($('#newPassword').val() != $('#memberCheckPassword').val()){
	   		 	$('#password_check').html('비밀번호 일치하지 않음<br>');
        		$('#password_check').attr('color', '#f82a2aa3');		        	
        	} else{
          		$('#password_check').html('비밀번호 일치함<br>');
	      		$('#password_check').attr('color', '#199894b3');
        	}
		});
	});
	function modifyMemberPassword() {
		var id = $('#memberId').val();
		var memberPw = $('#memberPassword').val();
		var nowPw = $('#nowPassword').val();		
		
		var newPw = $('#newPassword').val();
		var checkPw = $('#memberCheckPassword').val();		
		if(memberPw != nowPw) {
			alert("현재 비밀번호가 틀립니다.")
		} else if(newPw != checkPw){
			alert("비밀번호가 일치하지 않습니다.")
		} else {			
			$.ajax({
				url: 'modifyMemberPassword.do',
				type: 'POST',
				data: {
					memberId: id,
					memberPassword: newPw,
					memberCheckPassword: checkPw					
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("수정성공")
						opener.parent.location="http://localhost:8080/PetInDeligth/modifyMember.do";
						self.close();
					}
				}
				
			})
		}
	}
	
	function cancel() {
		opener.parent.location="http://localhost:8080/PetInDeligth/modifyMember.do";
		self.close();
	}
</script>
<title>비밀번호 변경</title>
</head>
<body>
<% String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
	
	//MembersVO memberSession = (MembersVO) session.getAttribute("SessionMember");	
%>
<div class="container" style="width:500px">  
	<div class="page-header">
		<h1>비밀번호 변경</h1>
	</div>
</div>
<div class="container" style="width:500px">
	<input type="hidden" id="memberId" name="memberId" value="${SessionMember.getMemberId()}"/>
	<input type="hidden" id="memberPassword" name="memberPassword" value="${SessionMember.getMemberPassword()}"/>
	<div class="container" align="center">
 		<div class="form-group" align="left">
			<label for="nowPassword">현재 비밀번호</label><br>
        	<input type="password" id="nowPassword" name="nowPassword" placeholder="현재 비밀번호">
		</div>
		<div class="form-group" align="left">
			<label for="newPassword">새 비밀번호</label><br>
			<input type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호">
		</div>
        
		<div class="form-group" align="left">
			<label for="memberCheckPassword">새 비밀번호 확인</label><br>
			<input type="password" id="memberCheckPassword" name="memberCheckPassword" placeholder="새 비밀번호 확인"><br>
			<font id="password_check" size="2"></font>
		</div>
		<br><br>
		<div class="pull-right">
			<input type="button" class="btn" id="modifyMemberPassword" onclick="modifyMemberPassword()" value="변경하기"/>
			<input type="button" class="btn" onclick="cancel()" value="취소"/>
		</div>
	</div>
</div>
</body>
</html>