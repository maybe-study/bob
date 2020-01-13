<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 삭제 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <style>
 table,tr,td{
 border: 1px black solid;
 border-collapse: collapse;
 }
 </style>
</head>
<body>
	<h1>지점 삭제</h1>
	<form action="delbranch" method="post">
		<div class="tab-content px-1 pt-2">
			<div class="tab-pane active" >${brListHtml}</div>

		</div>
		<button>삭제하기</button>
		<td><input type="button" onclick="brcancel" id="brcancel1" value="관리자 화면으로 돌아가기">
				</td>
	</form>
	<script>
	$("#brcancel1").on('click',function(){
		location.href = 'adminPage.jsp';
	});
	</script>
</body>
</html>