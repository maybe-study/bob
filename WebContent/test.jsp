<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    <script
  src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04cfe5f1eb29416b59e4313a6acea9b8&libraries=services"></script>
<script>
function myMarkers(){
	console.log("getAdresses");
	$.ajax({ 
		type: "GET", 
		url: 'getadds',
		success: function(json){
			var listData=[];
			
			$.each(json, function(index, item){
				console.log(item);
				var data= { 
						title : item.branchname, 
						groupAddress : item.branchaddress
				};
				listData.push(data);
				
			})
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new daum.maps.services.Geocoder();
			
			console.log(listData);
			
		}, 
		error:function(error){
			console.log(error);
		},
		dataType: 'json'
	});
}
	
	
	myMarkers();
</script>
</body>
</html>