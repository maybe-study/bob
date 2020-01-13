<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form action="addmenu" method="post" enctype="multipart/form-data">
		<table>
		<tr>
			<td colspan="2" align="center">메뉴 추가</td>
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
				<button id="addBtn">상품등록</button>
				<input type="button"  id="canBtn1" onclick="canBtn" value="등록취소">
			</td>
		</tr>
		
	</table>
	</form>
	<script>
	$("#canBtn1").on('click',function(){
		location.href = 'adminPage.jsp';
	});
	</script>
</body>
</html>