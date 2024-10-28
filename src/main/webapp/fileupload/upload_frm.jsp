<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="http://192.168.10.214/jsp_prj/common/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="http://192.168.10.214/jsp_prj/common/css/main_20240911.css">

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">

</style>

<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		chkNull();
	});
});//ready()

function chkNull() {
	if($("#uploader").val() == ""){
		alert("업로더는 필수 입력입니다.");
		$("#uploader").focus();
		return;
	}//if
	
	if($("#upfile").val() == ""){
		alert("업로드 파일은 필수 입력입니다.");
		return;
	}//if
	
	$("#frm").submit();
}//chkNull()
</script>

</head>
<body>

<div id="wrap">
<%-- 웹 파라미터 전송방식에서 file전송방식으로 변경 --%>
<form action="upload_process.jsp" method="post" id="frm" name="frm" >
	<label>업로더</label>
	<input type="text" name="uploader" id="uploader"/><br/>
	<label>파일</label>
	<input type="file" name="upfile" id="upfile"/><br/>
	<input type="button" value="업로드" id="btn" class="btn btn-sm btn-outline-primary"/>
</form>
</div>

</body>
</html>