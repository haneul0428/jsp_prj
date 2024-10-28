<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="내부 요청인지 외부 요청인지 판단하는 일"
    %>
<%
	//web parameter로 생성된 한글은 전송될 때 깨져서 보임 --> request 객체의 charset을 encoding 해야 함
	request.setCharacterEncoding("UTF-8");
	String movePage = "kor.jsp";
	String lang = "한국어";	//web parameter로 전송
	
	if(!"localhost".equals(request.getServerName())){
		movePage = "eng.jsp";
		lang = "english";
	}//if
%>

<%-- jsp:forward 안에서는 jsp:param 표준액션태그만 넣을 수 O --> 주석도 XX (예.<!-- 파라메터 전송 -->) --%>
<jsp:forward page="<%= movePage %>">
	<jsp:param value="<%= lang %>" name="lang"/>
</jsp:forward>
