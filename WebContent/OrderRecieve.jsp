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
	
	<div class="tab-content px-1 pt-2">
		<div class="tab-pane active" id="tab1"><button>배달 완료</button></div>
		<div class="tab-pane" id="tab2">${oListc}</div>
		
	</div>
	
	<script>
	function makeTable(json){
		$("#tab1").html(json.rList);
		$("#tab2").html(json.dList);
		//버튼에다가 추가해야돼
		$('.combtn').each(function(index,item){
			var bId=item.getAttribute('id');
			console.log("버튼 아이디:"+bId);
			console.log(index,item);
			console.dir(item);
			item.onclick=function(){
				var bId=item.getAttribute('id');
				deliveryAj(bId);
		    }
		});
	}
	function deliveryAj(bId){
		$.ajax({
			type: 'POST',
			url: 'delivery?bid='+bId,
			dataType:'json',
			success: function(json){
				console.log("성공:",json);
				makeTable(json);
			},error:function(err){
				console.log(err);
			}
		
		});
	}
	function aj(){
		$.ajax({
			type: 'POST',
			url: 'refresh',
			dataType:'json',
			success: function(json){
				console.log("성공:",json);
				
				makeTable(json);
				
			},error:function(err){
				console.log(err);
			}
		
		});
	}
	
	aj();
	window.setInterval("aj()",3000);
		
// 		setTimeout(function(){
// 			location.reload();
// 			aj();
// 			console.log("실행되는지");
// 		},3000);
	
	</script>
</body>
</html>