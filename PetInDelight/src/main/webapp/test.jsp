<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Javascript Demo</title>
<style>
    #layerTest {
    	display: none;
    }
</style>
</head>
<body>
<div>
    <a href="javascript:;" id="myTest" title="새창 열림" onclick="lyOpen()">테스트</a>
    <input type="text" id="myTextField1" value="Text field1">    
    <input type="text" id="myTextField2" value="Text field2">
</div>
<div id="layerTest">
    <p>레이어 테스트. 디자인은 무시합니다.</p>
    <a href="javascript:;" id="myClose" onclick="lyClose()">닫기</a>
</div>
<div>
    <input type="text" id="myTextField3" value="Text field3">
</div>
<script> 
   
    function lyOpen(){
        document.getElementById("layerTest").style.display = "block";
        document.getElementById("myClose").focus(); //주석처리 시 myTextField1, myTextField2 지난 후 레이어로 이동
    }
   
    function lyClose(){
    	document.getElementById("layerTest").style.display = "none";
        document.getElementById("myTest").focus(); //주석처리 시 myTextField3로 이동
    }
   
</script>
</body>
</html>
출처: https://travelpark.tistory.com/73 [Bon Voyage!:티스토리]