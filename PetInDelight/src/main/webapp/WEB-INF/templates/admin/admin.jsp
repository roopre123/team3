<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('.tabmenu').click(function() {
			var activeTab = $(this).attr('data-toggle');
			$.ajax({
				type: 'POST',
				url: activeTab + ".do",
				success: function(data){
					$('#tabcontent').html(data);
				}
			})
		})	
	})
	
	
</script>
<style>
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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
	<div class="container">
		<div class="page-header">
			<h1>관리 메뉴</h1>
		</div>
		<ul class="nav nav-tabs">		
			<li><a data-toggle="membersList" class="tabmenu" id="tab1">회원 관리</a></li>
			<li><a data-toggle="reserveListAll" class="tabmenu">예약 관리</a></li>
		</ul>
		
		<div id="tabcontent">
		
		</div>	
	</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>