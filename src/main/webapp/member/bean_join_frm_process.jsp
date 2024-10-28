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
<% request.setCharacterEncoding("UTF-8"); %>

<%-- VO 객체 생성 --%>
<jsp:useBean id="mfVO" class="day1016.MemberFormVO" scope="page"/>

<%-- setter method 호출 --%>
<jsp:setProperty property="*" name="mfVO"/>

입력정보<br/>
<jsp:getProperty property="name" name="mfVO"/>회원님 회원가입을 축하합니다.<br/>
아이디: <jsp:getProperty property="id" name="mfVO"/><br/>
비밀번호: <jsp:getProperty property="pass" name="mfVO"/><br/>
생일: <jsp:getProperty property="birth" name="mfVO"/><br/>
연락처: <jsp:getProperty property="tel" name="mfVO"/><br/>
휴대폰: <jsp:getProperty property="cellphone" name="mfVO"/><br/>
이메일: <jsp:getProperty property="email" name="mfVO"/>@<jsp:getProperty property="email2" name="mfVO"/><br/>
성별: <jsp:getProperty property="gender" name="mfVO"/><br/>
관심언어: <ul>
			<li>
			<%
			String[] lang = mfVO.getLang();
			if(lang == null){
				out.println("관심있는 언어가 없습니다.");
			} else {
				for(String temp : lang){
					out.print(temp);
					out.print("<br/>");
				}//f
			}//if~el
			%>
			</li>
		</ul>
소재지: <jsp:getProperty property="location" name="mfVO"/><br/>
우편번호: <jsp:getProperty property="zipcode" name="mfVO"/><br/>
주소: <jsp:getProperty property="addr1" name="mfVO"/><br/>
상세주소: <jsp:getProperty property="addr2" name="mfVO"/><br/>

</div>

</body>
</html>