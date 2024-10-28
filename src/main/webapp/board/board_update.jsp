<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/jsp/session_chk.jsp" %>
<%@ include file="../common/jsp/post_chk.jsp" %>
<jsp:useBean id="bVO" class="kr.co.sist.user.board.BoardVO" scope="page"/>
<jsp:setProperty name="bVO" property="*"/>
<%-- setPropert했을 때, 글번호, 글제목(필요없음), 내용 3가지를 받음 --%>
<%
	bVO.setWriter(sessionId);
//	out.print(bVO);
	
	BoardDAO bDAO = BoardDAO.getInstance();
	int cnt = 0;
	
	try{
		//0: 실패(num 외부에서 변경), 1: 성공
		cnt = bDAO.updateBoard(bVO);
	} catch(SQLException se) {
		cnt = -1;	//-1: DB에서 문제가 발생
		se.printStackTrace();
	}//try~ca
	
	pageContext.setAttribute("cnt", cnt);	//cnt: -1, 0, 1
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
var msg = "DB에서 문제가 발생했습니다.";
var cnt = ${ cnt };

if(cnt == 0){
	msg = "글번호가 외부에서 임의로 수정되었습니다.";
}//if

if(cnt == 1){
	msg = "글이 수정되었습니다.";
}//if

alert(msg);

if(cnt == -1 || cnt == 0){
	history.back();
} else {
	location.href="board_list.jsp?currentPage=${ param.currentPage }";
}//if~el

$(function(){
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
	
</div>

</body>
</html>