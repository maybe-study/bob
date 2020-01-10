<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <input type="text" id="search"><button onclick="searchLocation();">검색</button>
 <div id="map" style="width: 500px; height:400px;"></div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 appkey사용&libraries=services"></script>
<script type="text/javascript">
var ps = new daum.maps.services.Places();
var infowindow = new daum.maps.InfoWindow({zIndex:1});
var container = document.getElementById('map');
var options = {
		center : new daum.maps.LatLng(33.450701, 126.570667),
		level: 3
};
var map = new daum.maps.Map(container,options);

function searchLocation(){
	var loc=$('#search').val();
	ps.keywordSearch(loc, placesSearchCB);
}

function placesSearchCB (data, status, pagination){
	if(status === daum.maps.services.Status.OK){
		
		var bounds =new daum.maps.LatLngBounds();
		
		for (var i=0; i<data.length; i++){
			displayMarker(data[i]);
			bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
		}
		map.setBounds(bounds);
		
	}
}

function displayMarker(place){
	
	var marker = new daum.maps.Marker({
		map: map,
		position: new daum.maps.LatLng(place.y, place.x)
	});
	daum.maps.event. addListener(marker,'click', function(){
		infowindow.setContent('<div style="padding:5px;font-size:12px;>'+place.place_name+'</div>');
		infowindow.open(map,marker);
	});
}
</script>
</html>