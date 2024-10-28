<%@page import="kr.co.sist.user.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="아이디 중복확인"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://192.168.10.214/jsp_prj/common/images/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="http://192.168.10.214/jsp_prj/common/css/main_20240911.css">

<!-- bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css">
#wrap{ 
	width: 452px; 
	height: 370px;
	margin: 0px auto; 
}
#idBg{ 
	width: 452px; 
	height: 370px;
	background: #FFFFFF url(images/id_dup_bg.png) no-repeat;
	position: relative; 
}
#resultDiv{ 
	margin-top: 10px; 
	margin-bottom: 10px;
	position: absolute;
	top:260px;
	left:25px; 
}
#resultDiv2{ 
	margin-top: 10px; 
	margin-bottom: 10px;
	position: absolute;
	top:260px;
	left:25px;
}
#idFrm{ 
	position: absolute;
	top:210px;
	left:70px;
}
</style>

<script type="text/javascript">
$(function(){
	$("#btn").click(function() {
		chkNull();
	});
	$("#id").keydown(function(evt) {
		if(evt.which == 13){	//눌려진 키코드가 enter(13)라면
			chkNull();
		}//if
	});
	$("#btnUse").click(function() {
		useId();
	});
});//ready()

function useId() {
	//자식창의 아이디를 가져와서
	var id = $("#id").val();
	
	//부모창에 전달한 후
	opener.window.document.memberFrm.id.value = id;
	
	//1. 부모창에 중복확인한 상태를 저장할 수 있는 HTML Form Control(hidden)을 만들고, 값을 설정한 후
	//2. 가입 버튼을 눌렀을 때, 중복확인한 상태의 아이디인지를 검사한 후 회원가입 페이지로 이동
	//3. 회원가입 페이지로 이동
	opener.window.document.memberFrm.idDupFlag.value = "Y";
	
	//자식창 닫기
	self.close();
}//useId()

function chkNull() {
	var id = $("#id").val();
	
	if(id.replace(/ /g, "")===""){	//id가 없다면
		alert("아이디는 필수입력입니다.");
		$("#id").val("");
		$("#id").focus();
		return;
	}//if
	
	$("#idDupFrm").submit();
	
}//chkNull()
</script>
</head>
<body>
<div id="wrap">
	<div id="idBg">
	<form name="idDupFrm" id="idDupFrm" action="id_dup.jsp">
		<div id="idFrm">
			<input type="text" name="id" id="id" class="inputBox" value="${ param.id }"/>
			<input type="button" id="btn" value="아이디 중복확인" class="btnMy" style="width: 140px"/>
			<%-- 
				web browser에서 키입력을 받는 HTML Form Control이 하나인 경우,
					enter(엔터)를 치면 자동으로 submit 됨.(javascript 유효성 검증을 실패해도 submit 됨)
				==> (막기위해서)
				<input type="text" 를 보이지 않게 생성하면 됨
				<input type="text" style="display: none;"/>
			--%>
			<input type="text" style="display: none;"/>
		</div>
	</form>
		<%
		String id = request.getParameter("id");
		
		if(id != null && !"".equals(id)){	//id가 비어있지 않다면
			MemberDAO mDAO = MemberDAO.getInstance();
			
			boolean selectFlag = mDAO.selectId(id);
			
			if(selectFlag){
				%>
			<div id="resultDiv2">입력하신 아이디 <strong><%= id %></strong>는(은) 
				<span id="resultMsg" style="color: red;">사용중인 </span>아이디 입니다.
			</div>
			<%
			} else {
			%>
			
			<div id="resultDiv">입력하신 아이디 <%= id %>는(은) 
				<span id="resultMsg" style="color: green;">사용 가능 한 </span>아이디 입니다.
				<div style="text-align: center">
					<input type="button" value="사용" id="btnUse" class="btn btn-outline-success"/>
				</div>
			</div>
			<%}//if~el
		}//if%>
	</div>
</div>
</body>
</html>