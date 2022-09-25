<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
	function replyUpdate() {
		var content = $('#content').val();
		var replyQnABoardNo = $('#replyNo').val();
		$.ajax({
			url: 'updateReply.do',
			type: 'POST',
			data: {content:content,
				   replyQnABoardNo:replyQnABoardNo
					},
			datatype: 'JSON',
			success: function (data){
				if(data == "good"){
				alert('답글을 수정 하였습니다.')
				location='freeboard.do'
				}else{
					alert('답글 수정을 실패하였습니다.')
					
				}
			},
			error: function (data){
				alert('updateQnABoard.jsp updateQnA 함수 오류!')
			}
		});
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div class="container">
	<input type="hidden" id="replyNo" value="${replyQnABoard.replyQnABoardNo}"/>
        <div class="page-header">
            <h1>QnA 답글 수정</h1>
        </div>
        <br/>
        <table class="table">
        	<tr>
                <th>질문 작성자</th>
                <td><span style="padding:13px 0 0 15px;">${board.memberId}</span></td>
            </tr>
            <tr>
                <th>질문 제목</th>
                <td><span style="padding:13px 0 0 15px;">${board.title}</span></td>
            </tr>
            <tr>
                <th>질문 내용</th>
                <td><span style="padding:13px 0 0 15px;">${board.content}</span><!-- <textarea id="content" maxlength="140" rows="10" cols="114" style="height: 300px;"
                ></textarea> -->
                </td>
            </tr>
            <tr>
                <th>답변 내용</th>
                <td><textarea id="content" maxlength="140" rows="10" cols="114" style="height: 300px;"
                >${replyQnABoard.content}</textarea>
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
        <button type="button" class="btn" onclick="replyUpdate()">수정</button>

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
</body>
</html>