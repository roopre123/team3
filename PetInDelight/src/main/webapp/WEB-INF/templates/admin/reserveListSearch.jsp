<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function checkIn(a) {
		var no = a;
		$.ajax({
			url: "checkIn.do",
			type: 'POST',
			data: {
				reserveNo: no
			},
			datatype: 'JSON',
			success: function(data){
				if(data == "ok"){
					alert("입실 처리 완료")
					document.location.reload();
				}
			}			
		})
	}

	function checkOut(a) {
		var no = a;
		$.ajax({
			url: "checkOut.do",
			type: 'POST',
			data: {
				reserveNo: no
			},
			datatype: 'JSON',
			success: function(data){
				if(data == "ok"){
					alert("퇴실 처리 완료")
					 document.location.reload();
				}
			}
		})
	}
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div id="mainHide">	
		<table class="table table-hover" >
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
					<c:if test="${reserveListAll.reserveType == 'Y'}">
					<td><input type="button" onclick="checkIn(${reserveListAll.reserveNo})" value="입실"/></td>
					</c:if>
					<c:if test="${reserveListAll.reserveType == 'I'}">
					<td><input type="button" onclick="checkOut(${reserveListAll.reserveNo})" value="퇴실"/></td>
					</c:if>			
				</tr>
				</c:forEach>
			</tbody>		
		</table>
	</div>
</div>
</body>
</html>