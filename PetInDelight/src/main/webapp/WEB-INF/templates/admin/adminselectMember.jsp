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
	function modifyAdmin(a) {
		var id = a
		var grade = $('#memberGrade').val();
		
		$.ajax({
			url: 'modifyAdmin.do',
			type: 'POST',
			data: {
				memberId: id,
				memberGrade : grade
			},
			datatype: 'JSON',
			success: function(data) {
				if(data == "ok"){
					alert("수정 성공")
					location="admin.do";
				} else if (data == "no"){
					alert("수정 실패")
				}
			}
		})
	}
</script>
<title>개인 정보 조회</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container" style="width:500px">
	<div class="page-header">
		<h1>${memberSelect.memberNickname}님의 정보</h1>
	</div>
</div>
<div class="container" style="width:500px">
<table class="table" border="2">
	<tr>
		<th style="padding:13px 0 0 15px" width="100">아이디</th>
		<td align="center" id="memberId">${memberSelect.memberId}</td>
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">이름</th>
		<td align="center">${memberSelect.memberName}</td>
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">닉네임</th>
		<td align="center">${memberSelect.memberNickname}</td>
	</tr>
	<tr>
		<c:set var="resident" value="${memberSelect.memberResident}"/>
		<c:set var="firstResident" value="${fn:substring(resident,0,6)}"/>
		<c:set var="lastResident" value="${fn:substring(resident,6,7)}"/>
		<th style="padding:13px 0 0 15px" width="100">생년월일</th>
		<td align="center">${firstResident} - ${lastResident}******</td> 
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">주소</th>
		<td align="center">${memberSelect.memberAddress}</td>
	</tr>
	<tr>
		<c:set var="telnumber" value="${memberSelect.memberTelNumber}"/>
       	<c:set var="FirstNumber" value="${fn:substring(telnumber,0,3)}"/>
       	<c:set var="MiddleNumber" value="${fn:substring(telnumber,3,4)}"/>
       	<c:set var="LastNumber" value="${fn:substring(telnumber,7,8)}"/>       
		<th style="padding:13px 0 0 15px" width="100">전화번호</th>
		<td align="center">${FirstNumber} - ${MiddleNumber}*** - ${LastNumber}***</td>
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">등급</th>
		<td align="center">
		<select id="memberGrade">
			<option value="${memberSelect.memberGrade}">${memberSelect.memberGrade}</option>
			<option value="Bronze">Bronze</option>
			<option value="Silver">Silver</option>
			<option value="Gold">Gold</option>
			<option value="Vip">Vip</option>
			<option value="VVip">VVip</option>
		</select>
		</td>
	</tr>
</table>
<div align="center">
	<div class="pull-left">
		<input type="button" class="btn" onclick="location='main.do'" value="메인으로"/>
	</div>
	<div class="pull-right">
		<input type="button" class="btn" onclick="modifyAdmin('${memberSelect.memberId}')" value="회원 정보 수정"/>
	</div>	
</div>
</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>