<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
div{
width:500px;
height:500px;
border:1px solid;
}
</style>
<body>
<h1>메뉴 삭제</h1>
<button id="basic"><a href="basic">일반</a></button>
<button id="meat"><a href="meat">고기</a></button>
<button id="fri"><a href="fri">튀김</a></button>
<button id="duck"><a href="duck">떡갈비</a></button>
<div id="menulist"></div>


</body>
<script>
$("#basic").click(function(){
	url:"basic", 
	type:"get",
	dataType:"html",
	success:function(page){
		$(div).html(page);
	},
	error:function(error){
		console.log(error);
	}
});
$("#meat").click(function(){
	url:"meat",
	type:"get",
	dataType:"html",
	success:function(page){
		$(div).html(page);
	},
	error:function(error){
		console.log(error);
	}
});
$("#fri").click(function(){
	url:"fri",
	type:"get",
	dataType:"html",
	success:function(page){
		$(div).html(page);
	},
	error:function(error){
		console.log(error);
	}
});
$("#duck").click(function(){
	url:"duck",
	type:"get",
	dataType:"html",
	success:function(page){
		$(div).html(page);
	},
	error:function(error){
		console.log(error);
	}
});
</script>
</html>