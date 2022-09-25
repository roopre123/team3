<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link href="resource/static/css/star.css" rel="stylesheet"/>
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
.stars { 9  ㅠ
color: #FFD200;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function updateReview(){
		var boardNo = $('#boardNo').val()
		location.href='reviewUp.do?boardNo='+boardNo
			/*  $.ajax({
				url: 'reviewUp.do',
				type: 'GET',
				data: {
					boardNo:boardNoB,
					},
				datatype: 'JSON',
				success: function (data){
					alert("이동이동")
				}
			})*/
	}


	function deleteReview(){
		var boardNoB = $('#boardNo').val()
			$.ajax({
				url: 'deleteReview.do',
				type: 'GET',
				data: {
					boardNo:boardNoB,
					},
				datatype: 'JSON',
				success: function (data) {
					/*  if(data == "no") {
						alert("삭제 실패.")
						location.href='login.do'
					} else { */
						alert("리뷰글 삭제 성공하였습니다.")
						location.href='reviewBoardlist.do'
				}
			})	

	}

	function beforeReview(){
		var boardNo = $('#boardNo').val()
		location.href='beforeReview.do?boardNo='+boardNo
		
	}
	
	function afterReview(){
		var boardNo = $('#boardNo').val()
		location.href='afterReview.do?boardNo='+boardNo
	}
			
			
</script>
<title>후기게시판</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container">
	<div class="page-header">
            <h1>후기 게시판</h1>
    </div>

        <br/>
        <input id="boardNo" name="boardNo" value="${reviewBoard.boardNo}" type="hidden" />
        <input id="wdate" name="wdate" type="hidden" />
        <table  class="table">
        	<tr>
                <th style="width: 100px">닉네임</th>
                <td>${reviewBoard.memberNickname}<br/></td>
            </tr>
             <tr>
                <th style="width: 100px">등급</th>
                <td>${boardMem.memberGrade}<br/></td>
            </tr>
            
            <tr>
                <th style="width: 100px">작성날짜</th>
                <td><fmt:formatDate value="${reviewBoard.wdate}" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>

            
            <tr>
                <th style="width: 100px">별점</th>
                <td>
        			<c:set var="star" value="${reviewBoard.countingStars}"/>
        			<c:forEach var="a" begin="1" end="${star}">
        			<label class="stars">★</label>
        			</c:forEach>        				
        		</td>

            </tr>
            <tr>
                <th style="width: 100px">제목</th>
                <td>${reviewBoard.title}<br/></td>
            </tr>
            <tr>            	
                <th style="width: 100px">내용</th>
                <td width=300 height=300 style='table-layout:fixed'>
                 ${reviewBoard.content}
 
                <c:set var="image" value="${reviewBoard.reviewPicturePath }"/>     
         		<c:if test="${fn:contains(image, '.')}">
         		<div style="display:flex; justify-content:left; align-items:left;">         	
        			<img src ="/IMAGES/${reviewBoard.reviewPicturePath }" width="300px", height="300px">
       			</div>
       			</c:if>
       			</td>
            </tr>            
        </table>        
        
        <div align="left">
	        <c:if test="${reviewBoard.boardNo!=minReview}">
	        	<input type="button" class="btn" onclick="beforeReview()" value="이전글"/>
	        </c:if>
	        <c:if test="${reviewBoard.boardNo!=maxReview}">	
	        	<input type="button"  class="btn" onclick="afterReview()" value="다음글"/>
	        </c:if>
        </div>
        <br>
        
        <div class="pull-left">
			<input type="button" class="btn" onclick="location='reviewBoardlist.do'" value="목록으로"/>
		</div>
		
			

        
        <div align="right">
		<c:if test="${reviewBoard.memberId==memberId || sessionMember.memberGrade eq 'Admin'}">

            <input type="button" class="btn" onclick="updateReview()" value="수정"/>
            <input type="button" class="btn" onclick="deleteReview()" value="삭제"/>
		</c:if>
		</div>
</div>
</div>        
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>