<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
});//ready()
</script>

</head>
<body>
<%
	String[] blockIp = {"192.168.10.212", "192.168.10.213",
						"192.168.10.218", "192.168.10.216",
						"192.168.10.222", "192.168.10.225",
						"192.168.10.229", "192.168.10.230"};

	String connectIp = request.getRemoteAddr();	//접속자 IP address 받기
	
	for(String ip: blockIp){
		if(ip.equals(connectIp)){
			response.sendRedirect("https://www.police.go.kr/index.do");
			return;
		}//if
	}//f
%>
<div id="wrap">
<h2>request(javax.servlet.HttpRequest) 내장객체 사용</h2>
<ul>
	<li>요청 방식: <%= request.getMethod() %></li>
	<li>요청 URL: <%= request.getRequestURL() %></li>
	<li>요청 protocol: <%= request.getProtocol() %></li>
	<li>요청 서버명: <%= request.getServerName() %></li>
	<li>요청 서버포트: <%= request.getServerPort() %></li>
	<li>요청 URI: <%= request.getRequestURI() %></li>
	<li>요청 파일 경로 얻기: <%= request.getServletPath() %></li>
	<!-- 본인 컴퓨터로 접속하는 경우에는 IPv6의 주소(0:0:0:0:0:0:0:1)가 나옴
		외부 컴퓨터에서 접속하는 경우에는 IPv4의 주소(192.168.10.214)가 나옴 -->
	<li>접속자 IP address: <%= request.getRemoteAddr() %></li>
	<li>접속자 port Number: <%= request.getRemotePort() %></li>
	<li>QueryString 얻기: <%= request.getQueryString() %></li>
	<li>이름이 유일한 web parameter: <%= request.getParameter("name") %></li>
	<!-- 이름이 중복되면 가장 앞에 있는 값을 얻는다 -->
	<li>이름이 중복되는 web parameter: <%= request.getParameter("age") %></li>
	<li>이름이 중복되는 web parameter: 
		<% 
			String[] ages = request.getParameterValues("age");
			//최초 요청이거나, age가 존재하지 않는 경우 배열에 null이 할당됨
			if(ages != null){
				for(String age: ages){
					out.print(age);
					out.print(" ");
				}//f
			}//if
		%>
	</li>
</ul>
<a href="http://192.168.10.214/jsp_prj/day1007/request.jsp?name=kim&age=20&age=21">요청</a>
<a href="http://192.168.10.214/jsp_prj/day1007/request.jsp?name=kim&age=20&age=21">요청</a>
<form method="post" action="request.jsp" enctype="application/x-www-form-urlencoded">
<!-- 자신 페이지를 다시 요청할 때에는 action 속성을 생략할 수 O -->
<input type="hidden" name="name" value="park"/>
<input type="hidden" name="age" value="25"/>
<input type="hidden" name="age" value="26"/>
<button id="btn" class="btn btn-outline-primary btn-sm">POST방식 요청</button>
</form>
</div>

</body>
</html>