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

<!-- 다음 Map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a87f79150c8e67e59873cbabbc70109f"></script>

<style type="text/css">

</style>

<script type="text/javascript">
$(function(){
	
});//ready()

window.onload = function() {
	//map 사용
	var mapContainer = document.getElementById('map'), //지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.499294, 127.0331883), //지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); //지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '쌍용교육센터', 
	        latlng: new kakao.maps.LatLng(37.499294, 127.0331883)
	    },
	    {
	        title: '호보식당-제육볶음', 
	        latlng: new kakao.maps.LatLng(37.4980618, 127.0346506)
	    },
	    {
	        title: '원당뼈다귀감자탕', 
	        latlng: new kakao.maps.LatLng(37.5007938, 127.0339382)
	    },
	    {
	        title: '제주은희네 해장국',
	        latlng: new kakao.maps.LatLng(37.498189, 127.0315992)
	    }
	];
	
	//마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    //마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    //마커 이미지를 생성합니다    
	    //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    //마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, //마커를 표시할 지도
	        position: positions[i].latlng, //마커를 표시할 위치
	        title : positions[i].title//, //마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        //image : markerImage //마커 이미지 
	    });
	}//f
}//onload

</script>

</head>
<body>

<div id="wrap">
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width: 600px; height: 500px;"></div>

</div>

</body>
</html>