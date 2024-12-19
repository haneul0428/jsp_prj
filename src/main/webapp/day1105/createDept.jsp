<%@page import="org.jdom2.Attribute"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.sql.SQLException"%>
<%@page import="day1031.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="day1031.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	DeptDAO dDAO = DeptDAO.getInstance();
	boolean flag = false;
	
	try{
		List<DeptVO> list = dDAO.selectAllDept();
		
		//1. XML문서 객체 생성 <?xml version="1.0" encoding="UTF-8"?>
		Document doc = new Document();
		
		//2. 최상위 부모노드 생성 <depts>
		Element deptsNode = new Element("depts");
		
		//3. 자식노드 생성 <dept>
		Element deptNode = null;
		Element deptnoNode = null;
		Element dnameNode = null;
		Element locNode = null;
		int dataSize = 0;
		
		//속성 설정 --> <deptno 속성="값">
		Attribute statusAttr = null;
		
		for(DeptVO dVO : list){
			dataSize++;
			deptNode = new Element("dept");
			
			//3-1. 자식노드 생성 <deptno>
			deptnoNode = new Element("deptno");
			
			//3-2. 자식노드 생성 <dname>
			dnameNode = new Element("dname");
			
			//3-3. 자식노드 생성 <loc>
			locNode = new Element("loc");
			
			deptnoNode.setText(String.valueOf(dVO.getDeptno()));
			dnameNode.setText(String.valueOf(dVO.getDname()));
			locNode.setText(String.valueOf(dVO.getLoc()));
			
			//속성 생성
			statusAttr = new Attribute("status", dVO.getStatus());
			
			//속성을 가질 노드에 배치
			deptnoNode.setAttribute(statusAttr);
			
			//4. 자식노드(3-1, 3-2, 3-3)를 부모노드(3)에 배치
			deptNode.addContent(deptnoNode);
			deptNode.addContent(dnameNode);
			deptNode.addContent(locNode);
			
			//5. 최상위 부모노드(2)에 자식노드(3) 배치
			deptsNode.addContent(deptNode);
		}//f
		
		//6. 최상위 부모노드를 XML문서 객체에 배체
		doc.addContent(deptsNode);
		
		//7. 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		
		File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/depts.xml");
		FileOutputStream fos = new FileOutputStream(file);
		
		xOut.output(doc, fos);
		
		flag = true;
		
		if(fos != null){ fos.close(); }//if
		
	} catch(SQLException se){
		se.printStackTrace();
	} catch(IOException ie){
		ie.printStackTrace();
	}//try~ca
	
if(flag){
%>
	<a href="depts.xml">xml읽기</a>
<%
}else{
%>
	XML이 존재하지 않습니다.
<%
}//if~el
%>
</div>

</body>
</html>