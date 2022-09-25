<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		error();
	});
	
	function error(){
		alert('권한이 없습니다.')
		location.href = "freeboard.do"
	};
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<br><br><br>
</body>
</html>