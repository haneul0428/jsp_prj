<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="user main"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>

<link rel="shortcut icon" href="http://192.168.10.214/paik_prj/common/images/favicon.png">
<link rel="stylesheet" type="text/css" href="http://192.168.10.214/jsp_prj/common/css/main_20240911.css">

<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN 시작 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<style>
	#header {
		position: relative; /* #header를 기준으로 자식 요소를 절대 위치 설정 가능 */
		padding: 10px 20px; /* 패딩 추가 */
	}

	.nav_wrap {
		display: inline-block; /* 로고와 수평 정렬 */
	}

	.nav {
		position: absolute; /* 절대 위치 설정 */
		left: 20%; /* 로고의 위치에 따라 이동 */
		top: 50%; /* 세로 중앙 정렬 */
		transform: translateY(-50%); /* 세로 중앙 정렬 보정 */
	}

	.navbar {
		list-style: none;
		padding: 0;
		margin: 0;
	}

	.navbar > li {
		position: relative;
		display: inline-block;
		padding: 15px 20px;
	}

	.navbar > li > a {
		text-decoration: none; /* 링크의 밑줄 없애기 */
		color: #333; /* 링크 색상 */
	}

	.sub_menu {
		display: none; /* 기본적으로 서브 메뉴 숨기기 */
		position: absolute;
		top: 100%;
		left: 0;
		background: #fff;
		z-index: 1000;
		white-space: nowrap; /* 내용이 한 줄로 유지되도록 */
		background: url('http://localhost/jsp_prj/paik/images/sub_menu_img.png'); /* 배경 이미지 설정 */
	}

	.sub_menu li {
		display: block;
		padding: 10px 15px;
	}

	.sub_menu li a {
		color: #333; /* 링크 색상 */
		text-decoration: none; /* 링크 밑줄 제거 */
	}

	.navbar > li:hover .sub_menu {
		display: block; /* 마우스 오버 시 서브 메뉴 표시 */
	}

	.sub_menu li a:hover {
		text-decoration: none; /* 호버 시에도 밑줄 제거 */
	}
</style>

<script type="text/javascript">
$(function(){
	
});//ready()
</script>

</head>
<body>

<div id="wrap">
	<div id="header">
		<div>
			<ul>
				<li><a href="">로그인</a></li>
			</ul>
			<div class="nav_left">
				<a href="">
					<img src="http://localhost/jsp_prj/paik/images/logo.png" alt="빽다방 로고">
				</a>
			</div>
			<div class="nav">
				<ul class="navbar">
					<li id="" class="">
						<a href="">빽다방</a>
						<ul class="sub_menu">
							<li id="" class="">
								<a href="">빽다방 소개</a>
							</li>
							<li id="" class="">
								<a href="">커피 이야기</a>
							</li>
							<li id="" class="">
								<a href="">교육 이야기</a>
							</li>
						</ul>
					</li>
					
					<li id="" class="">
						<a href="">메뉴</a>
						<ul class="sub_menu">
							<li id="" class="">
								<a href="">신메뉴</a>
							</li>
							<li id="" class="">
								<a href="">커피</a>
							</li>
							<li id="" class="">
								<a href="">음료</a>
							</li>
							<li id="" class="">
								<a href="">아이스크림/디저트</a>
							</li>
							<li id="" class="">
								<a href="">빽스치노</a>
							</li>
						</ul>
					</li>
					
					<li id="" class="">
						<a href="">장바구니</a>
						<ul class="sub_menu">
							<li id="" class="">
								<a href="">고객의소리</a>
							</li>
							<li id="" class="">
								<a href="">고객의소리</a>
							</li>
							<li id="" class="">
								<a href="">답변 내역</a>
							</li>
						</ul>
					</li>
					
					<li id="" class="">
						<a href="">마이페이지</a>
						<ul class="sub_menu">
							<li id="" class="">
								<a href="">나의 정보</a>
							</li>
							<li id="" class="">
								<a href="">비밀번호 변경</a>
							</li>
							<li id="" class="">
								<a href="">개인정보 변경</a>
							</li>
							<li id="" class="">
								<a href="">회원탈퇴</a>
							</li>
							<li id="" class="">
								<a href="">주문 현황(내역)</a>
							</li>
						</ul>
					</li>
				</ul>
			</div><!-- nav -->
		</div>
	</div><!-- header -->
	
	<div id="container">
	</div>
	
	<div id="footer">
	</div>
</div>

</body>
</html>