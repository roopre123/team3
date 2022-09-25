<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
}
.btn:hover{
	background-color: #FFA500;
}

.content{
	hight:500px;
	resize:none;
}

#title{
 	width:800px;
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
/*    function update(){
      var boardNoB=$('#boardNo').val();
      var titleB = $('#title').val();
      var countingStarB = $('input[name="reviewStar"]:checked').val();
      var contentB = $('#content').val().replace(/\n/g,"<br>");
      $.ajax({
         url: 'reviewUpdate.do',
         type: 'GET',
         data: {
            boardNo:boardNoB,
            title:titleB,
            content:contentB,
            countingStars:countingStarB
            },
         datatype: 'JSON',
         success: function (data) {
               alert("게시글 수정 성공하였습니다.")
               location.href='reviewBoardlist.do'
         }
      })
   } */
/* 
   function insert() {
      var titleB = $('#title').val();
      var contentB = $('#content').val().replace(/\n/g,"<br>");
      var countingStarB = $('input[name="reviewStar"]:checked').val();
      var reserveNoB =$('#reserveNo').val();
      if(titleB==""){
         alert("제목을 입력하여 주세요.")
      }else if(contentB==""){
         alert("내용을 입력하여 주세요.")
      }else{
      $.ajax({
         url: 'insertReviewboard.do',
         type: 'POST',
         data: {
            title:titleB,
            content:contentB,
            reserveNo:reserveNoB,
            countingStars:countingStarB
            },
         datatype: 'JSON',
         success: function (data) {
            if(data == "no") {
               alert("로그인이 필요합니다.")
               location.href='login.do'
            } else {
               alert("게시글 등록 성공하였습니다.")
               location.href='reviewBoardlist.do'
            }
         }
      })
   }
   } */
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
 <div class="container">
        <div class="page-header">
            <h1>후기 게시글 등록</h1>
        </div>
        <br/>
        
        <input id="wdate" name="wdate" value="${reviewBoard.wdate}" type="hidden" />
        
        <form class="myform" enctype="multipart/form-data" id="insert">
        <c:if test="${reviewBoard != null}">
        	<input name="boardNo" value="${reviewBoard.boardNo}" type="hidden" />
        </c:if>
        
        <c:if test="${reviewBoard == null }">
     	   <input id="reserveNo" name="reserveNo" value="${reserve.reserveNo}" type="hidden" />
        </c:if>
        <table class="table">
           <!-- 
            <tr>
                <th style="padding:13px 0 0 15px">게시판 선택</th>
                <td>
                    <div >
                        <select  id="boardType" type="hidden">
                            <option value="후기게시판">후기게시판</option>
                            <option value="자유게시판">자유게시판</option>
                        </select>
                    </div>
                </td>
            </tr>
             -->
             
            
            <tr>
                <th style="padding:13px 0 0 15px;">제목</th>
                <td><input name="title" type="text" value="${reviewBoard.title}"/></td>
            </tr>
            <tr>
                <th style="padding:13px 0 0 15px;">별점</th>
                <td>             	
                	<fieldset>                						
						<input type="radio" name="countingStars" value="5" id="rate5" ><label for="rate5">★</label>
						<input type="radio" name="countingStars" value="4" id="rate4"><label for="rate4">★</label>
						<input type="radio" name="countingStars" value="3" id="rate3"><label for="rate3">★</label>
						<input type="radio" name="countingStars" value="2" id="rate2"><label for="rate2">★</label>
						<input type="radio" name="countingStars" value="1" id="rate1" checked="checked"><label for="rate1">★</label>
					</fieldset>  		
 				</td>
            </tr>
            
            <tr>
                <th style="padding:13px 0 0 15px;">내용</th>
                <td><textarea name="content" maxlength="140" rows="10" cols="100" style="height: 300px;">${reviewBoard.content}</textarea>
                </td>
            </tr>
            
            <!-- 파일업로드 -->
            <tr>
                <th style="padding:13px 0 0 15px;">파일첨부</th>
                <td><input type="file" id="file" name="file"></td>
            </tr>         
        </table>
        </form>
        
        <!-- 
        <div >
            <a href="reviewBoardlist.do" >목록으로</a>
        </div>
         -->
         
        <!-- 수정에서 넘어오면 저장버튼 안보이게. -->
        <div style="display:flex; justify-content:flex-end; align-items:center;">
        <div align="right">
        <c:if test="${reviewBoard.boardNo==null}">
        <div class="pull-left">
            <input type="submit" form="insert" class="btn"  value="등록"  formaction="upload_ok.do" formmethod="post" />
         </div>
        </c:if>
        </div>
		</div>
        
        <div style="display:flex; justify-content:flex-end; align-items:center;">
        <div align="right">
        <c:if test="${reviewBoard.memberId==memberId|| sessionMember.memberGrade eq 'Admin'}">
           <div class="pull-left">
               <input type="submit" form="insert" class="btn" formaction="reviewUpdate.do" formmethod="post" value="등록"/>
               <button type="button" class="btn" onclick="javscript:history.back()">취소</button>
           </div>
        </c:if>
        </div>
        </div>
     
   
    </div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>
