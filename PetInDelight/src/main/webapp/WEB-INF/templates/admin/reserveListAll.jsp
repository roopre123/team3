<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function moveFocus(){
		if(event.keyCode == 13){
			searchKeyword1();
			return;
		}
	}
	
	function searchKeyword1() {
		var condition = $('#searchCondition').val();
		var search1 = $('#searchKeyword').val();

		$.ajax({
			url: 'reserveListAllSearch.do',
			type: 'GET',
			data: {
				searchCondition: condition,
				searchKeyword: search1
			},
			datatype: 'JSON',
			success: function(data){
				$('#show').html(data);
			}
		})
	}
	
</script>
<title>전체 회원 조회</title>
</head>
<body>
<div id="show">
	
</div>
<div class="container">
	<div class="page-header">
		<h3>총 예약 건수 : ${total}</h3>
	</div>	
	<form onsubmit="return false;">
		<table class="table">
			<tr>	
				<td align="right">
					<select name="searchCondition" id="searchCondition">
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key }						
						</c:forEach>
					</select>
					<input type="text" id="searchKeyword" onkeydown="moveFocus()"/> 
					<input type="button" class="btn" name="search" onclick="searchKeyword1()" value="검색"/>
				</td>
			</tr>
		</table>
	</form>
	<div id="mainHide">	
		<table class="table table-hover">
			<thead>
				<tr>
					<td align="center">예약번호</td>
					<td align="center">방번호</td>
					<td align="center">시작일자</td>
					<td align="center">종료일자</td>
					<td align="center">마리수</td>
					<td align="center">아이디</td>
					<td align="center">가격</td>
					<td align="center">예약상태</td>
					<td align="center">요청사항</td>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reserveListAll" items="${reserveListAll}">
				<tr> 
					<td align="center">${reserveListAll.reserveNo}</td>
					<td align="center">${reserveListAll.roomNo}</td>
					<td align="center"><fmt:formatDate value="${reserveListAll.reserveStartDate}" pattern="yyyy-MM-dd"/></td>
					<td align="center"><fmt:formatDate value="${reserveListAll.reserveEndDate}" pattern="yyyy-MM-dd"/></td>
					<td align="center">${reserveListAll.count}</td>
					<td align="center">${reserveListAll.memberId}</td>
					<td align="center">${reserveListAll.price}</td>
					<td align="center">${reserveListAll.reserveType}</td>
					<td align="center">${reserveListAll.reqContent}</td>

				</tr>
				</c:forEach>
			</tbody>		
		</table>
	</div>
</div>

</body>
</html>