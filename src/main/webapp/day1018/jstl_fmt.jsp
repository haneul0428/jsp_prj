<%@page import="day1018.ProductVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="jstl -- fmt"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	//숫자변환
	int num = 20241018;
	pageContext.setAttribute("num", num);
	
	//날짜변환
	Date date = new Date();
	pageContext.setAttribute("date", date);
	
	//VO 객체 생성
	ProductVO pVO = new ProductVO(1241, "img2.jpg", 1500000, new Date());
	pageContext.setAttribute("pVO", pVO);
%>
<c:out value="${ num }"/><br/>
0패턴: <fmt:formatNumber value="${ num }" pattern="0,000,000,000"/><br/>
#패턴: <fmt:formatNumber value="${ num }" pattern="#,###,###,###"/><br/>

<div>
<fmt:formatDate value="${ date }" pattern="yyyy-MM-dd a HH(hh):mm:ss EEEE"/>
</div>
<br/>

<div style="border: 1px solid #333; width: 400px;">
	<img src="${ pVO.img }" alt="${ pVO.img }"/><br/>
	<table>
		<tr>
			<td>번호: <c:out value="${ pVO.itemNo }"/></td>
			<td>가격: <fmt:formatNumber value="${ pVO.price }" pattern="###,###,###"/></td>
		</tr>
		<tr>
			<td>발행일: <fmt:formatDate value="${ pVO.date }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			<td></td>
		</tr>
	</table>
</div>
</div>

</body>
</html>