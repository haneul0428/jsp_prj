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
	//map 사용
	var mapContainer = document.getElementById('map'), //지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(37.499294, 127.0331883), //지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	//지도를 표시할 div와 지도 옵션으로 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	//마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.499294, 127.0331883);
	
	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	//아래 코드는 지도 위의 마커를 제거하는 코드입니다
	//marker.setMap(null);
	
	var iwContent = '<div style="padding:5px;">쌍용교육센터!<br><a href="http://sist.co.kr" style="color:blue" target="_blank">홈페이지</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.499294, 127.0331883); //인포윈도우 표시 위치입니다

	//인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);
});//ready()
/* 
window.onload = function() {
	
}
*/
</script>

</head>
<body>

<div id="wrap">
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width: 600px; height: 500px;"></div>

</div>

</body>
</html>