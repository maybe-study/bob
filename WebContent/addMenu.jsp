<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	<table border="1px">
		<tr>
			<td colspan="2">메뉴 추가</td>
		</tr>
		<tr>
			<td>메뉴명</td><td><input type="text" name="bobname"></td>
		</tr>
		<tr>
			<td>가격</td><td><input type="text" name="cost"></td>
		</tr>
		<tr>
			<td>메뉴설명</td><td><textarea cols="40" rows="5" name="deplanation"></textarea></td>
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
			<td>사진</td><td><input type="text" name="pic"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button id="addBtn">상품등록</button><button id="canBtn">등록취소</button>
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>