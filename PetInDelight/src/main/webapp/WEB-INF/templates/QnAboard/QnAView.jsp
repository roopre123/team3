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

	
	 function deleteQnA() {
		$.ajax({
			url: 'del.do?boardNo=${board.boardNo}',
			type: 'POST',
			datatype: 'JSON',
			success: function (data){
				location="success.do"
			}, 
			error: function (data){
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
                <th style="width: 100px">닉네임</th>
                <td>${board.memberNickname}<br/></td>
            </tr>
             <%-- <tr>
                <th style="width: 100px">등급</th>
                <td>${boardMem.memberGrade}<br/></td>
            </tr> --%>
            
            <tr>
                <th style="width: 100px">작성날짜</th>
                <td><fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>

            
            <tr>
                <th style="width: 100px">제목</th>
                <td>${board.title}<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">내용</th>
                <td width=300 height=300 style='table-layout:fixed'>${board.content}</td>

            </tr>
        </table>
        
        <%-- <div align="middle">
           <c:if test="${reviewBoard.boardNo!=minReview}">
              <input type="button" onclick="beforeReview()" value="이전글"/>
           </c:if>
           <c:if test="${reviewBoard.boardNo!=maxReview}">   
              <input type="button" onclick="afterReview()" value="다음글"/>
           </c:if>
        </div> --%>
        
        <div align="middle">
			<c:if test="${board.boardNo ne min}">
			<input class="btn" type="button" onclick="location.href='backPage.do?boardNo=${board.boardNo}'" value="이전글"/>
			<%-- <a href="backPage.do?boardNo=${board.boardNo}">이전 페이지</a> --%>
			</c:if>
			<c:if test="${board.boardNo ne max}">
			<input class="btn" type="button" onclick="location.href='nextPage.do?boardNo=${board.boardNo}'" value="다음글"/>
			<%-- <a href="nextPage.do?boardNo=${board.boardNo}">다음 페이지</a> --%>
			</c:if>
		</div>
		

        <!-- <div class="pull-left">
         <input type="button" class="btn" onclick="location='main.do'" value="메인으로"/>
      </div> -->
      <div class="pull-left">
      		<input type="button" class="btn" onclick="location.href='freeboard.do'" value="목록으로"/>
		</div>
      
         

        
        <%-- <div align="right">
      <c:if test="${reviewBoard.memberId==memberId || sessionMember.memberGrade eq 'Admin'}">

            <input type="button" class="btn" onclick="updateReview()" value="수정"/>
            <input type="button" class="btn" onclick="deleteReview()" value="삭제"/>
      </c:if>
      </div> --%>
      
      <div align="right">
      		<c:if test="${board.memberId eq SessionMemberId || SessionMemberGrade eq 'Admin'}">
      		<c:if test="${SessionMemberGrade eq 'Admin'}">
      		<input class="btn" type="button" value="답글하기" onclick="location.href='insQnA.do?boardNo=${board.boardNo}'"/>
      		</c:if>
	  		
			<input class="btn" type="button" value="수정" onclick="location.href='updateQnABoard.do?boardNo=${board.boardNo}'"/>
			<input class="btn" type="button" value="삭제" onclick="deleteQnA()"/>
			</c:if>
		</div>
	  

</div>

</div>        
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>






<%-- <div>
		<div>
			<h1>QnA</h1>
			<h2>${board.boardNo}</h2>
		</div>
		<br/>
		<table>
			<tr>
				<th>생성날짜</th>
				<td><span>${board.wdate}</span></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><span>${board.title}</span></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><span>${board.content}</span></td>
			</tr>
			

			<tr>
				<td></td>
				<td></td>
			</tr>
		</table>
		 <div >
			<a href="freeboard.do">목록으로</a>
		</div>
		
		<div>
			<input type="button" value="수정 및 삭제" onclick="location.href='updateQnABoard.do?boardNo=${board.boardNo}'"/>
		</div>
		
		<div>
			<c:if test="${board.boardNo ne min}">
			<a href="backPage.do?boardNo=${board.boardNo}">이전 페이지</a>
			</c:if>
		</div>
		
		<div >
			<c:if test="${board.boardNo ne max}">
			<a href="nextPage.do?boardNo=${board.boardNo}">다음 페이지</a>
			</c:if>
		</div>
		
		
		
		<div >
			<c:if test="${SessionMemberGrade eq 'Admin'}">
			<a href="insQnA.do?boardNo=${board.boardNo}">답글 하기</a>
			</c:if>
		</div>
		
	</div> --%>
</body>
</html>