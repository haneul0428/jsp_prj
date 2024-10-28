<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="쿠키들 읽기(request)"
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
<%
	//1. 쿠키들 읽기 (Toncat에서는 > JSESSIONID 라는 테스트용 쿠키가 만들어짐)
	Cookie[] cookies = request.getCookies();
	
	boolean readFlag = false;	//읽어들인 쿠키가 있는지 판단
	
	//System.out.println(cookies.length);
	if(cookies != null){
		
		String cookieName = "";
		String cookieValue = "";
		
		//2. 읽어들인 쿠키를 반복
		for(Cookie tempCookie : cookies){
			
			//3. 쿠키 이름 얻기
			cookieName = tempCookie.getName();
			
			if(!"JSESSIONID".equals(cookieName)){	//접속자의 브라우저에서 쿠키가 생성되는지 판단
				
				readFlag = true;
				
				//4. 쿠키 값 얻기
				cookieValue = tempCookie.getValue();
				%>
				쿠키명: <%= cookieName %>, 쿠키값: <%= cookieValue %><br/>
				<%
			}//if
			
		}//f
		
	}//if
	
	if(!readFlag){	//쿠키가 없음
		%>
		<h2>쿠키가 존재하지 않습니다.</h2>
		쿠키 <a href="add_cookie.jsp">심기</a>
		<%
	} else {
		%>
		쿠키 <a href="remove_cookie.jsp">삭제</a>
<%
	}//if~el
%>
</div>

</body>
</html>