<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
#menubody {
	list-style: none;
	float: left;
}
</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="menu-kind"><a class="nav-link active" href="#tab1"
			data-toggle="tab">일반</a></li>
		<li class="menu-kind"><a class="nav-link" href="#tab2"
			data-toggle="tab">고기</a></li>
		<li class="menu-kind"><a class="nav-link" href="#tab3"
			data-toggle="tab">튀김</a></li>
		<li class="menu-kind"><a class="nav-link" href="#tab4"
			data-toggle="tab">떡갈비</a></li>
		<li class="menu-kind"><a class="nav-link" href="index.jsp">메인으로 돌아가기</a>
				
		</li>
	</ul>
	<div class="tab-content px-1 pt-2">
		<div class="tab-pane active" id="tab1">${mListHtmln}</div>
		<div class="tab-pane" id="tab2">${mListHtmlm}</div>
		<div class="tab-pane" id="tab3">${mListHtmlt}</div>
		<div class="tab-pane" id="tab4">${mListHtmltt}</div>

	</div>
</body>
</html>