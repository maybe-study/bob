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
div{
width:500px;
height:500px;
border:1px solid;
}
</style>
<body>
<h1>메뉴 삭제</h1>
<button id="basic"><a href="javascript:Aj('basic','#menulist')">일반</a></button>
<button id="meat"><a href="javascript:Aj('meat','#menulist')">고기</a></button>
<button id="fri"><a href="javascript:Aj('fri','#menulist')">튀김</a></button>
<button id="duck"><a href="javascript:Aj('duck','#menulist')">떡갈비</a></button>
<div id="menulist"></div>


</body>
<script type="text/javascript">


if(${page==null}){
	Aj("basic","#menulist");
}else{
	Aj("${page}","#menulist");
}

function Aj(url,position){
	$.ajax({ 
		url:url,
		tyle:"get",
		dataTyle:"html",
		Success:function(page){
			$(position).html(page)
		},
	   error:function(error){
		   console.log(error);
	   }
	})
	
};
/* $("#basic").click(function(){
	$.ajax({
		url:"basic",
		type:"get",
		dataType:"html",
		success:function(page){
			$("#menulist").html(page);
		},
		error:function(error){
			console.log(error);
		}
	})
});
$("#meat").click(function(){
	$.ajax({
		url:"meat",
		type:"get",
		dataType:"html",
		success:function(page){
			$("#menulist").html(page);
		},
		error:function(error){
			console.log(error);
		}
	})
});
$("#fri").click(function(){
	$.ajax({

		url:"fri",
		type:"get",
		dataType:"html",
		success:function(page){
			$("#menulist").html(page);
		},
		error:function(error){
			console.log(error);
		}
	})
});
$("#duck").click(function(){
	$.ajax({

		url:"duck",
		type:"get",
		dataType:"html",
		success:function(page){
			$("#menulist").html(page);
		},
		error:function(error){
			console.log(error);
		}
	})
}); */
</script>
</html>