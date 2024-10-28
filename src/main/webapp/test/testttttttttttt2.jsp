<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="" %>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="shortcut icon" type="image/x-icon" href="http://localhost/paik_prj/common/images/favicon.png">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>빽다방 | 신메뉴</title>

<style type="text/css">
    .swiper-container {
        width: 100%; /* 100% 너비 */
        max-width: 1200px; /* 최대 너비 설정 */
        overflow: hidden; /* 넘치는 내용 숨김 */
    }
    .swiper-slide {
        box-sizing: border-box; /* 박스 모델 설정 */
    }
    .hover {
        background-color: rgba(255, 255, 255, 0.9);
        border: 1px solid #dcdcdc;
        padding: 1rem;
        position: absolute;
        z-index: 10;
        width: 400px;
        height: 400px;
        display: none; /* 기본적으로 숨김 */
    }
    .hover .close {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 16px;
        color: #ff0000;
    }
    .itemName {
        font-size: 18px;
        text-align: center;
    }
    .menuIngredientBasis {
        font-size: 14px;
        color: #555;
    }
    .ingredientTable {
        list-style: none;
        padding: 0;
    }
    .ingredientTable li {
        display: flex;
        justify-content: space-between;
        margin: 5px 0;
    }
    .pageTab {
        list-style: none;
        padding: 0;
        margin: 1rem 0; /* 슬라이드와의 간격 */
    }
    .pageTab li {
        display: inline; /* 수평 배치 */
        margin-right: 15px; /* 간격 조정 */
    }
</style>

<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_kl.css">
<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_normal.css">
<link rel="stylesheet" type="text/css" href="http://localhost/paik_prj/common/css/paik_extend.css">

<link rel='stylesheet' id='theme-css-style-css' href='https://paikdabang.com/wp-content/themes/paikdabang/assets/css/style.css?ver=4.9.4' type='text/css' media='all' />

<link rel="icon" href="http://localhost/paik_prj/common/images/favicon32x32.png" sizes="32x32" />
<link rel="icon" href="http://localhost/paik_prj/common/images/favicon192x192.png" sizes="192x192" />
<link rel="apple-touch-icon-precomposed" href="http://localhost/paik_prj/common/images/favicon180x180.png" />
<meta name="msapplication-TileImage" content="http://localhost/paik_prj/common/images/favicon270x270.png" />

<!-- bootstrap CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    // Swiper 초기화
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 2,
        spaceBetween: 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        }
    });
    
    $('.swiper-slide img').on('click', function(event) {
        const hoverDiv = $('.hover');
        const img = $(this);
        const imgOffset = img.offset();
        const imgWidth = img.width();
        const imgHeight = img.height();
        const centerX = imgOffset.left + imgWidth / 2;
        const centerY = imgOffset.top + imgHeight / 2;

        // hoverDiv 내용 설정
        hoverDiv.find('h3').text(img.attr('alt'));
        hoverDiv.find('p').text('여기에 설명 추가');

        // 브라우저 크기 가져오기
        const windowWidth = $(window).width();
        const windowHeight = $(window).height();

        // hoverDiv 위치 조정
        hoverDiv.css({
            display: 'block',
            top: Math.max(0, centerY - hoverDiv.outerHeight() / 2), // 중앙 정렬
            left: Math.max(0, centerX - hoverDiv.outerWidth() / 2) // 중앙 정렬
        });

        // 클릭된 슬라이드 외부를 클릭할 경우 숨김
        $(document).one('click', function(e) {
            if (!$(e.target).closest('.swiper-slide').length) {
                hoverDiv.hide(); // 상세 정보 숨김
            }
        });

        event.stopPropagation(); // 클릭 이벤트 전파 방지
    });

    $('.close').on('click', function(event) {
        event.stopPropagation();
        $('.hover').hide(); // 상세 정보 숨김
    });
});
</script>

</head>
<body>

<div id="wrap">
<div id="header">
<jsp:include page="header.jsp"/>
</div>

<div id="content-wrap" style="margin-bottom: 100px;">
<div class="sub_visual bg-menu">
    <div class="txt">
        <h1>신메뉴</h1>
        <p>새로운 메뉴가 추가되었습니다.<br/>지금 바로 확인해보세요.</p>
        <div class="tabMenu">
            <ul class="pageTab">
                <li class="on"><a href="">신메뉴</a></li>
                <li><a href="http://localhost/paik_prj/paik/coffeMenuPage.jsp">커피</a></li>
                <li><a href="http://localhost/paik_prj/paik/drinkMenuPage.jsp">음료</a></li>
                <li><a href="http://localhost/paik_prj/paik/icecreamDessertMenuPage.jsp">아이스크림/디저트</a></li>
                <li><a href="http://localhost/paik_prj/paik/paikccinoPage.jsp">빽스치노</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="mainContainer">
    <div class="swiper-container"> <!-- Swiper 컨테이너 -->
        <div class="swiper-wrapper d-flex justify-content-between">
            <div class="swiper-slide">
                <img src="https://paikdabang.com/wp-content/uploads/2024/10/우리쌀라떼-핫-450x588.png" alt="우리쌀라떼(HOT)">
                <p class="itemName">우리쌀라떼(HOT)</p>
            </div>
            <div class="swiper-slide">
                <img src="https://paikdabang.com/wp-content/uploads/2024/10/우리쌀라떼-아이스-450x588.png" alt="우리쌀라떼(ICE)">
                <p class="itemName">우리쌀라떼(ICE)</p>
            </div>
            <div class="swiper-slide">
                <img src="https://paikdabang.com/wp-content/uploads/2024/10/우리쌀라떼-핫-450x588.png" alt="우리쌀라떼(HOT)">
                <p class="itemName">우리쌀라떼(HOT)</p>
            </div>
        </div>
        <!-- 추가된 내비게이션 -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
    
    <!-- hover 요소 -->
    <div class="hover">
        <button class="close" type="button"> X </button>
        <h3></h3>
        <p></p>
        <div>
            <p class="menuIngredientBasis">※ 1회 제공량 기준 : 16oz</p>
            <ul class="ingredientTable">
                <li><div>카페인(mg)</div><div>0</div></li>
                <li><div>칼로리</div><div>395</div></li>
                <li><div>나트륨</div><div>209</div></li>
                <li><div>당류</div><div>35</div></li>
                <li><div>포화지방</div><div>5.9</div></li>
                <li><div>단백질</div><div>12</div></li>
            </ul>
        </div>
        <p class="msg">(매장 상황에 따라 판매하지 않을 수 있습니다.)</p>
    </div>
</div>
</div>

<div id="footer">
<jsp:include page="footer.jsp"/>
</div>
</div>

</body>
</html>
