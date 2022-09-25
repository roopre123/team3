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
	function modifyMemberNickname_check() {
		var nowNick = $('#nowNickname').val();
		var newNick = $('#newNickname').val();	
		if(nowNick == newNick){
			alert("사용할 수 있는 닉네임입니다.");
			$('#nickname_check').html('사용가능한 닉네임 입니다.<br>');
    	  	$('#nickname_check').attr('color', '#199894b3');
		} else if(newNick == ""){
			alert("변경하실 닉네임을 적어주세요 .")			
		} else {
			$.ajax({
				url: 'modifyMemberNickname_check.do',
				type: 'POST',
				data: {memberNickname:newNick},
				datatype: 'JSON',
				success: function (data) {
					if(data == "ok"){
						alert("사용할 수 있는 닉네임입니다.");
						$('#nickname_check').html('사용가능한 닉네임 입니다.<br>');
	    	    	  	$('#nickname_check').attr('color', '#199894b3');
					} else if(data == "no"){
						alert("중복된 닉네임이 존재합니다.");
						$('#nickname_check').html('중복된 닉네임이 존재합니다.<br>');
	    	    	  	$('#nickname_check').attr('color', '#f82a2aa3');  
					}
				}
			})
		}
	}
	
	function modifyMemberNickname() {
		var id = $('#memberId').val();
		var nowNick = $('#nowNickname').val();
		var newNick = $('#newNickname').val();	
		var newNick = $('#newNickname').val();
		if(newNick == "") {
			alert("변경하실 닉네임을 적어주세요.")
		} else {
			$.ajax({
				url: 'modifyMemberNickname.do',
				type: 'POST',
				data: {
					memberId: id,
					memberNickname:newNick
					},
				datatype: 'JSON',
				success: function (data) {
					if(data == "ok"){
						alert("닉네임 변경 성공");
						opener.parent.location="http://localhost:8080/PetInDeligth/modifyMember.do";
						self.close();
					} else if(data == "no"){
						alert("중복된 닉네임이 존재합니다.\n다시 확인해주세요");						  
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
<title>닉네임 변경 페이지</title>
</head>
<body>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
	
	MembersVO memberSession = (MembersVO) session.getAttribute("SessionMember");	
%>
<div class="container" style="width:500px">  
	<div class="page-header">
		<h1>닉네임 변경</h1>
	</div>
</div>
<div class="container" style="width:500px">
	<input type="hidden" id="memberId" name="memberId" value="${SessionMember.getMemberId()}"/>
	<div class="container" align="center">	
		<div class="form-group" align="left">
    		<label for="nowNickname">현재 닉네임</label><br>
			<input type="text" id="nowNickname" name="nowNickname" readonly="readonly" value="${SessionMember.getMemberNickname()}"/>
		</div>
		<div class="form-group" align="left">
	    	<label for="newNickname">변경 하실 닉네임</label><br>
    	    <input type="text" id="newNickname" name="newNickname" placeholder="닉네임을 입력하세요"/>
    	    <input type="button" class="btn" onclick="modifyMemberNickname_check()" value="닉네임 중복 체크"/><br>
    	    <font id="nickname_check" size="2"></font>
		</div>
		<br><br>
		<div class="pull-right">
			<input type="button" class="btn" id="modifyMemberNickname" onclick="modifyMemberNickname()" value="변경하기"/>
			<input type="button" class="btn" onclick="cancel()" value="취소"/>
		</div>
	</div>
</div>
</body>
</html>