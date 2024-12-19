<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ site_kor }</title>

<link rel="shortcut icon" href="${ defaultURL }common/images/favicon.ico">

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- 외부 CSS -->
<link href="http://localhost/jsp_prj/movie/common/css/common.css" rel="stylesheet" type="text/css">
<link href="http://localhost/jsp_prj/movie/common/css/header.css" rel="stylesheet" type="text/css">
<link href="http://localhost/jsp_prj/movie/common/css/sideMenu.css" rel="stylesheet" type="text/css">

<style type="text/css">
.inputBox{
	width: 400px;
	height: 40px;
	margin-bottom: 5px;
	padding: 0 10px;
	color: #797979;
}
</style>

<script type="text/javascript">
$(function(){
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
<div id="header">
<jsp:include page="/movie/common/jsp/header.jsp"/>
</div>

<div id="sideMenuContainer">
<jsp:include page="/movie/common/jsp/sideMenu.jsp"/>
</div>

<div id="container" style="display: flex; align-items: center; flex-direction: column; background-color: #C4D5B6;">
	<h6 style="align-self: flex-start; margin-bottom: 30px;">회원 상세보기</h6>
	<div id="cusDetail" style="display: flex; justify-content: center; background-color: #E4B5D8; width: 80%;">
	<form>
		<table style="margin: 10px;">
			<tr>
				<td><label>프로필사진</label></td>
				<td><img src="./common/images/search.png" style="width: 150px; height: 150px; margin-bottom: 5px;"/></td>
			</tr>
			<tr>
				<td><label>ID</label></td>
				<td><input type="text" class="inputBox" value="test"/></td>
			</tr>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" class="inputBox" value="테스트"/></td>
			</tr>
			<tr>
				<td><label>닉네임</label></td>
				<td><input type="text" class="inputBox" value="아에"/></td>
			</tr>
			<tr>
				<td><label>휴대폰번호</label></td>
				<td><input type="text" class="inputBox" value="010-1234-5678"/></td>
			</tr>
			<tr>
				<td><label>이메일</label></td>
				<td><input type="text" class="inputBox" value="test@test.com"/></td>
			</tr>
			<tr>
				<td><label>생년월일</label></td>
				<td><input type="text" class="inputBox" value="2000.01.01"/></td>
			</tr>
			<tr>
				<td><label>성별</label></td>
				<td><input type="radio" name="gender" checked="checked"/> 남 <input type="radio" name="gender"/> 여</td>
			</tr>
			<tr>
				<td><label>가입일</label></td>
				<td><input type="text" class="inputBox" value="2024.11.20"/></td>
			</tr>
			<tr>
				<td><label>상태</label></td>
				<td><input type="radio" name="state" checked="checked"/> 활동 <input type="radio" name="state"/> 탈퇴</td>
			</tr>
		</table>
		<div id="btnContainer" style="text-align: center;">
			<input type="button" value="닫기" class="exitBtn"/>
			<input type="button" value="수정" class="updateBtn"/>
			<input type="button" value="탈퇴" class="stateBtn"/><!-- 탈퇴한 회원에게는 활동으로 보이게 -->
		</div>
	</form>
	</div>
</div>

</div>

</body>
</html>