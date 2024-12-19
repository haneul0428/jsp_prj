<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ site_kor }</title>

<link rel="shortcut icon" href="${ defaultURL }common/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ defaultURL }common/css/main_20240911.css">

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
ul {
    list-style-type: none;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
}
li {
    display: flex;
    margin: 3px;
    padding: 30px;
    border: 1px solid #A9A9A9;
    border-radius: 8px;
    background-color: #EAEAEA;
    width: 16px;
    height: 16px;
    justify-content: center;
    align-items: center;
}
li:hover {
    background-color: #FFBBBB;
}
#screenContainer{
	display: flex;
	margin-bottom: 50px;
	border: 1px solid #C9C9C9;
	width: 1000px;
	height: 60px;
    justify-content: center;
    align-items: center;
}
</style>

<script type="text/javascript">
$(function(){
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
<div id="cgvReservationContainer" style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
	<div id="screenContainer">Screen</div>
	<div id="seatContainer">
		<% for(char c='A'; c<='J'; c++) { %>
	    	<ul>
	        <% for(int i=1; i<=14; i++) { %>
	            <li id="<%= c %><%= i %>" style="<%= (i == 3||i == 11)?"margin-right: 40px;":"" %>">
	            	<%= c %><%= i %>
	            </li>
	        <% }//f %>
	    	</ul>
		<% } %>
	</div>
</div>
</div>

</body>
</html>