<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
.wrap{
  display: flex;
  justify-content: center;
  align-items:center;
/*   min-height: 100vh; */
}

 
 </style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<meta charset="UTF-8" http-equiv="Content-Type" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="a">
<div>
	<div class="wrap">
		<div>
			<label for="datepicker1">체크인</label><br>
			<input type="text" class="datepicker" id="datepicker1" autocomplete="off">
		</div>
		&nbsp;
		<div>
			<label></label><br>
			<label>~</label>
		</div>
		&nbsp;
		<div>
			&nbsp;<label for="datepicker2">체크아웃</label><br>
			<input type="text" class="datepicker" id="datepicker2" autocomplete="off">
		</div>
		&nbsp;
		<div>
			<label for="animalcnt">마리 수</label><br>
			<select id="animalcnt" class="form-control input-sm">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<!-- <input type="text" id="animalcnt"> -->
		</div>
		&nbsp;
		<div>
			<br>
			<input type="button" class="btn" id="reserveSearch" value="검색">
		</div>
	</div>
<hr></hr>
<div class="wrap" id="show">
	<div align="center">
   <img src="${pageContext.request.contextPath}/resource/img/petindelight.png" style="width:300px; opacity:1;"><br>
    <!-- <img src="${pageContext.request.contextPath}/resource/img/2.png" height="50%" width="100%"> <br><br> --> 
     <p style="color:black">

     Pet In Delight를 방문해 주셔서 감사합니다.<br>
  	 	<h2>예약하려는 입실,퇴실날짜 및 마리수를 선택하여 주십시오.</h2><br>
     "보호자님이 믿고 맡길 수 있는" Pet In Delight가 되겠습니다.

     </p>     
</div>
</div>
	<div class="container" style="width: 100%">
		<div>		
			<div id = "showRoom">
			</div>
		</div>	
	</div>
</div> 


<script>
 $.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	}); 
	
	
$(document).ready(function(){       
    $( "#datepicker1,#datepicker2" ).datepicker({
         changeMonth: true,
         changeYear: true,
         showMonthAfterYear: true
     });
    /* 첫번 째 달력에 오늘 이전의 날, 최대 날 지정*/
    $('#datepicker1').datepicker("option", "minDate", 0);
    $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val());
    $('#datepicker1').datepicker("option", "onClose", function (selectedDate){
        $("#datepicker2").datepicker( "option", "minDate", selectedDate );
        });
    
    /* 두번 째 달력에 예약 시작날, 지정 */
    $('#datepicker2').datepicker();
    $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
    $('#datepicker2').datepicker("option", "onClose", function (selectedDate){
        $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
       });
});

	
  /* $(function(){
    $('#datepicker1').datepicker({
    	minDate: 0,
    	onClose: function(){
    		$('#datepicker2').datepicker({
    			minDate: new Date($('#datepicker1').val()+1)
    		})
    	}
    });
  }); */
  
  /* datePickerSet($('#datepicker1'), $('#datepicker2'), true);
  
	function datePickerSet(sDate, eDate, flag){
		var sDay = sDate.val();
		var eDay = eDate.val();
		
		
	  
		if( flag && !isValidStr(sDay) && !isValidStr(eDay) ){
			var sdp = sDate.datePicker().data("datepicker");
			sdp.selectDate(new Date(sDay.replace(/-/g, "-")));
		
			var edp = eDate.datepicker().data("datepicker");
			edp.selectDate(new Date(eDay.replace(/-/g, "-")));
		}
		
		if (!isValidStr(eDay)) {
            sDate.datepicker("refresh",{
            	
            	maxDate: new Date(eDay.replace(/-/g, "-"))
            }).val();
        }
        sDate.datepicker({
        	minDate: 0,
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
                alert("start")
            }
        }).val();
        
        /* new Date(sDay.replace(/-/g,"-")) */
        
        /* if (!isValidStr(sDay)) {
        	alert(new Date(sDay.replace(/-/g,"-")));
        	alert(sDay)
            eDate.datepicker("refresh",{
                minDate: "20220925"
            }).val();
        }
        alert('test')
        eDate.datepicker({
        	minDate: 0,
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
                alert('end')
            }
        }).val();
		
	  
		function isValidStr(str) {
			if (str == null || str == undefined || str == "")
				return true;
			else
				return false;
		}
	  
	} */ 
	
	$("#reserveSearch").click(function() {
		var sendDate = {
				reserveStartDatee : $('#datepicker1').val(),
				reserveEndDatee : $('#datepicker2').val(),
				count : $('#animalcnt').val()
		}
		
		$.ajax({
			url: "searchRoom.do",
			type: "POST",
			data: sendDate,
			success: function(data){
				$('#show').remove();
				$('#showRoom').html(data);
				
			}
		});
		
		
		
	});
</script>
</div>
<div id="footer" align="center">
<jsp:include page="../footer.jsp"></jsp:include>
</div>
</body>
</html>