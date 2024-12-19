<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공통디자인 - 메뉴" %>
<script type="text/javascript">
$(function(){
	$("#sideMenu ul li").click(function() {
		$("#sideMenu ul li").removeClass('on');
		$(this).addClass('on');
	});//sideMenubar ul li - click
});//ready()
</script>
<div id="sideMenu">
	<ul>
		<li><a href="#void">대시보드</a></li>
		<li><a href="#void">회원관리</a></li>
		<li><a href="#void">영화관리</a></li>
		<li><a href="#void">예매관리</a></li>
		<li><a href="#void">로그아웃</a></li>
	</ul>
</div>