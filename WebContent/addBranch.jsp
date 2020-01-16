<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
</script>

<style>
h1 {
	font-weight: bold;
	font-family: system-ui;
}

#dout {
	position: relative;
}

#din {
	width: 430px;
	border: solid black 1px;
	position: absolute;
	left: 36%;
}


#name {
	width: 175px;
	height: 17px;
	margin-left: 50px;
	margin-bottom: 8px;
}

#id {
	width: 175px;
	height: 17px;
	margin-left: 12px;
	margin-bottom: 8px;
}
#pw{
width: 175px;
	height: 17px;
	margin-left: -4px;
	margin-bottom: 8px;
}
#sample4_postcode {
	width: 175px;
	height: 17px;
	margin-left: 34px;
	margin-bottom: 8px;
}

#sample4_roadAddress {
	width: 175px;
	height: 17px;
	margin-left: 7px;
	margin-bottom: 8px;
}

#sample4_jibunAddress {
	width: 175px;
	height: 17px;
	margin-left: 21px;
	margin-bottom: 8px;
}

#sample4_detailAddress {
	width: 175px;
	height: 17px;
	margin-left: 7px;
	margin-bottom: 8px;
}

#sample4_extraAddress{
width: 175px;
	height: 17px;
	margin-left: 21px;
	margin-bottom: 8px;
}
#explain{
width: 98%;
	height: 123px;
	margin-left: 1px;
	margin-bottom: 8px;
}

h1 {
	text-align: center;
}

#sbtn {
	color: #fff !important;
	text-transform: uppercase;
	text-decoration: none;
	background: #ff7300;
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	margin-left:83px;
	margin-bottom: 10px;
	margin-top: 5px;
	border-radius: 5px;
	display: inline-block;
	border: none;
	transition: all 0.4s ease 0s;
}

#cancel1 {
	color: #fff !important;
	text-transform: uppercase;
	text-decoration: none;
	background: #ff7300;
	padding-right: 20px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 5px;
	margin-left:50px;
	margin-bottom: 10px;
	margin-top: 5px;
	border-radius: 5px;
	display: inline-block;
	border: none;
	transition: all 0.4s ease 0s;
}
</style>
</head>
<body>
	<form id="fmField" name="fmField" action="addbranchfrm" method="post"
		onsubmit="return checkForm();">
		<div id="dout">
			<div id="din">
				<h1>지점추가</h1>
				<tr>
					<td>지점명:</td>

					<td><input type="text" id="name" name="branchname" /></td>
					<br>
				</tr>
				<tr>
					<td>지점 아이디:</td>

					<td><input type="text" id="id" name="branchid" /></td>
					<br>
				</tr>
				<tr>
					<td>지점 비밀번호:</td>

					<td><input type="password" id="pw" name="branchpw" /></td>
					<br>
				</tr>
				지점주소: <input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기"><br> <input type="text"
					id="sample4_roadAddress" placeholder="도로명주소" name="branchaddress">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
				<span id="guide" style="color: #999; display: none"></span> <input
					type="text" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br>
				<tr>
					<td>지점 설명:</td>
					<br>
					</tr>
					<tr>
					<td><textarea cols="3" rows="3" id="explain" name="explain"></textarea></td>
					<br>
				</tr>
				<tr>
					<td><input type="submit" id="sbtn" value="지점 등록"></td>
					<td><input type="button" id="cancel1" onclick="cancel1"
						value="지점등록 취소" /></td>
					<td></td>
				</tr>
			</div>
		<div id="map" style="width: 100%; height: 350px; top: 500px;"></div>
</div>
	</form>

	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=04cfe5f1eb29416b59e4313a6acea9b8&libraries=services"></script>
	<script>
		
	</script>
</body>


<script>
	function checkForm() {
		var branchId = document.getElementById("id");
		var branchName = document.getElementById("name");
		var branchPw = document.getElementById("pw");
		var branchAddress = document.getElementById("sample4_roadAddress");
		if (branchId.value == '') {
			window.alert("아이디를 입력하시오");
			document.fmField.branchid.focus();
			//branchId.select();
			return false;
		}
		if (branchName.value == '') {
			window.alert("이름을 입력하시오");
			document.fmField.branchname.focus();

			return false;
		}
		if (branchPw.value == '') {
			window.alert("비밀번호를 입력하시오");
			document.fmField.branchpw.focus();

			return false;
		}
		if (branchAddress.value == '') {
			window.alert("주소를 입력하시오");
			document.fmField.branchaddress.focus();

			return false;
		}
		return true;

	}

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_roadAddress").value = roadAddr;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder
								.addressSearch(
										roadAddr,
										function(result, status) {

											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords
														});

												// 인포윈도우로 장소에 대한 설명을 표시합니다
												var infowindow = new kakao.maps.InfoWindow(
														{
															content : '<div style="width:150px;text-align:center;padding:6px 0;">'
																	+ roadAddr
																	+ '</div>'
														});
												infowindow.open(map, marker);

												// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
												map.setCenter(coords);
											}
										});

					}

				}).open();
	}
	$("#cancel1").on('click', function() {
		location.href = "adminPage.jsp"
	});
</script>
</html>