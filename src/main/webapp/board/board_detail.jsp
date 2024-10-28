<%@page import="kr.co.sist.user.board.BoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	//실제 글의 고유 번호를 받음
	String tempNum = request.getParameter("num");
	
	int num = 0;
	
	try{
		num = Integer.parseInt(tempNum);
		
	} catch(NumberFormatException nfe) {
		response.sendRedirect("board_list.jsp");
		return;
	}//try~ca
	
	//입력된 글 번호로 상세조회 수행
	BoardDAO bDAO = BoardDAO.getInstance();
	
	BoardVO bVO = null;
			
	try{
		bVO = bDAO.selectDetailBoard(num);
	} catch (SQLException se) {
		se.printStackTrace();
	}//try~ca
	
	pageContext.setAttribute("bVO", bVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="http://192.168.10.214/jsp_prj/common/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="http://192.168.10.214/jsp_prj/common/css/main_20240911.css">

<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs5.min.js"></script>

<style type="text/css">

</style>

<script type="text/javascript">
if(${ empty bVO }){	//bVO가 null이라면, 실패 (true/false)
	alert("글 읽기 도중 문제가 발생했습니다.");
	location.href="board_list.jsp";
}//if

$(function(){
	$("#content").summernote({
		placeholder: "쓰고 싶은 글을 써 주세요.",
		tabsize: 2,
		height: 240,
		width:490,
		toolbar: [
 			["style", ["style"]],
 			["font", ["bold", "underline", "clear"]],
 			["insert", ["picture"]],
 			["view", ["codeview", "help"]]
 		]
	});
	
	$("#btnWrite").click(function(){
		chkNull();
	});
	
	$("#btnList").click(function(){
		var url = "../board/board_list.jsp?currentPage=${ param.currentPage }";
		
		if(${ not empty param.keyword }){
			url += "&field=${ param.field }&keyword=${ param.keyword }";
		}//if
		
		location.href = url;
	});
	
	$("#btnUpdate").click(function(){
		movePage('u');
	});
	
	$("#btnDelete").click(function(){
		movePage('d');
	});
  
});//ready()

function movePage(flag) {
	//<form>태그의 action을 변경 document.폼이름.actin="변경할action"
	//<form>태그의 method 변경 document.폼이름.method="변경할요청방식 get|post"
	var action = "board_update.jsp";
	var msg = "글을 수정하시겠습니까?";
	
	if(flag == 'd'){
		action = "board_delete.jsp";
		msg = "정말 글을 삭제하시겠습니까?";
	}//if
	
	if(confirm(msg)){	//사용자에게 한번 더 확인을 거침
		//플래그 객체의 action 속성을 변경
		document.readFrm.action = action;
		
		//alert($("#content").val().length);
		//변경은 제목과 내용이 존재하는지 판단해야함: summernote --> <p><br></p> 를 가짐
		if(flag = 'u'){
			if($("#content").val().length < 15){
				alert("내용은 필수입력입니다.");
				return;
			}//if
		}//if
		
		$("#readFrm").submit();	//form을 전송
		
//		alert(document.readFrm.action);
//		alert(document.readFrm.method);
	}//if
	
}//movePage()

function chkNull(){
	if($("#subject").val().trim()==""){
		alert("제목은 필수 입력");
		$("#subject").focus();
		return;
	}//if
	
	if($("#content").val().trim()==""){
		alert("내용은 필수 입력");
		return;
	}//if
	
	$("#readFrm").submit();
}//chkNull

</script>

</head>
<body>

<div id="wrap">
<div id="header">
<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp"/>
</div>
<div id="contentDiv">
<div id="writeFrmDiv">
<form name="readFrm" id="readFrm" method="post">
	<table>
		<tr>
			<th colspan="2"><h2>글읽기</h2></th>
		</tr>
		<tr>
			<td style="width: 80px;">제목</td>
			<td style="width: 400px;">
				<input type="text" id="subject" name="subject" value="${ bVO.subject }" 
					style="width: 390px;" autofocus="autofocus"/>
			</td>
		</tr>
		<tr>
			<td style="width: 80px;">내용</td>
			<td>
				<textarea id="content" name="content">${ bVO.content }</textarea>
			</td>
		</tr>
		<tr>
			<td style="width: 80px;">작성자</td>
			<td><c:out value="${ bVO.writer }"/></td>
		</tr>
		<tr>
			<td style="width: 80px;">작성일</td>
			<td><fmt:formatDate value="${ bVO.input_date }" pattern="yyyy-MM-dd a hh:mm:ss E"/></td>
		</tr>
		<tr>
			<td style="width: 80px;">ip</td>
			<td>
				<c:out value="${ bVO.ip }"/>
				
				<%-- 사용자에게 보여주지 않고 값을 넘김 --%>
				<input type="hidden" name="num" value="${ bVO.num }"/>
				<input type="hidden" name="currentPage" value="${ param.currentPage }"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<c:if test="${ bVO.writer eq userData.id }">
				<input type="button" id="btnUpdate" value="글수정" class="btn btn-sm btn-outline-success"/>
				<input type="reset"  id="btnDelete" value="글삭제" class="btn btn-sm btn-outline-danger"/>
				</c:if>
				<input type="button" id="btnList" value="리스트" class="btn btn-sm btn-outline-warning"/>
			</td>
		</tr>
	</table>
</form>
</div>
</div>
</div>

</body>
</html>