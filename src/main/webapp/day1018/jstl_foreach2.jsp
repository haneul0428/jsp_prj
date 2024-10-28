<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<%
		//1. 배열, Collection 객체 생성
		String[] arr = {"Java SE", "DBMS", "JDBC", "HTML"};
		List<String> list = new ArrayList<String>();
		list.add("JSP Tag's");
		list.add("내장객체");
		list.add("표준액션태그");
		list.add("EL");
		list.add("JSTL");
			
		//2. scope 객체에 저장 --> 배열과 list를 EL에서 사용하기 위해
		pageContext.setAttribute("arrSubject", arr);
		pageContext.setAttribute("listJSP", list);
	%>
	<%--
	${ arrSubject }<br/>
	${ listJSP }<br/>
	--%>
	<%-- 반복 --%>
	<c:forEach var="subject" items="${ arrSubject }" varStatus="i">
<%-- 	<c:set var="i" value="${ i+1 }"/> --%>
<%-- 	<c:out value="${ i.index }"/>. <input type="text" value="${subject }"/><br/><!-- 0. 1. 2. ,, --> --%>
<%-- 	<c:out value="${ i.count }"/>. <input type="text" value="${subject }"/><br/><!-- 1. 2. 3. ,, --> --%>
<%-- 	<c:out value="${ i.first }"/><!-- true false false false --> --%>
<%-- 	<c:out value="${ i.last }"/><!-- false false false true --> --%>
<%-- 	<c:out value="${ subject }"/> --%>
		<c:out value="${ i.count }"/>. 
		<input type="text" value="${subject}"${i.first?" readonly='readonly'":""}${i.count eq 2?" autofocus='autofocus'":""}/><br/>
	</c:forEach>
	
	<%-- list의 값을 체크박스로 만들어 출력 --%>
	<%-- <!-- self code -->
	<c:forEach var="chkList" items="${ listJSP }" varStatus="j">
		<input type="checkbox" value="${ chkList }"/><c:out value="${ chkList }"/>
	</c:forEach>
	 --%>
	<c:forEach var="element" items="${ listJSP }">
		<input type="checkbox" value="${ element }"/><c:out value="${ element }"/>
	</c:forEach>
</div>

</body>
</html>