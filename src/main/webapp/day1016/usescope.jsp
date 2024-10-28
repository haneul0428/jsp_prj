<%@page import="day1016.CounterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scope 생성 및 사용범위"
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

</style>

<script type="text/javascript">
$(function(){
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
	<%-- <%--: 주석이 보이지 X --%>
	<!-- <!--: 주석이 보임 -->
	
	<%-- 
	객체생성
	page - JSP 페이지가 요청될때마다 객체 생성(누적=카운트X), 생성된 객체는 해다 JSP에서만 사용됨
	request - JSP 페이지가 요청될때마다 객체 생성(누적=카운트X), 생성된 객체는 해당 JSP와 forward로 이동한 JSP에서 사용됨
	session - 웹브라우저마다 하나의 객체가 생성(누적=카운트O), 생성된 객체는 모든 JSP에서 사용됨(다른 사람과 함께 사용 X)
	application - 최초 접속자에 의해 단 하나의 객체가 생성(누적=카운트O), 생성된 객체는 모든 JSP에서 사용됨,
					모든 접속자는 하나의 객체를 사용하게 됨(다른 사람과 함께 사용 O)
	--%>
	<h5>page</h5>
	<!-- scope="page" -->
	<jsp:useBean id="cVO" class="day1016.CounterVO" scope="page"/>
	
	<!-- setter method 호출 > 값할당 -->
	<jsp:setProperty property="cnt" name="cVO" value="1"/>
	
	<!-- getter method 호출 > 웹브라우저 출력 -->
	당신은 이 페이지의 <strong><jsp:getProperty property="cnt" name="cVO"/></strong>번째 방문자입니다.<br/>
	<br/>
	
	<h5>request</h5>
	<!-- scope="request" -->
	<jsp:useBean id="cVO2" class="day1016.CounterVO" scope="request"/>
	
	<!-- setter method 호출 > 값할당 -->
	<jsp:setProperty property="cnt" name="cVO2" value="1"/>
	
	<!-- getter method 호출 > 웹브라우저 출력 -->
	당신은 이 페이지의 <strong><jsp:getProperty property="cnt" name="cVO2"/></strong>번째 방문자입니다.<br/>
<%-- <%
		RequestDispatcher rd = request.getRequestDispatcher("usescope2.jsp");
		rd.forward(request, response);
	%> --%>
	<br/>
	
	<h5>session</h5>
	<!-- scope="session" -->
	<jsp:useBean id="cVO3" class="day1016.CounterVO" scope="session"/>
	
	<!-- setter method 호출 > 값할당 -->
	<jsp:setProperty property="cnt" name="cVO3" value="1"/>
	
	<!-- getter method 호출 > 웹브라우저 출력 -->
	당신은 이 페이지의 <strong><jsp:getProperty property="cnt" name="cVO3"/></strong>번째 방문자입니다.<br/>
	<a href="usescope2.jsp">이동</a>
	<br/>
	
	<h5>application</h5>
	<!-- scope="application" -->
	<jsp:useBean id="cVO4" class="day1016.CounterVO" scope="application"/>
	
	<!-- setter method 호출 > 값할당 -->
	<jsp:setProperty property="cnt" name="cVO4" value="1"/>
	
	<!-- getter method 호출 > 웹브라우저 출력 -->
	당신은 이 페이지의 <strong><jsp:getProperty property="cnt" name="cVO4"/></strong>번째 방문자입니다.<br/>
	<a href="usescope2.jsp">이동</a>
	<br/>
	
	---------------------------<br/>
<%
	//위에 있는 application useBean 객체(cVO4)를 통해 cnt img
	String cnt = String.valueOf(cVO4.getCnt());
	
	for(int i=0; i<cnt.length(); i++){
%>
		<img src="images/num_<%= cnt.charAt(i) %>.png"/>
<%
	}//f
%>
	
</div>

</body>
</html>