<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="업로드된 파일의 처리"
    %>
<%
	//1. 업로드 저장 디렉토리 설정
	File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
	
	//2. 업로드 최대 파일 크기 설정
	int fileSize = 1024 * 1024 * 600;	//600MByte
	
	//3. FileUpload Component 생성
	MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),
							fileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//4. 파일명 받기
	String fileSystemName = mr.getFilesystemName("profile");
	
	File readFile = new File(saveDir.getAbsolutePath() + fileSystemName);
	
	//최대 파일 크기 비교
	int maxSize = 1024 * 1024 * 10;	//10MByte
	boolean uploadFlag = readFile.length() > maxSize;
	
	if(uploadFlag){	//파일 사이즈가 큰 경우 --> 업로드된 파일을 삭제
		readFile.delete();
	}//if
	
	//5. 응답화면 만들기
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("uploadFlag", uploadFlag);
	
	out.print(jsonObj.toJSONString());
%>