<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="관리자 - 회원관리"
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

<div id="container" style="background-color: #C4D5B6;">
	<h6>회원관리</h6>
	<div id="searchContainer" style="text-align: center;">
		<select style="width: 130px; height: 40px; text-align: center;">
			<option selected="selected">ID</option>
			<option>이름</option>
			<option>휴대폰번호</option>
		</select>
		<input type="text" placeholder="검색어를 입력해주세요." style="width: 450px; height: 40px; padding-left: 10px;"/>
		<input type="button" id="btnSearch" class="btnSearch" value="검색" style="width: 80px; height: 40px; margin-left: -7px;"/>
		<!-- http://localhost/jsp_prj/movie/common/images/search.png -->
	</div>
	
	<div id="memberList" style="margin-top: 30px; text-align: center;">
	<table class="table">
		<tr>
			<th style="height: 40px;">ID</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>휴대폰번호</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>상태</th>
		</tr>
	<thead>
	</thead>
	<tbody>
		<!-- 테이블 생성.. -->
		<tr>
			<td><a href="#void">test</a></td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-danger btn-sm">탈퇴</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
		<tr>
			<td>test</td>
			<td>김김김</td>
			<td>테스트</td>
			<td>010-1234-5678</td>
			<td>test@test.com</td>
			<td>2024.01.01</td>
			<td><div class="btn btn-success btn-sm">활동</div></td>
		</tr>
	</tbody>
	</table>
	</div>
	
	<div id="paginationContainer" style="background-color: yellow; text-align: center; position: absolute; top: 690px; width: 300px; transform: translateX(50%);">
	ㅁㄴㅇ
	</div>
</div>

</div>

</body>
</html>