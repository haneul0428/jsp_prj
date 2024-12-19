<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/jsp/session_chk.jsp" %>
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
		//유효성 검증 ~~
		$("#frm").submit();
	});
});//ready()
</script>

</head>
<body>

<div id="wrap">
<div id="header">
	<c:import url="../common/jsp/header.jsp"/>
</div>

<div id="container">
	<form action="rest_frm_process.jsp" method="post" name="frm" id="frm">
	<table class="table">
		<tr>
			<th colspan="2"><h2>맛집 추가</h2></th>
		</tr>
		<tr>
			<td>식당명</td>
			<td><input type="text" name="restaurant" id="restaurant"/></td>
		</tr>
		<tr>
			<td>대표메뉴</td>
			<td><input type="text" name="menu" id="menu"/>(예: 제육볶음)</td>
		</tr>
		<tr>
			<td>설명</td>
			<td><input type="text" name="info" id="info" style="width: 500px;"/>(예: 더 이상의 자세한 설명은 생략한다.)</td>
		</tr>
		<tr>
			<td>위도(lat)</td>
			<td><input type="text" name="lat" id="lat" style="width: 100px;"/>(예: 37.xxxx)</td>
		</tr>
		<tr>
			<td>경도(lng)</td>
			<td><input type="text" name="lng" id="lng" style="width: 100px;"/>(예: 127.xxxx)</td>
		</tr>
		<tr><!-- 37.4972255 127.0340481 : 우쿠야
				37.4975164 127.0310774 : 고등어식당
				37.4989437 127.037084 : 부산아지매국밥 -->
			<td colspan="2" style="text-align: center;">
				<input type="button" value="식당추가" id="btn" class="btn btn-outline-success btn-sm"/>
				<a href="javascript:history.back()" class="btn btn-outline-info btn-sm">뒤로</a>
			</td>
		</tr>
	</table>
	</form>
</div>

<div id="footer">
	<c:import url="../common/jsp/footer.jsp"/>
</div>
</div>

</body>
</html>