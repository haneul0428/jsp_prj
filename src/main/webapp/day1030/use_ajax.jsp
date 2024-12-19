<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
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
	$("#btnTxt").click(function() {
		$.ajax({
			url: "text.txt",
			type: "get",
			dataType: "text",
			error: function(xhr) {
				alert(xhr.status + " / " + xhr.statusText);
			},
			success: function(data) {
				$("#output").html(data);
			}
		});//ajax
	});
	
	$("#btnHtml").click(function() {
		$.ajax({
			url: "response_html.html",
			type: "get",
			dataType: "html",
			error: function(xhr) {
				alert(xhr.status + " / " + xhr.statusText);
			},
			success: function(data) {
				$("#output").html(data);
			}
		});//ajax
	});
	
	$("#btnXml").click(function() {
		$.ajax({
			url: "response_xml.xml",
			type: "get",
			dataType: "xml",
			error: function(xhr) {
				alert(xhr.status);
			},
			success: function(data) {
				var msg = $(data).find("msg").text();
				$("#output").html(msg);
			}
		});//ajax
	});
	
	$("#btnJson").click(function() {
		$.ajax({
			url: "response_json.json",
			type: "get",
			dataType: "json",
			error: function(xhr) {
				alert(xhr.status + " / " + xhr.statusText);
			},
			success: function(data) {
				$("#output").html(data.msg);
			}
		});
	});
	
	$("#btnTxt2").click(function() {
		$.ajax({
			url: "response_text.jsp",
			type: "get",
			dataType: "text",
			error: function(xhr) {
				alert(xhr.status + " / " + xhr.statusText);
			},
			success: function(data) {
				$("#output").html(data);
			}
		});
	});
	
	$("#btnHtml2").click(function() {
		$.ajax({
			url: "response_html.jsp",
			type: "get",
			dataType: "html",
			error: function(xhr) {
				alert(xhr.status + " / " + xhr.statusText);
			},
			success: function(data) {
				$("#output").html(data);
			}
		});
	});
	
	$("#btnXml2").click(function() {
		$.ajax({
			url: "http://192.168.10.214/jsp_prj/day1030/response_xml.jsp",
			type: "post",
			dataType: "xml",
			error: function(xhr) {
				alert(xhr.status + " / " + xhr.statusText);
			},
			success: function(data) {
				$("#output").html($(data).find("msg").text());
			}
		});
	});
	
	$("#btnJson2").mouseover(function() {
		$.ajax({
			url: "http://192.168.10.214/jsp_prj/day1030/response_json.jsp",
			type: "post",	/* get | post */
			dataType: "json",
			error: function(xhr) {
				alert(xhr.status + " / " + xhr.statusText);
			},
			success: function(data) {
				$("#output").html(data.msg);
			}
		});
	});
});//ready()
</script>

</head>
<body>

<div id="wrap">
	<div id="output" style="height: 80px; border: 1px solid #333"></div>
	<input type="button" class="btn btn-outline-primary" value="TEXT" id="btnTxt"/>
	<input type="button" class="btn btn-outline-secondary" value="HTML" id="btnHtml"/>
	<input type="button" class="btn btn-outline-success" value="XML" id="btnXml"/>
	<input type="button" class="btn btn-outline-danger" value="JSON" id="btnJson"/>
	<br/>
	<strong>JSP의 contentType 속성</strong><br/>
	<input type="button" class="btn btn-outline-primary" value="TEXT" id="btnTxt2"/>
	<input type="button" class="btn btn-outline-secondary" value="HTML" id="btnHtml2"/>
	<input type="button" class="btn btn-outline-success" value="XML" id="btnXml2"/>
	<input type="button" class="btn btn-outline-danger" value="JSON" id="btnJson2"/>
</div>

</body>
</html>