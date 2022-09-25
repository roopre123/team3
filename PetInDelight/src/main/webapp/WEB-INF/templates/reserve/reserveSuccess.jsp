<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<link href="resource/static/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/static/css/font-awesome.min.css" rel="stylesheet">
<link href="resource/static/css/common.css" rel="stylesheet">
<link href="resource/static/css/custom-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<fmt:parseNumber var="startDate_N" value="${reserve.reserveStartDate.time / (1000*60*60*24)}" integerOnly="true" />
<fmt:parseNumber var="endDate_N" value="${reserve.reserveEndDate.time / (1000*60*60*24)}" integerOnly="true" /> 
<div class="container">
	<div class="page-header">
            <h1>예약완료</h1>
    </div>
<div>

<br/><br/><br/><br/>
<div align="center">
<img src="${pageContext.request.contextPath}/resource/img/petindelight.png" style="width:300px">
<h2>${member.memberNickname}님의 예약이 완료되었습니다.</h2><br/><br/><br/><br/>
</div>
	<div align="center">
	<table class="table" style="width:500px;">
			<tr>
                <th style="width: 100px">예약번호</th>
                <td>${reserve.reserveNo}<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">예약일</th>
                <td><fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" /> ~
					<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" /> <br/></td>
            </tr>
            <tr>
                <th style="width: 100px">일수</th>
                <td>${endDate_N - startDate_N}박<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">마리수</th>
                <td>${reserve.count}마리<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">아이디</th>
                <td>${reserve.memberId}<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">연락처</th>
                <td>${member.memberTelNumber}<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">가격</th>
                <td>${reserve.price}<br/></td>
            </tr>
            <tr>
                <th style="width: 100px">요청사항</th>
                <td>${reserve.reqContent}<br/></td>
            </tr>
            <tr>
            	<td colspan="2">
				    <div align="right">
						<input type="button" class="btn" onclick="location='main.do'" value="홈으로"/>
					</div>
            	</td>
            </tr>
		</table>

		</div>
			
			<!-- 
			<tr>
				<th>예약 번호</th>
				<th>예약 정보</th>
				<th>결제 금액</th>
			</tr>
			<tr>
				<td><strong>${reserve.reserveNo}</strong></td>
				<td>
					<strong>${reserve.roomNo}번방</strong>
					<fmt:formatDate value="${reserve.reserveStartDate}" pattern="yyyy-MM-dd" /> ~
					<fmt:formatDate value="${reserve.reserveEndDate}" pattern="yyyy-MM-dd" /> 
					<br>
					${reserve.count}마리
					<br>
					호텔 위치 : 대구 수성구 알파시티1로 170 PID애견호텔
				</td>
				<td>
					${reserve.price}<br>${endDate_N - startDate_N}박
				</td>
			</tr>
				 -->

	
</div>
</div>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>