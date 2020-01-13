<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 삭제 페이지</title>
</head>
<body>
	<h1>지점 삭제</h1>
	<form action="delbranch" method="post">
		<ul class="nav nav-tabs">
			<li class="breanch-kind"><a class="nav-link active" href="#tab1"
				data-toggle="tab">일반</a></li>
			<li class="breanch-kind"><a class="nav-link" href="#tab2"
				data-toggle="tab">고기</a></li>
			<li class="breanch-kind"><a class="nav-link" href="#tab3"
				data-toggle="tab">튀김</a></li>
			<li class="breanch-kind"><a class="nav-link" href="#tab4"
				data-toggle="tab">떡갈비</a></li>
		</ul>
		<div class="tab-content px-1 pt-2">
			<div class="tab-pane active" id="tab1">${brListHtmln}</div>
			<div class="tab-pane" id="tab2">${brListHtmlm}</div>
			<div class="tab-pane" id="tab3">${brListHtmlt}</div>
			<div class="tab-pane" id="tab4">${brListHtmltt}</div>
		</div>
		<button>삭제하기</button>
	</form>
</body>
</html>