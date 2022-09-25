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
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
		$('#newPassword1').keyup(function(){
		  	$('#memberCheckPassword1').html('');
		});
		$('#memberCheckPassword1').keyup(function(){
			if($('#newPassword1').val() != $('#memberCheckPassword1').val()){
   			 	$('#password_check1').html('비밀번호 일치하지 않음<br>');
    			$('#password_check1').attr('color', '#f82a2aa3');		        	
    		} else {
      			$('#password_check1').html('비밀번호 일치함<br>');
      			$('#password_check1').attr('color', '#199894b3');
    		}
		});
	});
	$(function(){
		$('#newPassword2').keyup(function(){
		  	$('#memberCheckPassword2').html('');
		});
		$('#memberCheckPassword2').keyup(function(){
			if($('#newPassword2').val() != $('#memberCheckPassword2').val()){
   			 	$('#password_check2').html('비밀번호 일치하지 않음<br>');
    			$('#password_check2').attr('color', '#f82a2aa3');		        	
    		} else {
      			$('#password_check2').html('비밀번호 일치함<br>');
      			$('#password_check2').attr('color', '#199894b3');
    		}
		});
	});
	
	function findMemberPassword1() {
		var id = $('#memberId1').val();		
		var newPw = $('#newPassword1').val();
		var checkPw = $('#memberCheckPassword1').val();		
		if(newPw == ""){
			alert("새 비밀번호를 입력해주세요")
		} else if(checkPw == "") {
			alert("새 비밀번호 확인이 필요합니다.")
		} else if(newPw != checkPw){
			alert("새 비밀번호가 일치하지 않습니다.")
		} else {			
			$.ajax({
				url: 'findMemberPassword1.do',
				type: 'POST',
				data: {
					memberId: id,
					memberPassword: newPw,
					memberCheckPassword: checkPw					
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("비밀번호가 변경되었습니다.\n변경된 비밀번호로 로그인해 주세요.")
						location = "modifylogin.do";
					} else if(data == "no"){
						alert("정보를 다시 확인해 주세요.")
					}
				}				
			})
		}
	}
	
	function findMemberPassword2() {
		var id = $('#memberId2').val();
		var memberTelNum = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		var newPw = $('#newPassword2').val();
		var checkPw = $('#memberCheckPassword2').val();		
		
		if(id==""){
			alert("아이디를 입력해주세요")
		} else if($('#memberMiddleNumber').val()== "" || $('#memberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#memberMiddleNumber').val().length < 4 || $('#memberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else if(newPw ==""){
			alert("새 비밀번호를 입력해주세요")
		} else if(checkPw == "") {
			alert("새 비밀번호 확인이 필요합니다.")
		} else if(newPw != checkPw){
			alert("새 비밀번호가 일치하지 않습니다.")
		} else {			
			$.ajax({
				url: 'findMemberPassword2.do',
				type: 'POST',
				data: {
					memberId: id,
					memberTelNumber:memberTelNum,
					memberPassword: newPw,
					memberCheckPassword: checkPw					
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("비밀번호가 변경되었습니다.\n변경된 비밀번호로 로그인해 주세요.")
						location = "modifylogin.do";
					} else if(data == "no"){
						alert("일치하는 정보가 없습니다.\n정보를 다시 확인해 주세요.")
					}
				}				
			})
		}
	}
</script>
<title>비밀번호 찾기 페이지</title>
</head>
<body>
<% 		
	String findById = (String) session.getAttribute("findById");	
%>

<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container" style="width:500px">
	<div class="page-header">
		<h1>비밀번호 찾기 페이지</h1>
	</div>
</div>
	<% if(findById != null) { %>
	<div class="container" style="width:500px">
		<div class="container" style="width:350px">
			<div class="form-group">
		        <label for="memberId1">아이디</label><br>
		        <input type="text" readonly="readonly" id="memberId1" name="memberId1" value="${findById}">
		    </div>
			
		    <div class="form-group">
		        <label for="newPassword1">새 비밀번호</label><br>
		        <input type="password" id="newPassword1" name="newPassword1" placeholder="새 비밀번호">
		    </div>
		        
		    <div class="form-group">
		        <label for="memberCheckPassword1">새 비밀번호 확인</label><br>
		        <input type="password" id="memberCheckPassword1" name="memberCheckPassword1" placeholder="새 비밀번호 확인">
		        <br>
		        <font id="password_check1" size="2"></font>
		    </div>
		    <div class="pull-right">
		    	<input type="button" class="btn" id="findMemberPassword1" onclick="findMemberPassword1()" value="변경하기"/>
		    </div>
	    </div>
	</div>
	<% } else { %>
	<div class="container" style="width:500px">
		<div class="container" style="width:350px">
			<div class="form-group">
		            <label for="memberId2">아이디</label><br>
		            <input type="text" id="memberId2" name="memberId2" placeholder="사용자 아이디">
		    </div>
		    
		    <div class="form-group">
		        <label for="memberFirstNumber">전화번호</label><br>
		        <select id="memberFirstNumber" name="memberFirstNumber">
		        	<option value="010">010</option>
		            <option value="011">011</option>
		            <option value="016">016</option>
		            <option value="017">017</option>
		            <option value="019">019</option>
		        </select>
		        -
		        <input type="text" style="width:40px" maxlength="4" id="memberMiddleNumber" name="memberMiddleNumber" placeholder="0000">
		        -
		        <input type="text" style="width:40px" maxlength="4" id="memberLastNumber" name="memberLastNumber" placeholder="0000">
		    </div>
		    
			<div class="form-group">
		        <label for="newPassword2">새 비밀번호</label><br>
		        <input type="password" id="newPassword2" name="newPassword2" placeholder="새 비밀번호">
		    </div>
		        
		    <div class="form-group">
		        <label for="memberCheckPassword2">새 비밀번호 확인</label><br>
		        <input type="password" id="memberCheckPassword2" name="memberCheckPassword2" placeholder="새 비밀번호 확인">
		        <br>
		        <font id="password_check2" size="2"></font>
		    </div>
		    <div class="pull-right">
		    	<input type="button" class="btn" id="findMemberPassword2" onclick="findMemberPassword2()" value="변경하기"/>
		    </div>
		</div>
	</div>
		    
	<% } %>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>