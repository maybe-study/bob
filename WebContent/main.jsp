<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉구스밥버거</title>
<style>
html, body {
            margin: 0;
            width: 100%;
            height: 100%;
        }
#menu{
	position: relative;
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
#mainmenu li a{
color:black;
text-decoration:none;
}
#mainmenu ul li{

float:none;
margin:10px 0px;

}
.bobbugers{
	width: 1000px;
	height: 800px;
	position: absolute;
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
				</ul>
			</li>
		</ul>
		</div>
		
		
		
		
		
		<div id="submenu">
		<ul>
		<li><a href="#">로그인</a></li>
		</ul>
		</div>
		
		<img alt="img" src="./img/img1.PNG" class="bobbugers"><br>
		<img alt="img" src="./img/img1.PNG" class="bobbugers" style="top:800px"><br>
		<img alt="img" src="./img/img1.PNG" class="bobbugers" style="top:1600px"><br>

		
		
		</div>
		
		
		
		
		
		
		
<script type="text/javascript">
        function div2Resize() {
            var div2 = document.getElementById('mainmenu');
            div2.style.height = document.body.scrollHeight+ 'px';
        }
        window.onload = function() {
            div2Resize();
 
            // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
            window.addEventListener('resize', div2Resize);
        }
        
        
</script>		
</body>
</html>
