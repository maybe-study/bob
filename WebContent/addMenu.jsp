<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가 페이지</title>
<style>
table{
width:100%;
border: solid black 1px;
}
tr,td{
	padding:10px;
}
h1{
text-align: center;
}
form{
border:1px solid #ccc;
 margin:auto;
 height:50%;
 width:610px;
 padding:30px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form action="addmenu" method="post" enctype="multipart/form-data" name="addmenu">
		<table>
		<tr>
			<td colspan="2" align="center" style="font-size:20px;">메뉴 추가</td>
		</tr>
		<tr>
			<td>메뉴명</td><td><input type="text" name="bobname"></td>
		</tr>
		<tr>
			<td>가격</td><td><input type="text" name="cost"></td>
		</tr>
		<tr>
			<td>메뉴설명</td><td><textarea cols="40" rows="5" name="explanation"></textarea></td>
		</tr>
		<tr>
			<td>종류</td>
			<td>
				<select name="kind">
				    <option value="일반">일반</option>
				    <option value="고기">고기</option>
				    <option value="튀김">튀김</option>
				    <option value="떡갈비">떡갈비</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>사진</td><td><input type="file"name="p_file"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" onclick="subbtn" id="subbtn1"
					value="상품등록" />
				<input type="button"  id="canBtn1" onclick="canBtn" value="등록취소">
			</td>
		</tr>
		
	</table>
	</form>
	<script>
	$("#subbtn1")
	.on(
			'click',
			function() {
				var addmenu = document.addmenu; //joinForm=form 태그의 name값
				var bobname = addmenu.bobname.value;
				var cost = addmenu.cost.value;
				var explanation = addmenu.explanation.value;
				var p_file = addmenu.p_file.value;

				if(!bobname){
					alert("메뉴명을 입력해주세요");
				}else if(!cost){
					alert("가격을 입력해주세요");
				}else if(!explanation){
					alert("메뉴설명을 입력해주세요")
				}else if(!p_file){
					alert("사진을 넣어주세요");
				} else {
					alert("상품등록이 완료되었습니다.");
					addmenu.submit();
				}
			});
	$("#canBtn1").on('click',function(){
		location.href = 'adminPage.jsp';
	});
	</script>
</body>
</html>