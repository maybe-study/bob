<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>관리자페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>밥버거</h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="addMenu.jsp">메뉴 추가</a></li>
					<li><a href="#">메뉴 삭제</a></li>
					<li><a href="#">매출 현황</a></li>
					<li><a href="#">지점 추가</a></li>
					<li><a href="#">지점 삭제</a></li>
				</ul>
				<br>
				<div class="input-group">
					<input type="text" class="form-control" placeholder="검색">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>

			<div class="col-sm-9">
				<h4>
					<small>본점</small>
				</h4>
				<hr>
				<h2>조진우</h2>

				<h5>
					<span class="label label-danger">Food</span> <span
						class="label label-primary">Ipsum</span>
				</h5>
				<br>

				<hr>
				<h2>살려줘...</h2>

				<h5>
					<span class="label label-success">제발...</span>
				</h5>
				<br>

				<hr>

				<h4>기록</h4>
				<form role="form">
					<div class="form-group">
						<textarea class="form-control" rows="3" required></textarea>
					</div>
					<button type="submit" class="btn btn-success">Submit</button>
				</form>
				<br>
				<br>

				
				<br> <br>
			</div>
		</div>
	</div>

</body>
</html>
