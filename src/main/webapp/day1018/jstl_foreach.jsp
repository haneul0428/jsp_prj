<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="반복문 -- forEach: begin(시작)~end(끝)까지의 값을 사용 할 수 O"
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
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
	<%-- 1씩 증가 --%>
	<c:forEach var="i" begin="0" end="10" step="1">
		<c:out value="${ i }"/>
	</c:forEach>
	<br/>
	<%-- 2씩 증가 --%>
	<c:forEach var="i" begin="0" end="10" step="2">
		<c:out value="${ i }"/>
	</c:forEach>
	<br/>
	<%-- 3씩 증가 --%>
	<c:forEach var="i" begin="0" end="10" step="3">
		<c:out value="${ i }"/>
	</c:forEach>
	<br/>
	
	<select>
	<c:forEach var="i" begin="1" end="100" step="1">
		<option value="${ i }"><c:out value="${ i }"/></option>
	</c:forEach>
	</select>
</div>

</body>
</html>