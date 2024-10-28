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
.hover {
    background-color: rgba(255, 255, 255, 0.9);
    border: 1px solid #dcdcdc;
    padding: 1rem;
    position: absolute;
    z-index: 10;
    display: none; /* 기본적으로 숨김 */
    width: 100%; /* 이미지와 동일한 너비로 조정 */
}

.hover .close {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 16px;
    color: #ff0000; /* 닫기 버튼 색상 */
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
</style>

<script type="text/javascript">
$(document).ready(function() {
    $('.swiper-slide').on('click', function(event) {
        const hoverDiv = $(this).find('.hover');
        const imgOffset = $(this).find('img').offset();
        
        // hoverDiv의 위치를 이미지 위로 설정
        hoverDiv.css({
            display: 'block',
            top: imgOffset.top - hoverDiv.outerHeight(), // 이미지 위로 위치 조정
            left: imgOffset.left // 이미지의 왼쪽 위치와 맞추기
        });
        
        // 다른 hover 요소를 숨김
        $('.hover').not(hoverDiv).hide();

        event.stopPropagation(); // 클릭 이벤트 전파 방지
    });

    $(document).on('click', function(event) {
        if (!$(event.target).closest('.swiper-slide').length) {
            $('.hover').hide(); // 상세 정보 숨김
        }
    });

    $('.hover .close').on('click', function(event) {
        event.stopPropagation(); // 클릭 이벤트 전파 방지
        $(this).closest('.hover').hide(); // 상세 정보 숨김
    });
});
</script>

</head>
<body>

<div id="wrap">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
            <img src="https://paikdabang.com/wp-content/uploads/2024/10/우리쌀라떼-핫-450x588.png" alt="우리쌀라떼(HOT)">
            <p class="best_tit">우리쌀라떼(HOT)</p>
            <div class="hover" style="display: none;">
                <button class="close" type="button">닫기</button>
                <h3 class="font-bl">우리쌀라떼(HOT)</h3>
                <p class="txt">든든한 한 끼가 되는 달콤고소한 우리쌀 라떼</p>
                <div class="ingredient_table_box">
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
        <!-- 다른 슬라이드 추가 가능 -->
    </div>
</div>

</body>
</html>
