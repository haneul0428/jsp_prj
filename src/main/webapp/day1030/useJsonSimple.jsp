<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%
//1. JSONObject 생성 - Map 기반
JSONObject jsonObj = new JSONObject();

//2. 값할당
jsonObj.put("name", "김현우");
jsonObj.put("age", 20);

//3. JSONObject 을 문자열로 얻기
String jsonStr = jsonObj.toJSONString();
//String jsonStr = jsonObj.toString();	//toString()을 사용해도 O

%>
<%= jsonStr %>
