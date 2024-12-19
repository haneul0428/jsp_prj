<%@page import="java.util.List"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.net.URL"%>
<%@page import="org.jdom2.Document"%>
<%@page import="org.jdom2.input.SAXBuilder"%>
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
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
<select name="name">
<%
	//1. builder 생성
	SAXBuilder builder = new SAXBuilder();
	
	//2. XML 문서 객체 얻기
	Document doc = builder.build(new URL("http://192.168.10.214/jsp_prj/day1105/parsing2.xml"));
	
	//3. 최상위 근노드 얻기
	Element namesNode = doc.getRootElement();
	
	//4. 자식노드들 얻기 (getChildren())
	//List<Element> list = namesNode.getChildren();
	List<Element> list = namesNode.getChildren("name");	//name만 가져옴 --> <name />
	
	for(Element nameNode : list){
		//5. 반복해 parsing
	%>
		<option value="<%= nameNode.getValue() %>"><%-- <%= nameNode.getName() %>,  --%><%= nameNode.getValue() %></option>
	<%
	}//f
%>
</select>
</div>

</body>
</html>