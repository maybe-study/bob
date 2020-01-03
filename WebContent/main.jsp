<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉구스밥버거</title>
<style>
#menu{
height:100%;
display:inline-block;
}
#mainmenu{
    float:left;
    width:200px;
    height:100%;
	background-color: #FFD016;
	color: white;
	}
#submenu{
float:left;
width:200px;
height:100%;
}	
li{
height:100%;

}
#mainmenu li a{

color:black;
text-decoration:none;
}
#mainmenu ul li{

float:none;
margin:0;
padding:0;

}

img {
	width: 1000px;
	height: 800px;
}
</style>
</head>
<body>

	
		
	<div id="menu">
		<div id="mainmenu">
		<ul>
			<li><a href="#">본점</a>
				<ul>
					<li><a href="#">CEO인사말</a></li>
					<li><a href="#">오시는길</a>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">메뉴안내</a>
				<ul>
					<li><a href="#">메뉴안내</a></li>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">주문하기</a>
				<ul>
					<li><a href="#">주문내역</a></li>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">지점안내</a>
				<ul>
					<li><a href="#">전국지점안내</a></li>
				</ul></li>
		</ul>
		</div>
		
		
		
		
		
		
		
		<div id="submenu">
		<ul>
		<li><a href="#">로그인</a></li>
		</ul>
		</div>
		
		<img alt="img" src="./img/img1.PNG" class=img1 align="right">
		
		
		
		</div>
		
</body>
</html>
