<%@page import="day1001.ImgVO"%>
<%@page import="java.util.List"%>
<%@page import="day1001.DataProcess"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scriptlet과 expression 연습"%>
<!-- isELIgnored="true" 을 할 경우 ``을 쓸 수 있지만 잘 하지 X -->    

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
#output{ font-size: 19px; border: 1px solid #333; width: 100px; }
</style>

<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		printDate();
	});//click
});//ready()

function printDate() {
	var year = $("#year").val();
	var month = $("#month").val();
	var day = $("#day").val();
	
	$("#output").html(year + "-" + month + "-" + day);
	//$("#output").html(`${year}년 ${month}일 ${day}일`);
}//printDate()
</script>

</head>
<body>

<div id="wrap">
<%-- 
<%
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
%>
<select>
	<% for(int i=0; i<10; i++){ %>
	<option><%= year+i  %></option>
	<% } %>
</select> 
--%>
<%
	LocalDate ld = LocalDate.now();
	int nowYear = ld.getYear();	//올해
	int nowYear2 = Calendar.getInstance().get(Calendar.YEAR);
	
	int nowMonth = ld.getMonthValue();	//이번 월
	
	int nowDay = ld.getDayOfMonth();	//오늘
	int lastDay = Calendar.getInstance().getActualMaximum(Calendar.DATE);	//마지막 일
	log("마지막 날: " + lastDay);
%>

<select name="year" id="year">
<%for(int year=nowYear; year>1949; year--){ %>
<option value="<%= year %>"><%= year %></option>
<%}//f %>
</select>년

<select name="month" id="month">
<%for(int month=1; month<13; month++){ %>
<option value="<%= month %>"<%= (month==nowMonth)?" selected='selected'":"" %>><%= month %></option>
<%}//f %>
</select>월

<select name="day" id="day">
<%for(int day=1; day<lastDay+1; day++){ %>
<option value="<%= day %>"<%= (day==nowDay)?" selected='selected'":"" %>><%= day %></option>
<%}//f %>
</select>일

<input type="button" value="날짜 얻기" class="btn btn-outline-primary btn-sm" id="btn"/>
<div id="output" style="height: 40px"></div>

<div>
<% for(int i=1; i<7; i++){ %>
<img src="http://192.168.10.214/jsp_prj/day1001/images/dice_<%= i %>.png">
<% } %>
</div>

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
		<%for(int score=0; score<11; score++){ %>
		<input type="radio" name="score<%= i+1 %>" value="<%= score %>"<%=
									score==0?" checked='checked'":"" %>/><%= score %>점 
		<%} %>
	</td>
</tr>
<%} %>
</tbody>
</table>
</div>

<%
	//list에 저장된 이미지와 설명을 Card로 출력
	DataProcess dp = new DataProcess();
	List<ImgVO> list = dp.searchData();
	
	if(list.isEmpty()){
%>
		<marquee>로딩된 이미지가 없습니다.</marquee>
<%
	}//if
	
	for(ImgVO iVO : list){
%>
<div class="card" style="width: 18rem; float:left;">
	<img src="http://192.168.10.214/jsp_prj/day1001/images/<%= iVO.getImg() %>" class="card-img-top" alt="..."
		style="width: 260px; height: 260px;">
	<div class="card-body">
		<p class="card-text"><%= iVO.getInfo().length()>50?iVO.getInfo().substring(0, 49)+"...":iVO.getInfo() %></p>
	</div>
</div>
<%	}//f %>


<%
//scriptlet에서는 method를 작성할 수 X
/* 	public void test(){
	
	}//text() */
%>

</div>

</body>
</html>