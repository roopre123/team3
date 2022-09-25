<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>
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
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function moveFocus(){
		if(event.keyCode == 13){
			searchKeyword1();
			return;
		}
	}
	
	function searchKeyword1() {
		var condition = $('#searchCondition').val();
		var search1 = $('#searchKeyword').val();

		$.ajax({
			url: 'membersListSearch.do',
			type: 'GET',
			data: {
				searchCondition: condition,
				searchKeyword: search1
			},
			datatype: 'JSON',
			success: function(data){
				$('#show').html(data);
			}
		})
	}
</script>
<title>전체 회원 조회</title>
</head>
<body>
<div id="show">
	
</div>
<div class="container">
	<div class="page-header">
		<h3>총 회원 수 : ${total}</h3>
	</div>	
	<form onsubmit="return false;">
		<table class="table">
			<tr>	
				<td align="right">
					<select name="searchCondition" id="searchCondition">
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key }						
						</c:forEach>
					</select>
					<input type="text" id="searchKeyword" onkeydown="moveFocus()"/> 
					<input type="button" class="btn" name="search" onclick="searchKeyword1()" value="검색"/>
				</td>
			</tr>
		</table>
	</form>
	<div id="mainHide">	
		<table class="table table-hover">
			<thead>
				<tr>
					<td align="center">아이디</td>
					<td align="center">비밀번호</td>
					<td align="center">이름</td>
					<td align="center">닉네임</td>
					<td align="center">생년월일</td>
					<td align="center">주소</td>
					<td align="center">전화번호</td>
					<td align="center">가입날짜</td>
					<td align="center">등급</td>
					<td align="center">비고</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="membersList" items="${membersList}">
				<tr> 
					<td align="center"><a href="adminSelectMember.do?memberId=${membersList.memberId}">${membersList.memberId}</a></td>
					<td align="center">${membersList.memberPassword}</td>
					<td align="center">${membersList.memberName}</td>
					<td align="center">${membersList.memberNickname}</td>
					<td align="center">${membersList.memberResident}</td>
					<td align="center">${membersList.memberAddress}</td>
					<td align="center">${membersList.memberTelNumber}</td>
					<td><fmt:formatDate value="${membersList.memberSignDate}" pattern="yyyy-MM-dd"/></td>
					<td align="center">${membersList.memberGrade}</td>
					<td align="center">${membersList.memberEtc}</td>
				</tr>
				</c:forEach>
			</tbody>		
		</table>
	</div>
</div>

</body>
</html>