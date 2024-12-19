<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%
	String subject = request.getParameter("subject");
	
	Map<String, String> map = new HashMap();
	map.put("java", "DeskTop에서 동작하는 프로그램 제작 가능");
	map.put("oracle", "대용량 데이터를 저장, 관리 가능");
	map.put("jdbc", "java에서 Database를 연동할 수 있는 저수준 API");
	map.put("html", "web에서 구조를 담당하는 언어");
	
	//JSONObject 만들기
	//1. JSONObject 생성
	JSONObject jsonObj = new JSONObject();
	
	//2. 값설정
	String value = "";
	boolean searchFlag = map.containsKey(subject);
	
	if(searchFlag){
		value = map.get(subject);
	}//if
	
	jsonObj.put("searchFlag", searchFlag);
	jsonObj.put("value", value);
	out.println(jsonObj.toJSONString());
%>
