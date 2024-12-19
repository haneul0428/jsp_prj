<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="사용자 메인페이지"
    %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo" rel="stylesheet">
<link rel="stylesheet" id="theme-css-style-css" href="https://paikdabang.com/wp-content/themes/paikdabang/assets/css/paiks_style.css" type="text/css" media="all">
<link rel="shortcut icon" type="image/x-icon" href="http://192.168.10.214/jsp_prj/prac/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<title>ë¹½ë¤ë°©</title>

<style type="text/css">
	img.wp-smiley,img.emoji {
		display: inline !important;
		border: none !important;
		box-shadow: none !important;
		height: 1em !important;
		width: 1em !important;
		margin: 0 .07em !important;
		vertical-align: -0.1em !important;
		background: none !important;
		padding: 0 !important;
	}
</style>

<link rel='stylesheet' id='klpu-front-css-css'  href='https://paikdabang.com/wp-content/plugins/kl-popup/css/klpu-front.min.css?ver=4.9.4' type='text/css' media='all' />
<link rel='stylesheet' id='insta-gallery-css'  href='https://paikdabang.com/wp-content/plugins/insta-gallery/assets/insta-gallery-min.css?ver=1.5.11' type='text/css' media='all' />
<link rel='stylesheet' id='theme-css-normalize-css'  href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/normalize.css?ver=4.9.4' type='text/css' media='all' />
<link rel='stylesheet' id='theme-css-style-css'  href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4' type='text/css' media='all' />
<link rel='stylesheet' id='theme-css-dev-style-css'  href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style_dev.css?ver=4.9.4' type='text/css' media='all' />
<link rel='stylesheet' id='theme-css-extend-style-css'  href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/extend.a.css?ver=4.9.4' type='text/css' media='all' />

<script type='text/javascript' src='https://paikdabang.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='https://paikdabang.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<script type='text/javascript' src='https://paikdabang.com/wp-content/plugins/kl-popup/js/klpu-front.min.js?ver=4.9.4'></script>
<script type='text/javascript' src='https://paikdabang.com/wp-content/themes/paikdabang/assets/js/jquery.1.12.4.min.js?ver=4.9.4'></script>

<link rel="icon" href="http://192.168.10.214/jsp_prj/prac/images/favicon32x32.png" sizes="32x32" />
<link rel="icon" href="http://192.168.10.214/jsp_prj/prac/images/favicon192x192.png" sizes="192x192" />
<link rel="apple-touch-icon-precomposed" href="http://192.168.10.214/jsp_prj/prac/images/favicon180x180.png" />

<meta name="msapplication-TileImage" content="http://192.168.10.214/jsp_prj/prac/images/favicon270x270.png" />

<!-- bootstrap CDN ìì -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN ìì -->
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
					<img src="http://192.168.10.214/jsp_prj/prac/images/logo.png" alt="빽다방">
				</a>
				<a href="" class="logo light">
					<img src="http://192.168.10.214/jsp_prj/prac/images/logo-2.png" alt="빽다방">
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

<div id="primary" class="content-area">
<main id="main" class="site-main" role="main">

<article id="post-13" class="post-13 page type-page status-publish hentry">
<div class="entry-content">
<div class="main_visual_wrap">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
        	<img src="http://192.168.10.214/jsp_prj/prac/images/swipe_slider01.jpg" alt="">
        </div>
		
        <div class="swiper-slide">
        	<img src="http://192.168.10.214/jsp_prj/prac/images/swipe_slider02.jpg" alt="">
        </div>
		
        <div class="swiper-slide">
        	<img src="http://192.168.10.214/jsp_prj/prac/images/swipe_slider03.png" alt="">
        </div>
		
        <div class="swiper-slide">
        	<img src="http://192.168.10.214/jsp_prj/prac/images/swipe_slider04.jpg" alt="">
        </div>
		
        <div class="swiper-slide">
        	<img src="http://192.168.10.214/jsp_prj/prac/images/swipe_slider05.jpg" alt="">
        </div>
	</div>
    <div class="swiper-pagination"></div>
</div>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	//swiper-slide ì¬ì©
    const swiper = new Swiper('.main_visual_wrap', {
        loop: true,
        autoplay: {
            delay: 5000,
        },
        pagination: {
            el: '.swiper-pagination', 
            clickable: true,
        },
    });
</script>

<div class="main_section">
	<section class="main_sec01 sec_hover">
		<div class="left_wrap sec_hover">
			<a href="">
				<dl class="">
					<dt>PAIK’S COFFEE<br />STORY</dt>
					<dd>균형잡힌 바디감으로 긴 여운을 남기는 빽다방 커피를 만나보세요.</dd>
				</dl>
				<a class="view_btn" href=""><span>커피 이야기 보러가기</span></a>
			</a>
		</div>
		<div class="right_wrap sec_hover">
			<a href="">
				<dl class="">
					<dt>PAIK’S BRAND<br />STORY</dt>
					<dd>합리적인 가격으로 만나는 맛있고 든든한 빽다방</dd>
				</dl>
				<a class="view_btn" href=""><span>빽다방 소개 보러가기</span></a>
			</a>
		</div>
	</section>
	
	<section class="main_sec02 sec_hover">
		<a href="">
			<dl class="main_tt">
				<dt>FRESH<br />COFFEE</dt>
				<dd>신선한 뉴크롭 원두를 사용하여<br />추출한 커피메뉴!</dd>
			</dl>
			<img class="pc" src="http://192.168.10.214/jsp_prj/prac/images/main_sec2.jpg" alt="">
			<img class="mo" src="http://192.168.10.214/jsp_prj/prac/images/mmain_sec2.jpg" alt="">
		</a>
		<a class="view_btn" href=""><span>커피 메뉴 보러가기</span></a>
	</section>
  
	<section class="main_sec03">
	<div class="left_wrap sec_hover">
		<a href="">
			<dl class="main_tt">
				<dt>VARIOUS<br />BEVERAGE</dt>
				<dd>에이드, 티, 주스 등 취향대로<br />골라 먹는 즐거움!</dd>
			</dl>
			<img class="pc" src="http://192.168.10.214/jsp_prj/prac/images/main_sec3.jpg" alt="">
			<img class="mo" src="http://192.168.10.214/jsp_prj/prac/images/mmain_sec3.jpg" alt="">
		</a>
		<a class="view_btn" href=""><span>음료 메뉴 보러가기</span></a>
	</div>
    <div class="right_wrap sec_hover">
		<a href="">
			<dl class="main_tt">
				<dt>SWEET<br />PAIK'S CCINO</dt>
				<dd>달콤 시원한 빽다방<br />시그니처 메뉴!</dd>
			</dl>
			<img class="pc"src="http://192.168.10.214/jsp_prj/prac/images/main_sec4.jpg" alt="">
			<img class="mo"src="http://192.168.10.214/jsp_prj/prac/images/mmain_sec4.jpg" alt="">
		</a>
		<a class="view_btn" href=""><span>빽스치노 메뉴 보러가기</span></a>
	</div>
	</section>
  
	<section class="main_sec04">
  	<div class="right_wrap sec_hover" style="width: 100%">
		<a href="">
			<dl class="main_tt">
				<dt>TASTY<br />ICE CREAM /<br />DESSERT</dt>
				<dd>달콤한 아이스크림부터<br />든든한 브레드까지!</dd>
			</dl>
			<img class="pc" src="http://192.168.10.214/jsp_prj/prac/images/main_sec5.jpg" alt="">
			<img class="mo" src="http://192.168.10.214/jsp_prj/prac/images/swipe_slider05.jpg" alt="">
		</a>
		<a class="view_btn" href=""><span>아이스크림/디저트 메뉴 보러가기</span></a>
    </div>
	</section>
	
	<div class="main_sns">
		<dl class="sns_tt">
			<dt>이름이름</dt>
			<dd><span>#이름</span><span>#이름</span><span>#이름</span></dd>
		</dl>
	    <div class="feed_box">
	    	<ul></ul>
	  	</div>
	</div>
</div>

</div>
</article>
</main>

</div><!-- .content-area -->
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
<script type='text/javascript' src='https://paikdabang.com/wp-content/themes/paikdabang/assets/js/extend.a.js?ver=4.9.4'></script>
<script type='text/javascript' src='https://paikdabang.com/wp-includes/js/wp-embed.min.js?ver=4.9.4'></script>

</body>
</html>