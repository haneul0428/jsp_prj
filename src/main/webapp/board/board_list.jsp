<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.user.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.user.board.SearchVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	a{
		color: #000000;
		text-decoration: none;
		font-size: 16px;
	}
	a:hover{
		color: #858585;
		text-decoration: underline;
		font-size: 16px;
	}
</style>

<script type="text/javascript">
$(function(){
	$("#keyword").keyup(function(evt) {
		if(evt.which == 13){	//13: 엔터
			chkNull();
		}//if
	});
	
	$("#btn").click(function() {
		chkNull();
	});
	
	//검색으로 선택한 컬럼명과 키워드를 설정 JSP코드로 작성가능
	if(${ not empty param.keyword }){
		$("#field").val(${ param.field });
		$("#keyword").val("${ param.keyword }");
	}//if
});//ready()

function chkNull() {
	var keyword = $("#keyword").val();
	
	if(keyword.length < 2){
		alert("검색 키워드는 한 글자 이상 입력하셔야합니다.");
		return;
	}//if
	
	$("#searchFrm").submit();
	
}//chkNull()

function loginMove() {
	if(confirm("로그인한 사용자만 글쓰기가 가능합니다.\n로그인하시겠습니까?")){
		location.href="../login/login_frm.jsp";
	}//if
}//loginMove()
</script>

</head>
<body>

<div id="wrap">
<div id="header">
<c:import url="http://localhost/jsp_prj/common/jsp/header.jsp"/>
</div>
<div style="width: 970px;">
	<h2>사용자 자유 게시판</h2>
	<jsp:useBean id="sVO" class="kr.co.sist.user.board.SearchVO" scope="page"/>
	<jsp:setProperty property="*" name="sVO"/>
	<%
		//dynamic query를 생성하기위한 검색값을 설정
		//sVO.setField(BoardUtil.numToField(sVO.getField()));
		
		//게시판 리스트 구현
		//1. 총 레코드 수 구하기
		int totalCount = 0;	//총 레코드 수
		
		BoardDAO bDAO = BoardDAO.getInstance();
		try{
			totalCount = bDAO.selectTotalCount(sVO);
		} catch(SQLException se){
			se.printStackTrace();
		}//try~ca
		
		//2. 한 화면에 보여줄 레코드 수
		int pageScale = 10;
		
		//3. 총 페이지 수
		/*
		int totalPage = 0;
		int remain = totalCount%pageScale;
		
		if(remain != 0){	//페이지 1장이 더 필요한 경우
			totalPage = totalCount/pageScale + 1;
		} else {
			totalPage = totalCount/pageScale;
		}//if~el
		*/
		
		/*
		//--> 개선된 코드
		int totalPage = totalCount/pageScale;
		int remain = totalCount%pageScale;
		
		if(remain != 0){	//페이지 1장이 더 필요한 경우
			totalPage++;
		}//if
		*/
		//--> 개선된 코드 //3. 총 페이지 수
		int totalPage = (int)Math.ceil(((double)totalCount/pageScale));
		
		//4. 검색의 시작번호 구하기 (pagination의 번호 [1] [2] [3])
		String paramPage = request.getParameter("currentPage");
		int currentPage = 1;	//현재페이지
		
		if(paramPage != null){
			try{
				currentPage = Integer.parseInt(paramPage);
			} catch(NumberFormatException nfe){
			}//try~ca
		}//if
		
		int startNum = currentPage * pageScale - pageScale +1;	//시작번호
		
		//5. 끝번호 구하기
		int endNum = startNum + pageScale - 1;	//끝번호
		
		sVO.setCurrentPage(currentPage);
		sVO.setStartNum(startNum);
		sVO.setEndNum(endNum);
		sVO.setTotalPage(totalPage);
		sVO.setTotalCount(totalCount);
		
		out.print(sVO);
		
		//6. 시작번호와 끝번호 사이의 레코드 조회
		List<BoardVO> listBoard = null;
		try{
			listBoard = bDAO.selectBoard(sVO);	//시작번호, 끝번호를 사용한 게시글 조회
			
			String tempSubject = "";
			for(BoardVO tempVO : listBoard){
				tempSubject = tempVO.getSubject();
				
				if(tempSubject.length() > 30){	//제목이 30자를 초과한다면
					tempVO.setSubject(tempSubject.substring(0, 29) + "...");
				}//if
			}//f
			
		} catch (SQLException se){
			se.printStackTrace();
		}//try~ca
		
		pageContext.setAttribute("totalCount", totalCount);
		pageContext.setAttribute("pageScale", pageScale);
		pageContext.setAttribute("totalPage", totalPage);
		pageContext.setAttribute("currentPage", currentPage);
//		pageContext.setAttribute("startNum", startNum);
//		pageContext.setAttribute("endNum", endNum);
		pageContext.setAttribute("listBoard", listBoard);
	%>
	<%--
	총 게시물 수: <c:out value="${ totalCount }"/><br/>
	한 화면에 보여줄 게시물 수: <c:out value="${ pageScale }"/><br/>
	총 페이지 수: <c:out value="${ totalPage }"/><br/>
	현재 페이지 번호: <c:out value="${ currentPage }"/><br/>
	게시글의 시작 번호: <c:out value="${ startNum }"/><br/>
	게시글의 끝 번호: <c:out value="${ endNum }"/><br/>
	--%>
	<div id="boardList" style="height: 550px;">
	<%-- <c:set var="loginFlag" value="javascript:alert('로그인한 계정만 글쓰기 가능')"/> --%>
	<c:set var="loginFlag" value="javascript:loginMove()"/>
	<c:if test="${ not empty userData }">
	<c:set var="loginFlag" value="board_write_frm.jsp"/>
	</c:if>
	<%--
	<c:if test="${ not loginFlag }">
		<a href="board_write_frm.jsp">
	</c:if>
		글쓰기
	<c:if test="${ not loginFlag }">
		</a>
	</c:if>
	--%>
		<a href="${ loginFlag }">글쓰기</a>
		
		<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 50px;">번호</th>
				<th style="width: 480px;">제목</th>
				<th style="width: 190px;">작성자/ip</th>
				<th style="width: 200px;">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${ empty listBoard }">
			<tr>
				<td style="text-align: center;" colspan="4">
					작성된 게시글이 없습니다.<br/><a href="board_write_frm.jsp">글쓰기</a>
				</td>
			</tr>
			</c:if>
			
			<c:if test="${ not empty param.keyword }">
			<c:set var="searchParam" value="&field=${ param.field }&keyword=${ param.keyword }"/>
			</c:if>
			
			<c:forEach var="bVO" items="${ listBoard }" varStatus="i">
			<tr>
				<td><c:out value="${ totalCount-(currentPage-1)*pageScale - i.index }"/></td>
				<td><a href="board_detail.jsp?num=${ bVO.num }&currentPage=${ currentPage }${ searchParam }">
					<c:out value="${ bVO.subject }"/></a></td>
				<td><c:out value="${ bVO.writer }/${ bVO.ip }"/></td>
				<td><fmt:formatDate value="${ bVO.input_date }" pattern="yyyy-MM-dd EEEE HH:mm"/></td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<div id="search" style="height: 60px; text-align: center;">
	<form action="board_list.jsp" method="get" name="searchFrm" id="searchFrm">
		<select name="field" id="field">
			<%-- 유지: ${ param.field eq '0' ? ' selected' : '' } --%>
			<option value="0">제목</option>
			<option value="1">내용</option>
			<option value="2">작성자</option>
		</select>
		<input type="text" name="keyword" id="keyword" style="width: 200px;"/>
		<input type="button" value="검색" id="btn" class="btn btn-sm btn-outline-primary"/>
		<input type="text" style="display: none;"/>
	</form>
	</div>
	<div id="pagination" style="text-align: center;">
		<%-- 
		<c:forEach var="i" begin="1" end="${ totalPage }" step="1">
		[<a href="board_list.jsp?currentPage=${ i }"><c:out value="${ i }"/></a>]
		</c:forEach>
		 --%>
	<%-- 
	<%
		//1. 한 화면에 보여줄 페이지 인덱스 수	[1] [2] [3]
		int pageNumber = 3;
		
		//2. 화면에 보여줄 시작페이지 번호(123 --> 1, 456 --> 4) 구하기
		int startPage = ((currentPage-1)/pageNumber) * pageNumber + 1;
		
		//3. 화면에 보여줄 마지막페이지 번호 구하기
		int endPage = startPage + pageNumber - 1;	//(((starPage-1)+pageNumber)/pageNumber)*pageNumber;
		
		//4. 총 페이지 수가 연산된 페이지 수보다 작다면 총 페이지 수가 마지막 페이지 수로 설정
		if(totalPage <= endPage){
			endPage = totalPage;
		}//if
		
		//5. 첫 페이지가 인덱스 화면이 아닌 경우 ([1]이 아닌 경우 == 3보다 큰 경우)
		int movePage = 0;
		String prevMark = "[&lt;&lt;]";	//이전으로
		
		if(currentPage > pageNumber){	//현재 페이지가 pagination 보다 큰 경우
			movePage = startPage - 1 ;	//예) [4][5][6] 이면 --> 3이 되는데 시작페이지번호를 구하면 ==> 1이됨
			prevMark = "[<a href=\"board_list.jsp?currentPage=" + movePage + "\">&lt;&lt;</a>]";
		}//if
	%>
	<%= prevMark %> ...
	<%
		//6. 시작페이지 번호부터 끝페이지 번호까지 화면에 출력
		movePage = startPage;
		String pageLink = "";
		while(movePage <= endPage){
			pageLink = "[<a href='board_list.jsp?currentPage=" + movePage + "'>" + movePage + "</a>]";
			
			if(movePage == currentPage){	//현재페이지는 링크를 설정하지 X
				pageLink = "[" + movePage + "]";
			}//if
			
			out.print(pageLink);
			movePage++;
		}//w
		
		//7. 뒤에 페이지가 더 있는 경우
		String nextMark = "[&gt;&gt;]";
		
		if(totalPage > endPage){
			movePage = endPage + 1;
			nextMark = "[<a href='board_list.jsp?currentPage="+movePage+"'>&gt;&gt;</a>]";
		}//if
	%>
	... <%= nextMark %>
	<br/>
	 --%>
	<% sVO.setUrl("board_list.jsp"); %>
	
	<%= new BoardUtil().pagination(sVO) %>
	
	</div>
</div>
</div>

</body>
</html>