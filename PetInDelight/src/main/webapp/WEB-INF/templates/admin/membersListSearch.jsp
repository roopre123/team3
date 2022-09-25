<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
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