<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 접수 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
table,tr,td{
border: 1px black solid;
}
</style>
</head>
<body>
<h1>접수된 주문</h1>

	<ul class="nav nav-tabs">
		<li class="nav-item">
		<a class="nav-link active" href="#tab1" data-toggle="tab">들어온 주문</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="#tab2" data-toggle="tab">배달된 주문</a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="index.jsp">메인으로 돌아가기</a>
		</li>
	</ul>
	<form action="orderrecieveu" method="post">
	<div class="tab-content px-1 pt-2">
		<div class="tab-pane active" id="tab1">${oListr}<button>배달 완료</button></div>
		<div class="tab-pane" id="tab2">${oListc}</div>
		
	</div>
	</form>
	<script>
	function aj(){
		
		$.ajax({
			type: 'POST',
			url: 'recieveref',
			success: function(html){
				console.log("성공:"+html);
				$("#tab1").html(html);
				console.log("1")
				
			},error:function(){
				console.log("실패");
			}
		
		});
	}
	window.setInterval("aj()",3000);
		
// 		setTimeout(function(){
// 			location.reload();
// 			aj();
// 			console.log("실행되는지");
// 		},3000);
	
	</script>
</body>
</html>