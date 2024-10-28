<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원가입 폼 HTML Form Control 값받기"
    %>
<%
	//POST 방식 한글처리
	request.setCharacterEncoding("UTF-8");
%>
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
#info{ border: 1px solid #AAA; padding: 5px; width: 500px; }
</style>

<script type="text/javascript">
$(function(){
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
	<h2>회원정보</h2>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String cellphone = request.getParameter("cellphone");
	String email = request.getParameter("email");
	String email2 = request.getParameter("email2");
	String gender = request.getParameter("gender");
	String[] lang = request.getParameterValues("lang");
	String location = request.getParameter("location");
	String zipcode = request.getParameter("zipcode");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
%>
<%= name %>회원님 회원가입을 축하합니다.<br/>
입력정보<br/>
<div id="info">
아이디: <%= id %><br/>
비밀번호: <%= pass %><br/>
생일: <%= birth %><br/>
연락처: <%= tel %><br/>
휴대폰: <%= cellphone %><br/>
이메일: <%= email %>@<%= email2 %><br/>
성별: <%= gender %><br/>
관심언어: 
<ul>
<%if(lang == null){%>
	<li>관심있는 언어가 없습니다.</li>
<%} else { 
	for(String selectLang : lang){
%>		
	<li><%= selectLang %></li>
<% 
	}//f
}//if~el %>
</ul>
소재지: <%= location %><br/>
우편번호: <%= zipcode %><br/>
주소: <%= addr1 %><br/>
상세주소: <%= addr2 %>
</div>
</div>

</body>
</html>