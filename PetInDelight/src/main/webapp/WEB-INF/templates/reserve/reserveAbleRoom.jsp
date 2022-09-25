<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style>
/* .a{
display: block;
} */
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
<script type="text/javascript">


	function goGet(path, method, roomNo) {
		params = {
				reserveStartDatee : $('#datepicker1').val(),
				reserveEndDatee : $('#datepicker2').val(),
				count : $('#animalcnt').val(),
				roomNo : roomNo
		}
		method = method || "GET";
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);
		for ( var key in params) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", params[key]);
			form.appendChild(hiddenField);
		}
	
		document.body.appendChild(form);
		form.submit();
	}


	/* function goAjax(){
		var sendDate = {
				reserveStartDatee : $('#datepicker1').val(),
				reserveEndDatee : $('#datepicker2').val(),
				count : $('#animalcnt').val(),
				roomNo : $('#roomNo').val()
		}
		  $.ajax({
	         url: "roominformationview.do",
	         type: "GET",
	         data: sendDate,
	         success: function (data) {
	             $("#search_change_board").html(data);
	         },
	         error: function () {
	             alert('수정 실패!');
	         }
	     }); 
	} */
</script>
</head>
<body>

<div class="a">
<div class="container">
	<div class="page-header">
		<h1>예약가능한 방</h1>
	</div>
	<div align="center">
			<c:forEach items="${roomList}" var="room">
				<div style="display:inline-flex; flex-direction:column; justify-content:flex-start; align-items:center;">
					<img src="${pageContext.request.contextPath}/resource/img/${room.picturePath}" class="img-thumbnail" style="width:300px; height:300; ">
					<%-- <a href="roominformationview.do?roomNo=${room.roomNo}"> --%>
					<a href="#" onclick="goGet('roominformationview.do','GET', ${room.roomNo}); return false;">
					<%-- <a href="#" onclick="goInfromationView(${room.roomNo}); return false;"> --%>
					<div style="display:inline-flex;justify-content:flex-start; align-items:center;">
						<table class="table ">
							<tr>
								<th>
									방번호
								</th>
								<td align="center">
									${room.roomNo}
								</td>
							</tr>
							<tr>
								<th>
									가격
								</th>
								<td>
									${room.price}
								</td>
							</tr>
							<tr>
								<th>
									최대 마리 수
								</th>
								<td align="center">
									${room.count}
								</td>
							</tr>
						</table>
						<%-- <div style="width:50px; margin:10px;">
							<c:out value="${room.roomNo}번방"/>
						</div>
						<div>
							<br/>
							<c:out value="가격 : ${room.price}"/>
							<p><c:out value="최대 마리 수 : ${room.count}"/></p>
							<br/>
						</div> --%>
					</div>
					</a>
				</div>
			</c:forEach>
	</div>

</div>
</div>
</body>
</html>