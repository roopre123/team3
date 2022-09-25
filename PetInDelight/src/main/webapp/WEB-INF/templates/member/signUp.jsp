<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
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
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function memberId_check() {
		var id = $('#memberId').val();
		if(id == ""){
			alert("아이디를 입력해주세요.")
		} else {
			$.ajax({
				url: 'memberId_check.do',
				type: 'POST',
				data: {memberId:id},
				datatype: 'JSON',
				success: function (data) {
					if(data == 0){
						alert("사용할 수 있는 아이디입니다.");
						$('#id_check').html('사용할 수 있는 아이디입니다.');
		    	      	$('#id_check').attr('color', '#199894b3');  
					} else {
						alert("중복된 아이디가 존재합니다.");
						$('#id_check').html('중복된 아이디가 존재합니다.');
		    	      	$('#id_check').attr('color', '#FF0000');  
					}
				}
			})
		}
		}
	
	function memberNickname_check() {
		var nickname = $('#memberNickname').val();
		if(nickname == ""){
			alert("닉네임을 입력해주세요.")
		} else {
			$.ajax({
				url: 'memberNickname_check.do',
				type: 'POST',
				data: {memberNickname:nickname},
				datatype: 'JSON',
				success: function (data) {
					if(data == 0){
						alert("사용할 수 있는 닉네임입니다.");
						$('#nickname_check').html('사용할 수 있는 닉네임 입니다.');
		    	      	$('#nickname_check').attr('color', '#199894b3');  
					} else {
						alert("중복된 닉네임이 존재합니다.");
						$('#nickname_check').html('중복된 닉네임이 존재합니다.');
		    	      	$('#nickname_check').attr('color', '#FF0000');  
					}
				}
			})
		}
	}
	
	$(function(){
    	$('#memberPassword').keyup(function(){
	      	$('#password_check').html('');
    	});
   		$('#memberCheckPassword').keyup(function(){
        	if($('#memberPassword').val() != $('#memberCheckPassword').val()){
		    	$('#password_check').html('비밀번호 일치하지 않음<br>');
	        	$('#password_check').attr('color', '#FF0000');	
	        } else{
	          	$('#password_check').html('비밀번호 일치함<br>');
    	      	$('#password_check').attr('color', '#199894b3');    	      
	        }
    	});
	});
	
	function memberTelNumber_check() {
		var telnumber = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		if($('#memberMiddleNumber').val()== "" || $('#memberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#memberMiddleNumber').val().length < 4 || $('#memberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else {
			$.ajax({
				url: 'memberTelNumber_check.do',
				type: 'POST',
				data: {memberTelNumber:telnumber},
				datatype: 'JSON',
				success: function (data) {
					if(data == 0){
						alert("사용할 수 있는 전화번호 입니다.");
						$('#telNumber_check').html('사용 가능한 전화번호 입니다.<br>');
		    	      	$('#telNumber_check').attr('color', '#199894b3');  
					} else {
						alert("중복된 전화번호 입니다.");
						$('#telNumber_check').html('중복된 전화번호가 존재합니다.<br>');
		    	      	$('#telNumber_check').attr('color', '#FF0000');  
					}
				}
			})
		}
	}	
	
	function signUpMember() {		
		var id = $('#memberId').val();
		var password = $('#memberPassword').val();
		var checkpassword = $('#memberCheckPassword').val();
		var name = $('#memberName').val();
		var nickname = $('#memberNickname').val();
		var resident = $('#memberFirstResident').val() + $('#memberLastResident').val();
		var address = $('#memberAddress').val();
		var telnumber = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		if(id==""){
			alert("아이디를 입력해주세요")
		} else if(password ==""){
			alert("비밀번호를 입력해주세요")
		} else if(checkpassword == "") {
			alert("비밀번호 확인이 필요합니다.")
		} else if(name == "") {
			alert("이름을 입력해주세요")
		} else if(nickname==""){
			alert("닉네임을 입력해주세요")
		} else if(resident==""){
			alert("주민등록번호를 입력해주세요")
		} else if(address == "") {
			alert("주소를 입력해 주세요")
		} else if(telnumber == ""){
			alert("전화번호를 입력해 주세요.")
		} else if(password != checkpassword) {
			alert("비밀번호가 일치하지 않습니다.")
		} else if($('#memberFirstResident').val().length < 6 || $('#memberLastResident').val() == "") {
			alert("주민등록번호 형식이 맞지 않습니다.")
		} else if($('#memberMiddleNumber').val()== "" || $('#memberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#memberMiddleNumber').val().length < 4 || $('#memberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else {
			$.ajax({
				url: 'signUpMember.do',
				type: 'POST',
				data: {
					memberId:id,
					memberPassword:password,
					memberCheckPassword:checkpassword,
					memberName:name,
					memberNickname:nickname,
					memberResident:resident,
					memberAddress:address,
					memberTelNumber:telnumber
				},
				datatype: 'JSON',
				success: function (data) {
					if(data == "id"){
						alert("아이디 중복체크가 필요합니다.");
					} else if(data == "nick") {
						alert("닉네임 중복체크가 필요합니다.");
					} else if(data == "tel"){
						alert("전화번호가 중복됩니다.");
					} else if(data == "ok") {
						alert("회원 가입 성공!");
						location='login.do'
					}
				}
			})		
		}
	}
</script>
<title>회원가입</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container" style="width:600px">
	<div class="page-header">
		<h1>회원가입</h1>
	</div>
</div>

<div class="container" style="width:600px">
	<div class="container" style="width:600px">	
        <div class="form-group">
            <label for="memberId">아이디</label><br>
            <input type="text" id="memberId" name="memberId" placeholder="사용자 아이디">
            <input type="button" class="btn" onclick="memberId_check()" value="아이디 중복 체크"/><span></span><font id="id_check" size="2"></font>
        </div>

        <div class="form-group">
            <label for="memberPassword">비밀번호</label><br>
            <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호">
        </div>
        
        <div class="form-group">
            <label for="memberCheckPassword">비밀번호확인</label><br>
            <input type="password" id="memberCheckPassword" name="memberCheckPassword" placeholder="비밀번호 확인"><span></span><font id="password_check" size="2"></font>
        </div>
               
        <div class="form-group">
            <label for="memberName">이름</label><br>
            <input type="text" id="memberName" name="memberName" placeholder="사용자 이름">
        </div>
       	<div class="form-group">
            <label for="memberNickname">닉네임</label><br>
            <input type="text" id="memberNickname" name="memberNickname" placeholder="닉네임">
            <input type="button" class="btn" onclick="memberNickname_check()" value="닉네임 중복 체크"/><font id="nickname_check" size="2"></font>
        </div>
        <div class="form-group">
            <label for="memberFirstResident">주민등록번호</label><br>
            <input type="text" style="width:60px" maxlength="6" id="memberFirstResident" name="memberFirstResident" placeholder="000000">
            -
            <input type="text" style="width:20px" maxlength="1" id="memberLastResident" name="memberLastResident" placeholder="0">
            ●●●●●●
        </div>
        <div class="form-group">
            <label for="memberAddress">주소</label><br>
            <input type="text" id="memberAddress" name="memberAddress" placeholder="주소">
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
            <input type="button" class="btn" onclick="memberTelNumber_check()" value="전화번호 중복 체크"/><font id="telNumber_check" size="2"></font>
        </div>
        <br>
        <div class="pull-right">
        	<input type="button" class="btn" id="signUpMember" onclick="signUpMember()" value="회원가입"/>
        	<button type="button" class="btn" onclick="location.href='login.do'">뒤로 가기</button>
        </div>
    </div>
</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>