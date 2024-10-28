<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="multipart/form-data 인 경우 web parameter가 전달되지 X"
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
<%-- 
web parameter가 전달되지 X
업로더: <%= request.getParameter("uploader") %><br/>
EL: ${ param.uploader }<br/>
 --%>
요청방식: <%= request.getMethod() %><br/>
<%
	//1. 업로드 파일을 저장할 디렉토리를 생성하고 경로 얻기
 	File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
	
	//2. 업로드할 파일의 최대 크기 설정 (byte > KByte > MByte > GByte > TByte)
	int maxSize = 1024 * 1024 * 1;	//byte * KByte * ? MByte
	
	//3. File upload Component를 생성 - 생성과 동시에 파일이 업로드 됨
	
	
%>
 
</div>

</body>
</html>