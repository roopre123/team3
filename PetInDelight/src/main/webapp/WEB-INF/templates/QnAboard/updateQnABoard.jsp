<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
}
.btn:hover{
   background-color: #FFA500;
}

.content{
   hight:500px;
   resize:none;
}

#title{
    width:820px;
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
	function updateQnA() {
		var title = $('#title').val();
		var content = $('#content').val();
		$.ajax({
			url: 'up.do?boardNo=${board.boardNo}',
			type: 'POST',
			data: {title:title,
				   content:content
				   },
			datatype: 'JSON',
			success: function (data){
				alert('게시글을 수정 하였습니다.')
				location='freeboard.do'
			},
			error: function (data){
				alert('updateQnABoard.jsp updateQnA 함수 오류!')
			}
		});
	}
	/*삭제 함수
	 function deleteQnA() {
		var boardNo = $('#board_No').val();
		$.ajax({
			url: 'del.do?boardNo=${board.boardNo}',
			type: 'POST',
			data: {boardNo:boardNo},
			datatype: 'JSON',
			success: function (data){
				location="success.do"
			}, 
			error: function (data){
			}
		})
	} */

</script>
<title>Insert title here</title>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container">
        <div class="page-header">
            <h1>QnA 게시글 등록</h1>
        </div>
        <br/>
        <table class="table">
            <tr>
                <th style="padding:13px 0 0 15px;">제목</th>
                <td><input id="title" type="text" value="${board.title}"/></td>
            </tr>
            <tr>
                <th style="padding:13px 0 0 15px;">내용</th>
                <td><textarea id="content" maxlength="140" rows="10" cols="114" style="height: 300px;"
                >${board.content}</textarea>
                </td>
            </tr>
            <tr>
            <td></td>
            <td></td>
            </tr>
        </table>
         
        <!-- 수정에서 넘어오면 저장버튼 안보이게. -->
        <div style="display:flex; justify-content:flex-end; align-items:center;">
        <div align="right">
        <button type="button" class="btn" onclick="updateQnA()">수정</button>

        <div class="pull-left">
            
         </div>
        </div>
      </div>
        
        <div style="display:flex; justify-content:flex-end; align-items:center;">
        <div align="right">
        
      
        </div>
        </div>
     </div>
   
    </div>


<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
    <%-- <div>
    
        <div>
            <h1>QnA</h1>
        </div>
        <br/>
        <table>
            <tr>
                <th>제목</th>
                <td><input id="board_title" type="text" value="${board.title}"/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea id="board_content" maxlength="140" rows="7" style="height: 200px;">
                ${board.content}
                </textarea><span></span>
                </td>
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
            
    </div>
    <input type="button" onclick="updateQnA()" value="수정"/>
    <input type="button" onclick="deleteQnA()" value="삭제"/>
   </div> --%>
</body>
</html>