<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 로그인화면"
    %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jsp_prj/paik/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<title>빽다방</title>

<style type="text/css">

</style>

<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/paik/css/paik_kl.css">
<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/paik/css/paik_normal.css">
<link rel="stylesheet" type="text/css" href="http://localhost/jsp_prj/paik/css/paik_extend.css">

<link rel='stylesheet' id='theme-css-style-css'  href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4' type='text/css' media='all' />

<link rel="icon" href="http://localhost/jsp_prj/paik/images/favicon32x32.png" sizes="32x32" />
<link rel="icon" href="http://localhost/jsp_prj/paik/images/favicon192x192.png" sizes="192x192" />
<link rel="apple-touch-icon-precomposed" href="http://localhost/jsp_prj/paik/images/favicon180x180.png" />
<meta name="msapplication-TileImage" content="http://localhost/jsp_prj/paik/images/favicon270x270.png" />

<!-- bootstrap CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

</head>

<body>
<div id="wrap">
<header id="header" class="">
	<div class="in_header">
		<div class="sub-bg"></div>
		<div class="container">
			<ul class="topbar">
				<li><a href="">로그인</a></li>
			</ul>
			<div class="nav_wrap">
				<a href="" class="logo">
					<img src="http://localhost/jsp_prj/prac/images/logo.png" alt="빽다방">
				</a>
				<a href="" class="logo light">
					<img src="http://localhost/jsp_prj/prac/images/logo-2.png" alt="빽다방">
				</a>
				<div class="nav">
					<div class="nav-icon"><div></div></div>
					<ul class="navbar">
					<li id="menu-item-95" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-95">
						<a href="" style="margin-right: 30px;">빽다방</a>
					<ul class="sub-menu">
						<li id="menu-item-17797" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-17797">
							<a href="">빽다방 소개</a>
						</li>
						<li id="menu-item-17648" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-17648">
							<a href="">커피 이야기</a>
						</li>
						<li id="menu-item-17798" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-17798">
							<a href="">교육 이야기</a>
						</li>
					</ul>
					</li>
					
					<li id="menu-item-192" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-192">
						<a href="" style="margin-right: 30px;">메뉴</a>
						<ul class="sub-menu">
							<li id="menu-item-86" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-86">
								<a href="">신메뉴</a>
							</li>
							<li id="menu-item-87" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-87">
								<a href="">커피</a>
							</li>
							<li id="menu-item-88" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-88">
								<a href="">음료</a>
							</li>
							<li id="menu-item-90" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-90">
								<a href="">아이스크림/디저트</a>
							</li>
							<li id="menu-item-89" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-89">
								<a href="">빽스치노</a>
							</li>
						</ul>
					</li>
					<li id="menu-item-97" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-97">
						<a href="" style="margin-right: 30px;">장바구니</a>
					</li>
					<li id="menu-item-1019" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-1019">
						<a href="" style="margin-right: 30px;">고객의 소리</a>
						<ul class="sub-menu">
							<li id="menu-item-519" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-519">
								<a href="">고객의 소리</a>
							</li>
							<li id="menu-item-6773" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-6773">
								<a href="">답변 내역</a>
							</li>
						</ul>
					</li>
					<li id="menu-item-99" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-99">
						<a href="" style="margin-right: 100px;">마이페이지</a>
						<ul class="sub-menu">
							<li id="menu-item-61" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-61">
								<a href="">나의 정보</a>
							</li>
							<li id="menu-item-17622" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-17622">
								<a href="">비밀번호 변경</a>
							</li>
							<li id="menu-item-17623" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-17623">
								<a href="">개인정보변경</a>
							</li>
							<li id="menu-item-17624" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-17624">
								<a href="">회원탈퇴</a>
							</li>
							<li id="menu-item-17799" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-17799">
								<a href="">주문 현황(내역)</a>
							</li>
						</ul>
					</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="overlay"></div>
<div id="content-wrap">

<!-- 서브타이틀 -->
<div class="sub_visual bg-paik">
    <div class="txt">
        <h1>로그인</h1>
    </div>
</div>

<!-- 서브컨텐츠 -->
<div class="sub_section cmnt_wrap">
    <div class="container">
        로그인
    </div>
</div>
</div> <!-- END #content-wrap -->

<footer id="footer">
<div class="container">
	<div class="in_footer">
		<a class="logo" href=""><img src="/wp-content/themes/paikdabang/assets/images/flogo.png" alt="더본로고"></a>
		<a class="logo light" href=""><img src="/wp-content/themes/paikdabang/assets/images/flogo-2.png" alt="더본로고"></a>
		<div class="company_info">
			<ul><li><a href="https://www.theborn.co.kr/agreement/" target="_blank" style="font-weight:800;">개인정보처리방침</a></li></ul>
			<ul>
				<li>(주)더본코리아</li>
				<li>사업자등록번호 211-86-00870</li>
				<li>대표이사 백종원</li>
			</ul>
			<ul>
				<li>주소: 서울시 강남구 봉은사로 1길 39 유성빌딩 5~6층</li>
				<li>팩스: 02-511-3864</li>
			</ul>
			<ul>
				<li>본사 대표전화: 02-549-3864</li>
				<li>가맹상담전화: 02-3447-0410</li>
				<li>고객센터: 1544-2360</li>
			</ul>
			<p class="copyright">COPYRIGHTⓒ 2018 THEBORN KOREA INC. ALL RIGHTS RESERVED</p>
		</div>
	</div>

	<!-- TOP버튼 -->
	<div class="to_top">
		<span></span>
	</div>
</div>
</footer> <!-- END footer -->
</div> <!-- END #wrap -->

<script type="text/javascript">
//MOBILE MENU
jQuery("header .nav .nav-icon").click(function() {
	jQuery(this).toggleClass("active");
	jQuery("header .navbar").toggleClass("active");

	jQuery(".overlay").fadeToggle();
	jQuery(".overlay").css("z-index","1");
});
jQuery(document).on("click","header .navbar.active .menu-item-has-children>a",function() {
	jQuery(this).removeAttr("href");
	jQuery(this).toggleClass("on");
	jQuery(this).next(".sub-menu").slideToggle().parents().siblings().children(".sub-menu").slideUp();
});

//PC MENU
jQuery(".in_header .nav .navbar>.menu-item-has-children").on("mouseenter",function(){
	jQuery(".sub-bg").addClass("on");
});
jQuery(".in_header .nav .navbar>.menu-item-has-children").on("mouseleave",function(){
	jQuery(".sub-bg").removeClass("on");
});

//TOP button
$(window).scroll(function(){
	if($(this).scrollTop() > 1){
		$('.to_top').fadeIn();
	}else{
		$('.to_top').fadeOut();
	}
});
jQuery('.to_top').click(function() {
	jQuery('html, body').animate({
		scrollTop: 0
	}, 400);
	return false;
});
</script>

</body>
</html>