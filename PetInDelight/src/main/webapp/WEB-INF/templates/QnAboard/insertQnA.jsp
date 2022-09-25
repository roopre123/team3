<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function insert() {
		var content = $('#content').val();
		//var boardNo = $('#board_No').val();
		alert("답변 등록");
		$.ajax({
			url: 'replyQnA.do?boardNo=${selectQnABoard.boardNo}',
			type: 'POST',
			data: {content:content
				   //boardNo:boardNo
				   },
					datatype: 'JSON',
			success: function (data){
				if(data == "good"){
					alert("답글을 등록하였습니다.");
					location="freeboard.do"
				}
				else{
					alert("답글 등록에 실패하였습니다.");
				}
			
			},
			error: function (data){
				alert("이미 답변된 게시글 입니다.");
				location="freeboard.do"
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
        <div class="page-header">
            <h1>QnA 답글 등록</h1>
        </div>
        <br/>
        <table class="table">
            <tr>
                <th>질문 제목</th>
                <td><span style="padding:13px 0 0 15px;">${selectQnABoard.title}</span></td>
            </tr>
            <tr>
                <th>질문 내용</th>
                <td><span style="padding:13px 0 0 15px;">${selectQnABoard.content}</span><!-- <textarea id="content" maxlength="140" rows="10" cols="114" style="height: 300px;"
                ></textarea> -->
                </td>
            </tr>
            <tr>
                <th>답변 내용</th>
                <td><textarea id="content" maxlength="140" rows="10" cols="114" style="height: 300px;"
                ></textarea>
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
        <button type="button" class="btn" onclick="insert()" id="insert">등록</button>

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
    	<input type="hidden" value="${selectQnABoard.boardNo}" id="board_No"/>
        <div>
            <h1>QnA 답글</h1>
        </div>
        <br/>
        <table>
            <tr>
                <th>질문 제목</th>
                <td><span>${selectQnABoard.title}</span></td>
            </tr>
            <tr>
            	<th>질문 내용</th>
            	<td><span>${selectQnABoard.content}</span> 
            </tr>
            
            <tr>
                <th style="padding:13px 0 0 15px;">답변 내용</th>
                <td><textarea id="qnaBoard_content" maxlength="140" rows="7" style="height: 200px;"></textarea><span></span>
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
    <input type="button" onclick="insert()" value="저장"/>
   </div> --%>
</body>
</html>