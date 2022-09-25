<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		listShow();
		
	});
	
	function listShow(){
		$.ajax({
			url: "reserveListMember.do",
			type: "POST",
			success: function(data){
				$("#reserveList").html(data);
			}
		})
		
	};

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
.btn{
	background-color: #FFA500;
}
.btn:hover{
	background-color: #FFA500;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div id="reserveList">
	
</div>

</div>

<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>