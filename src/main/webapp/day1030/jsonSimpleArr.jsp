<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%
//1. JSONArray에 들어갈 JSONObject 생성
JSONObject jsonObj1 = new JSONObject();
JSONObject jsonObj2 = new JSONObject();
JSONObject jsonObj3 = new JSONObject();

jsonObj1.put("name", "김지훈");
jsonObj1.put("group", 1);

jsonObj2.put("name", "김현우");
jsonObj2.put("group", 2);

jsonObj3.put("name", "이인혁");
jsonObj3.put("group", 3);

//2. JSONArray 생성 (java.util.List 기반)
JSONArray jsonArr = new JSONArray();

//3. JSONArra에 JSONObject 할당
jsonArr.add(jsonObj1);
jsonArr.add(jsonObj2);
jsonArr.add(jsonObj3);

//4. JSONArray를 문자열로 얻기
String jsonStr = jsonArr.toJSONString();
%>
<%= jsonStr %>

