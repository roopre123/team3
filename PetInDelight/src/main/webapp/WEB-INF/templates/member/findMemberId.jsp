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
	function findMemberId() {
		var name = $('#memberName').val();
		var resident = $('#memberFirstResident').val() + $('#memberLastResident').val();
		var telnumber = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		
		if(name == "") {
			alert("이름을 입력해 주세요.")
		} else if($('#memberFirstResident').val().length < 6 || $('#memberLastResident').val() == "") {
			alert("주민등록번호 형식이 맞지 않습니다.")
		} else if($('#memberMiddleNumber').val()== "" || $('#memberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#memberMiddleNumber').val().length < 4 || $('#memberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else {
			$.ajax({
				url: 'findMemberId.do',
				type: 'POST',
				data: {					
					memberName:name,					
					memberResident:resident,					
					memberTelNumber:telnumber
				},
				datatype: 'JSON',
				success: function (data) {
					if(data == "ok") {
						alert("인증 성공!");
						location="findMember.do";
					} else if (data == "no"){
						alert("일치하는정보가 없습니다.")
					}
				}
			})
		}
	}
</script>
<title>아이디 찾기</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container" style="width:500px">
	<div class="page-header" >
		<h1>아이디 찾기</h1> 
	</div>
</div>
<div class="container" style="width:500px">
	<div class="container" style="width:350px">
		<div class="form-group">
			<label for="memberName">이름</label><br>
			<input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요" >
		</div>
	    <div class="form-group">
			<label for="memberResident">주민등록번호</label><br>
			 <input type="text" style="width:55px" maxlength="6" id="memberFirstResident" name="memberFirstResident" placeholder="000000" required>
	         -
	         <input type="text" style="width:20px" maxlength="1" id="memberLastResident" name="memberLastResident" placeholder="0" required>
	         ●●●●●●
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
	            <input type="text" style="width:40px" maxlength="4" id="memberMiddleNumber" name="memberMiddleNumber" placeholder="0000" required>
	            -
	            <input type="text" style="width:40px" maxlength="4" id="memberLastNumber" name="memberLastNumber" placeholder="0000" required>
		</div>
		<div class="pull-right">
			<input type="button" id="findMemberId" class="btn" onclick="findMemberId()" value="아이디찾기"/>
		</div>
	</div>
</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>