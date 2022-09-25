<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
	function memberTelNumber_check_self() {
		var memberTel = $('#memberTelNumber').val();
		var memberTelWrite = $('#memberFirstNumber').val() + $('#memberMiddleNumber').val() + $('#memberLastNumber').val();
		
		if(memberTel != memberTelWrite){
			alert("전화번호를 확인해주세요")
			$('#newMemberFirstNumber').attr("disabled", "disabled");
			$('#newMemberMiddleNumber').attr("disabled", "disabled");
			$('#newMemberLastNumber').attr("disabled", "disabled");
			$('#memberTelNumber_check').attr("disabled", "disabled");
		} else {
			alert("전화번호 인증 성공")
			$('#newMemberFirstNumber').removeAttr("disabled");
			$('#newMemberMiddleNumber').removeAttr("disabled");
			$('#newMemberLastNumber').removeAttr("disabled");
			$('#memberTelNumber_check').removeAttr("disabled");
			
	
		}
	}
	
	function memberTelNumber_check() {
		var memberTel = $('#memberTelNumber').val();
		var memberTelNum = $('#newMemberFirstNumber').val() + $('#newMemberMiddleNumber').val() + $('#newMemberLastNumber').val();
		if(memberTel == memberTelNum) {
			alert("사용가능한 전화번호 입니다.")
		} else if($('#newMemberMiddleNumber').val()== "" || $('#newMemberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#newMemberMiddleNumber').val().length < 4 || $('#newMemberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else {
			$.ajax({
				url: 'memberTelNumber_check.do',
				type: 'POST',
				data: {memberTelNumber:memberTelNum},
				datatype: 'JSON',
				success: function (data) {
					if(data == 0){
						alert("사용할 수 있는 전화번호 입니다.");
						$('#telNumber_check').html('사용할 수 있는 전화번호입니다.<br>');
		    	      	$('#telNumber_check').attr('color', '#199894b3');  
					} else {
						alert("중복된 전화번호 입니다.");
					}
				}
			})
		}
		
	}
	
	function modifyMemberTelNumber() {
		var id = $('#memberId').val();
		var memberTelNum = $('#newMemberFirstNumber').val() + $('#newMemberMiddleNumber').val() + $('#newMemberLastNumber').val();
		if($('#newMemberMiddleNumber').val()== "" || $('#newMemberLastNumber').val() == ""){
			alert("전화번호에 빈칸이 존재합니다.\n확인해주세요.")
		} else if ($('#newMemberMiddleNumber').val().length < 4 || $('#newMemberLastNumber').val().length < 4){
			alert("전화번호 형식이 맞지않습니다.")
		} else {
			$.ajax({
				url: 'modifyMemberTelNumber.do',
				type: 'POST',
				data: {
					memberId: id,
					memberTelNumber: memberTelNum
				},
				datatype: 'JSON',
				success: function(data) {
					if(data == "ok"){
						alert("수정성공")
						opener.parent.location="http://localhost:8080/PetInDeligth/modifyMember.do";
						self.close();
					} else if(data == "no") {
						alert("전화번호 중복체크를 확인해 주세요 .")
					}
				}
				
			})			
		}
	}
</script>
<title>전화번호 수정 페이지</title>
</head>
<body>
<div class="container" style="width:500px">
	<div class="page-header">
		<h1>전화번호 수정 페이지</h1>
	</div>
</div>
<div class="container" style="width:500px">
	<input type="hidden" id="memberId" name="memberId" value="${SessionMember.getMemberId()}"/>
	<input type="hidden" id="memberTelNumber" name="memberTelNumber" value="${SessionMember.getMemberTelNumber()}"/>
	<div class="container" align="center">	
	 	<div class="form-group" align="left">
	 		<c:set var="telnumber" value="${SessionMember.getMemberTelNumber()}"/>
	       	<c:set var="FirstNumber" value="${fn:substring(telnumber,0,3)}"/>
	       	<c:set var="MiddleNumber" value="${fn:substring(telnumber,3,4)}"/>
	       	<c:set var="LastNumber" value="${fn:substring(telnumber,7,8)}"/>
	       	<label for="nowMemberTelNumber">현재 전화번호</label><br>
	        <input type="text" readonly="readonly" id="nowMemberTelNumber" name="nowMemberTelNumber" value="${FirstNumber} - ${MiddleNumber}*** - ${LastNumber}***"/>       
		</div>
		
		<div class="form-group" align="left"> 		
	       	 <label for="nowMemberTelNumber">전화번호 인증</label><br>
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
	            <input type="button" class="btn" onclick="memberTelNumber_check_self()" value="전화번호 인증"/>
		</div>
		
		<div class="form-group" align="left">
			<label for="nowMemberTelNumber">변경할 전화번호</label><br>
			<select id="newMemberFirstNumber" name="newMemberFirstNumber" disabled="disabled">
	            <option value="010">010</option>
	            <option value="011">011</option>
	            <option value="016">016</option>
	            <option value="017">017</option>
	            <option value="019">019</option>
	        </select>
	            -
	        <input type="text" style="width:40px" disabled="disabled" maxlength="4" id="newMemberMiddleNumber" name="memberMiddleNumber" placeholder="0000" required>
	            -
	        <input type="text" style="width:40px" disabled="disabled" maxlength="4" id="newMemberLastNumber" name="memberLastNumber" placeholder="0000" required>
	        <input type="button" class="btn" id="memberTelNumber_check" disabled="disabled" onclick="memberTelNumber_check()" value="전화번호 중복 체크"/><br>
	        <font id="telNumber_check" size="2"></font>      
		</div>
		<br><br>
		<div class="pull-right">
			<input type="button" class="btn" id="modifyMemberTelNumber" onclick="modifyMemberTelNumber()" value="변경하기"/>
			<input type="button" class="btn" onclick="cancel()" value="취소"/>
		</div>
		
	</div>
</div>
</body>
</html>