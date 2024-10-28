<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그인 폼"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
<script src="http://192.168.10.214/jsp_prj/login/js/color-modes.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>로그인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="http://192.168.10.214/jsp_prj/login/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<meta name="theme-color" content="#712cf9">
    
<!-- Custom styles for this template -->
<link href="http://192.168.10.214/jsp_prj/login/sign-in.css" rel="stylesheet">

<script type="text/javascript">
/*	
   아이디에서 엔터가 눌려졌을 때 아이디에 값이 존재하면 커서를 아래 패스워드에 이동(값이 없으면 움직이지 X) 
   비밀번호에서 엔터가 눌려졌을 때 아이디에 값이 존재하고 비밀번호에 값이 존재하면 "alert창으로 로그인 이동"을 출력
   - 아이디가 없으면 아이디로 커서 이동
   - 비번이 없다면 동작하지 X
   
   로그인
   - 아이디가 없으면 아이디로 커서 이동
   - 비번이 없다면 비번으로 커서를 이동
   아이디와 비번이 존재하면 "alert창을 로그인 이동"을 출력
*/
window.onload = function() {
	document.getElementById("id").addEventListener("keyup", enterKey);
	document.getElementById("pass").addEventListener("keyup", enterKey);
	document.getElementById("btnLogin").addEventListener("click", chkNull);
}//onload

function enterKey(evt){
	if(evt.which == 13){
		chkNull();
	}//if
}//enterKey(evt)

function chkNull(){
	var obj = document.loginFrm;
	
	var idNode = obj.id; 
	
	if(idNode.value.replaceAll(/ /g, "") == ""){
		idNode.value = "";
		idNode.focus();
		return;
	}//if
	
	var passNode = obj.pass;
	if(passNode.value.replaceAll(/ /g, "") == ""){
		passNode.value = "";
		passNode.focus();
		return;
	}//if
	
	$("#loginFrm").submit();
}//chkNull()
</script>

</head>
<body class="d-flex align-items-center py-4 bg-body-tertiary">
    
<main class="form-signin w-100 m-auto">
<form name="loginFrm" id="loginFrm" action="login_frm_process.jsp" method="post">
	<h1 class="h3 mb-3 fw-normal">로그인</h1>

	<div class="form-floating">
		<input type="email" class="form-control" name="id" id="id" placeholder="name@example.com">
	</div>
	<div class="form-floating">
		<input type="password" class="form-control" name="pass" id="pass" placeholder="Password">
	</div>

	<input id="btnLogin" type="button" class="btn btn-primary w-100 py-2" value="로그인"/>
</form>
</main>
<script src="http://192.168.10.214/jsp_prj/login/js/bootstrap.bundle.min.js"></script>

</body>
</html>
