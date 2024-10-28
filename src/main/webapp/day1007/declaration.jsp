<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="JSP에서 class field로 코드를 생성"%>
    
<%!
	//class field
	String name;	//instance variable --> 자동초기화
%>
<%!
	public String getName(){
	
		return name;
	}//getName()
%>
<%!
/* 생성할 타입(radio, checkbox), 라디오버튼의 갯수, 라디오버튼의 이름, checked할 라디오버튼의 번호 */
public String createRadioCheck(String type, int radioCnt, String radioName, int checkedNum){
	
	StringBuilder tempRadio = new StringBuilder();
	
	for(int score=0; score<radioCnt+1; score++){				
		tempRadio.append("<input type='")
					.append(type)
					.append("' name='")
					.append(radioName)
					.append("' value='")
					.append(score)
					.append("'")
					.append(score==checkedNum?" checked='checked'":"")
					.append("/>")
					.append(score)
					.append("점 ");
	}//f
	
	return tempRadio.toString();
	
}//createRadioCheck()
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
	name = "테스트";
%>
이름은: <%= getName() %>입니다.

<div>
<%
String[] names = {"김지훈", "김현우", "이일환", "이인혁", "황찬욱"};
%>
<div style="width: 700px">
<table class="table table-hover">
<thead>
<tr>
	<th style="width: 90px;">이름</th>
	<th style="width: 610px;">점수</th>
</tr>
</thead>
<tbody>
<%for(int i=0; i<names.length; i++){ %>
<tr>
	<td><%= names[i] %></td>
	<td>
		<%= createRadioCheck("radio", 10, "score_"+i, 0) %>
	</td>
</tr>
<%} %>
</tbody>
</table>
</div>
<%= createRadioCheck("checkbox", 5, "temp", 5) %>
</div>

</div>

</body>
</html>