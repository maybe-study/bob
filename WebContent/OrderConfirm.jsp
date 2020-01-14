<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
h1{
          font-weight:bold;
          font-family:system-ui;
          }
div{
 border:1px solid;
 width:300px;
}
th,td{
border:1px solid;
}
</style>
<body>
<h1>주문 확인 페이지</h1>
${odList }

</body>
<script>

$(function(){
	$('.menutr').hide();
})

$('.menubtn').each(function(index,item){
	console.log(index,item);
	console.dir(item);
	item.onclick=function(){
		var menutr=document.getElementsByClassName("menutr");
		
		console.log($(menutr[index]));
       $(menutr[index]).toggle();
    }
});
</script>
</html>