<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<style>
.btn{
	background-color: #FFA500;
}
.btn:hover{
	background-color: #FFA500;
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
<title>QnA 게시판</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container">
	<div class="page-header">
		<h1>${SessionMemberNickname}님의 QnA 게시판</h1>
		<c:if test="${SessionMemberId ne null}">
			<div class="pull-right" style="width: 100px; margin: 10px 0;">
				<input type="button" onclick="location.href='insert.do?memberId=${SessionMemberId}'" class="btn btn-orange btn-block" value="등록"/>
			</div>
		</c:if>
	</div>
	<br/>

	<form action="freeboard.do">
		<table class="table">
		<tr>
			<td align="right">
				<select name="searchCondition" >
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}
					</c:forEach>
				</select>
				<input name="searchKeyword" type="text"/>
				<input type="submit" class="btn" value="검색"/>
			</td>
		</tr>
		</table>
	</form>
		
	<div id="mainHide">
		<table class="table table-hover" style="table-layout: fixed">
			<thead>
				<tr>
					<th scope="col" width="50">글번호</th>
					<th scope="col" width="100">게시글타입</th>
					<th scope="col" width="100">제목</th>
					<th scope="col" width="100">작성자</th>
					<th scope="col" width="100">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td align="center"><a href="reviewBoard.do?boardNo=${board.boardNo}">${board.boardNo}</a></td>
						<td>${board.boardType}</td>
						<td><a href="QnAView.do?boardNo=${board.boardNo}">${board.title}</a></td>
						<td>${board.memberNickname}</td>
						<td><fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
						<c:forEach var="replyQnABoard" items="${replyQnABoardList}">
						<c:if test="${replyQnABoard.boardNo eq board.boardNo}">
							<tr>
								<td></td>
								<td colspan="2">&#10551;<a
									href="replyQnABoard.do?replyQnABoardNo=${replyQnABoard.replyQnABoardNo}&boardNo=${board.boardNo}">
									RE: '${board.title}' / '${board.memberNickname}'님 께서 문의 주신 내용입니다.</a></td>
								<td>${replyQnABoard.memberNickname}</td>
								<td><fmt:formatDate value="${replyQnABoard.wdate}" pattern="yyyy-MM-dd HH:mm"/></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>

			</tbody>
		</table>
			<div>
				<nav aria-label="Page navigation" style="text-align: center;">
					<div style="text-align: center">
						<c:if test="${firstPage > pageList}">
							<a href="myQuestion.do?viewPage=${firstPage - pageList}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${firstPage}" end="${lastPage}">
							<a href="myQuestion.do?viewPage=${i}">[ ${i} ]</a>
						</c:forEach>
						<c:if test="${lastPage < totalPage}">
							<a href="myQuestion.do?viewPage=${firstPage + pageList}">[다음]</a>
						</c:if>
					</div>
				</nav>
			</div>
		</div>
	<div class="pull-left">
		<input type="button" class="btn" onclick="location='main.do'" value="메인으로"/>
	</div>
</div>	
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>