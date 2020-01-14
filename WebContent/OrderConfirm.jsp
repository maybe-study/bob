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
      text-align:center;
          }

.otd{
border-bottom:1px solid #ccc;
}
th{
padding:10px;
border-bottom:3px solid #168;
}
#odtb{
 text-align:center;
 width:70%;
 margin:auto;
 border-collapse:collapse;
}
#menutb{
 width:100%;
 text-align:center;
 margin:auto;
}
.menubtn{
color: #fff !important;
text-transform: uppercase;
text-decoration: none;
background: #ff7300;
padding-right: 20px;
padding-left: 20px;
padding-top:5px;
padding-bottom:5px;
margin-bottom:10px;
margin-top:5px;
border-radius: 5px;
display: inline-block;
border: none;
transition: all 0.4s ease 0s;
}
}
.otr{
height:40px;
}

</style>
<body>
<h1>주문 확인 페이지</h1>
${odList}

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