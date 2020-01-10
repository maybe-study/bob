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
	new daum.Postcode({
		oncomplete : function(data) {
		}
	}).open();
</script>

<style>
h1 {
	font-weight: bold;
	font-family: system-ui;
}
</style>
</head>
<body>
	<form action="addbranchfrm">
		<h1>지점추가</h1>
		<tr>
			<td>지점명</td>
			<br>
			<td><input type="text" id="name" name="branchname" /></td>
			<br>
		</tr>
		<tr>
			<td>지점 아이디</td>
			<br>
			<td><input type="text" id="id" name="branchid"/></td>
			<br>
		</tr>
		<tr>
			<td>지점 비밀번호</td>
			<br>
			<td><input type="password" id="pw" name="branchpw" /></td>
			<br>
		</tr>
		지점주소<br> <input type="text" id="sample4_postcode"
			placeholder="우편번호" name="branchaddress"> <input type="button"
			onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
		<span id="guide" style="color: #999; display: none"></span> <input
			type="text" id="sample4_detailAddress" placeholder="상세주소"> <input
			type="text" id="sample4_extraAddress" placeholder="참고항목"><br>
		<tr>
			<td>지점 설명</td>
			<br>
			<td><textarea rows="5" cols="30" name="explain" ></textarea></td>
			<br>
		</tr>
		<tr>
			<td><button>지점 등록</button></td>
			<td><input type="button" id="cancel1" onclick="cancel1"
				value="지점등록 취소" /></td>
			<td></td>
		</tr>
	</form>
</body>


<script>
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
					}
				}).open();
	}
	$("#cancel1").on('click', function() {
		location.href = "adminPage.jsp"
	});
</script>
</html>