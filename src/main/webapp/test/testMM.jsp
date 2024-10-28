<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="" %>
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

.menu_ingredient_basis {
    font-size: 14px;
    color: #555;
}
.ingredient_table {
    list-style: none;
    padding: 0;
}
.ingredient_table li {
    display: flex;
    justify-content: space-between;
    margin: 5px 0;
}
.page_tab {
    list-style: none;
    padding: 0;
    margin: 1rem 0; /* 슬라이드와의 간격 */
}

.page_tab li {
    display: inline; /* 수평 배치 */
    margin-right: 15px; /* 간격 조정 */
}
</style>

<script type="text/javascript">
$(document).ready(function() {
    $('.swiper-slide img').on('click', function(event) {
        const hoverDiv = $('.hover'); // 전역 hoverDiv 선택
        const img = $(this);
        const imgWidth = img.width();
        const imgHeight = img.height();
        const centerX = img.offset().left + imgWidth / 2;
        const centerY = img.offset().top + imgHeight / 2;

        // hoverDiv 내용 설정
        hoverDiv.find('h3').text(img.attr('alt')); // 이미지 alt를 제목으로
        hoverDiv.find('p').text('여기에 설명 추가'); // 설명 설정

        // hoverDiv 위치 조정
        hoverDiv.css({
            display: 'block',
            top: centerY - (imgHeight * 0.35), // 중앙에서 약간 위로 위치
            left: centerX - hoverDiv.outerWidth() / 2 // 중앙에 맞추기
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
        event.stopPropagation(); // 클릭 이벤트 전파 방지
        $('.hover').hide(); // 상세 정보 숨김
    });
});
</script>

</head>
<body>

<div id="wrap">
    <!-- 탭 메뉴 추가 -->
    <ul class="page_tab st-2">
        <li class="on"><a href="">신메뉴</a></li>
        <li><a href="">커피</a></li>
        <li><a href="">음료</a></li>
        <li><a href="">아이스크림/디저트</a></li>
        <li><a href="">빽스치노</a></li>
    </ul>
    <div class="swiper-wrapper d-flex justify-content-between">
        <div class="swiper-slide">
            <img src="https://paikdabang.com/wp-content/uploads/2024/10/우리쌀라떼-핫-450x588.png" alt="우리쌀라떼(HOT)">
            <p>우리쌀라떼(HOT)</p>
        </div>
        <div class="swiper-slide">
            <img src="https://paikdabang.com/wp-content/uploads/2024/10/우리쌀라떼-아이스-450x588.png" alt="우리쌀라떼(ICE)">
            <p>우리쌀라떼(ICE)</p>
        </div>
        <div class="swiper-slide">
            <img src="https://paikdabang.com/wp-content/uploads/2024/10/우리쌀라떼-핫-450x588.png" alt="우리쌀라떼(HOT)">
            <p>우리쌀라떼(HOT)</p>
        </div>
    </div>
    <!-- hover 요소를 여기로 이동 -->
    <div class="hover">
        <button class="close" type="button"> X </button>
        <h3></h3>
        <p></p>
        <div>
            <p class="menu_ingredient_basis">※ 1회 제공량 기준 : 16oz</p>
            <ul class="ingredient_table">
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

</body>
</html>
