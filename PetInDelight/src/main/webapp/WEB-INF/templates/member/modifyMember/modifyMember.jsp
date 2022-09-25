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
	function modifyMemberPassword() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4); 
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "https://2d1b-58-224-53-148.ngrok.io/PetInDelight/modifyMemberPassword.do"; 
		window.open(url, "비밀번호 변경", windowStatus);		
	}
	function modifyMemberNickname() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "https://2d1b-58-224-53-148.ngrok.io/PetInDelight/modifyMemberNickname.do";
		window.open(url, "닉네임 변경", windowStatus);		
	}
	function modifyMemberTelNumber() {
		var width = 600;
		var height = 600;
		
		var left = (window.screen.width/2) - (width/2);
		var top = (window.screen.height / 4);
		
		var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
		
		const url = "https://2d1b-58-224-53-148.ngrok.io/PetInDelight/modifyMemberTelNumber.do";
		window.open(url, "전화번호 변경", windowStatus);		 
	}
	
	function save() {
		alert("변경내용이 저장되었습니다.")
		location="selectMember.do";
	}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>
<% 
	String memberId = (String) session.getAttribute("SessionMemberId");
	System.out.println(memberId);
%>
<div class="a">
<div class="container" style="width:500px">
	<div class="page-header">
		<h1>개인 정보 수정</h1>
	</div>
</div>
<div class="container" style="width:500px">
<table class="table" border="2">
	<tr>
		<th style="padding:13px 0 0 15px" width="100">아이디</th>
		<td colspan="2" align="center">${memberSelect.memberId}</td>
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">비밀번호</th>
		<td align="center">${memberSelect.memberPassword}</td>
		<td align="center"><input type="button" class="btn btn-orange btn-block" onclick="modifyMemberPassword()" value="비밀번호 변경"/></td>
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">이름</th>
		<td colspan="2" align="center">${memberSelect.memberName}</td>
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">닉네임</th>
		<td align="center">${memberSelect.memberNickname}</td>
		<td align="center"><input type="button" class="btn btn-orange btn-block" onclick="modifyMemberNickname()" value="닉네임 변경"/></td>
	</tr>
	<tr>
		<c:set var="resident" value="${memberSelect.memberResident}"/>
		<c:set var="firstResident" value="${fn:substring(resident,0,6)}"/>
		<c:set var="lastResident" value="${fn:substring(resident,6,7)}"/>
		<th style="padding:13px 0 0 15px" width="100">생년월일</th>
		<td colspan="2" align="center">${firstResident} - ${lastResident}******</td>
	</tr>
	<tr>
		<th style="padding:13px 0 0 15px" width="100">주소</th>
		<td colspan="2" align="center">${memberSelect.memberAddress}</td>
	</tr>
	<tr>
		<c:set var="telnumber" value="${memberSelect.memberTelNumber}"/>
       	<c:set var="FirstNumber" value="${fn:substring(telnumber,0,3)}"/>
       	<c:set var="MiddleNumber" value="${fn:substring(telnumber,3,4)}"/>
       	<c:set var="LastNumber" value="${fn:substring(telnumber,7,8)}"/>       
		<th style="padding:13px 0 0 15px" width="100">전화번호</th>
		<td align="center">${FirstNumber} - ${MiddleNumber}*** - ${LastNumber}***</td>
		<td align="center"><input type="button" class="btn btn-orange btn-block" onclick="modifyMemberTelNumber()" value="전화번호변경"/></td>
	</tr>
</table>
<div align="center">	
		<div class="pull-left">
			<input type="button" class="btn btn-orange btn-block" onclick="location='main.do'" value="메인으로"/>
		</div>
		<div class="pull-right">
			<input type="button" class="btn btn-orange btn-block" onclick="location='unSignUpMember.do'" value="회원탈퇴"/>
			<input type="button" class="btn btn-orange btn-block" onclick="save()" value="확인"/>	
		</div>
</div>
</div>
</div>
<div id="footer" align="center">
<jsp:include page="../../footer.jsp"></jsp:include>
</div>
</body>
</html>