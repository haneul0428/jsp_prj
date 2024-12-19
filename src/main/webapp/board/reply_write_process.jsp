<%@page import="java.sql.SQLException"%>
<%@page import="kr.co.sist.user.board.ReplyDAO"%>
<%@page import="kr.co.sist.user.member.WebMemberVO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rVO" class="kr.co.sist.user.board.ReplyVO" scope="page"/>
<jsp:setProperty name="rVO" property="*"/>
<%
	JSONObject jsonObj = new JSONObject();
	String method = request.getMethod();
	jsonObj.put("result", !"GET".equals(method));	//요청방식에따라 성공|실패
	
	if("POST".equals(method)){
		Object obj = session.getAttribute("userData");	//login_frm 에서 session의 set userData를 getAttribute()로 받음
		WebMemberVO wmVO = null;
		
		if(obj != null){	//로그인 O
			wmVO = (WebMemberVO)obj;
		}//if
			
		jsonObj.put("loginStatus", obj != null);	//POST방식 + session에 로그인 정보의 존재여부
		
		if(wmVO != null){
			rVO.setIp(request.getRemoteAddr());
			rVO.setWriter(wmVO.getId());
			
			//DB 추가 작업
			System.out.print("rVO id -----" + rVO);
			ReplyDAO rDAO = ReplyDAO.getInstance();
			
			try{
				rDAO.insertReply(rVO);
				jsonObj.put("insertStatus", true);
			} catch(SQLException se){
				jsonObj.put("insertStatus", false);
				se.printStackTrace();
			}//try~ca
			
		}//if
		
	}//if
	
	out.print(jsonObj.toJSONString());
%>