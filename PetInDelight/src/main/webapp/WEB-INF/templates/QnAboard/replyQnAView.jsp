<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

	
	 function replyDelete() {
		$.ajax({
			url: 'replyDel.do?replyQnABoardNo=${selectReplyQnABoard.replyQnABoardNo}',
			type: 'POST',
			datatype: 'JSON',
			success: function (data){
				if(data == "good"){
					alert("답글을 삭제하였습니다.");
					location.href="freeboard.do"
				}else{
					alert("답글 삭제에 실패하였습니다.")
					location.href="freeboard.do"
				}

			}, 
			error: function (data){
				alert("답글 삭제 에러");
			}
		})
	}

</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container">
   <div class="page-header">
            <h1>QnA 게시판</h1>
    </div>

        <br/>
        <table  class="table">
           <tr>
                <th style="width: 100px">질문하신 분</th>
                <td>${board.memberNickname}<br/></td>
            </tr>
             <%-- <tr>
                <th style="width: 100px">등급</th>
                <td>${boardMem.memberGrade}<br/></td>
            </tr> --%>
            
            <tr>
                <th style="width: 100px">질문 날짜</th>
                <td><fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>

            
            <tr>
                <th style="width: 100px">질문 제목</th>
                <td>${board.title}<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">질문 내용</th>
                <td>${board.content}</td>

            </tr>
            <tr>
            	<th></th>
            	<td></td>
            </tr>
        </table>
        <div class="page-header">
            <h1>답변 내용</h1>
   		 
   		 <table  class="table">
            <tr>
            	<th style="width: 100px">질문 답변</th>
            	<td>${selectReplyQnABoard.content}</td>
            </tr>
           </table>
           </div>
           
        
        <%-- <div align="middle">
           <c:if test="${reviewBoard.boardNo!=minReview}">
              <input type="button" onclick="beforeReview()" value="이전글"/>
           </c:if>
           <c:if test="${reviewBoard.boardNo!=maxReview}">   
              <input type="button" onclick="afterReview()" value="다음글"/>
           </c:if>
        </div> --%>
        

      <div class="pull-left">
      		<input type="button" class="btn" onclick="location.href='freeboard.do'" value="목록으로"/>
		</div>
      
         

        
    
      <div align="right">
      		<c:if test="${SessionMemberGrade eq 'Admin'}">
			<input class="btn" type="button" value="수정" onclick="location.href='upReplyQnABoard.do?replyQnABoardNo=${selectReplyQnABoard.replyQnABoardNo}&boardNo=${board.boardNo}'"/>
			<input class="btn" type="button" value="삭제" onclick="replyDelete()"/>
			</c:if>
		</div>
	  

</div>

</div>        
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>

<%-- <div class="a">
	<div>
		<div>
			<h1>QnA 답변</h1>
		</div>
		<br />
		<table>
			<tr>
				<th>생성날짜</th>
				<td><span>${selectReplyQnABoard.wdate}</span></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><span>RE: ${board.title}</span></td>
			</tr>
			<tr>
				<th>질문하신 내용</th>
				<td><span>${board.content}</span></td>
			</tr>
			<tr>
				<th>답변</th>
				<td><span>${selectReplyQnABoard.content}</span></td>
			</tr>


			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div>
			<a href="freeboard.do">목록으로</a>
		</div>

		<div>
			<input type="button" value="수정 및 삭제"
				onclick="location.href='updateQnABoard.do?boardNo=${board.boardNo}'" />
		</div>
	</div> --%>

</body>
</html>