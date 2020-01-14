<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://www.w3schools.com/lib/w3data.js"></script>

  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>봉구스밥버거</title>
<style>
html, body {
            margin: 0;
            width: 100%;
            height: 100%;
}
.menuimg{
width : 100px;
height: 100px;
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
text-align:center;
float:left;
width:200px;
height:100%;
background-color: #fcfcfc;
}
#mainmenu li a{
color:black;
text-decoration:none;
}
#mainmenu ul li{
float:none;
margin:10px 0px;

}
#header{
	top:0px;
	left:400px;
	position:absolute;
	display: inline-block;
}
#main{
	top:100px;
	left:400px;
	position:absolute;
	display: inline-block;
}
#maindiv{
	position:relative;
}
#myCarousel{
	top:100px;
	left:400px;
	position:absolute;
	display: inline-block;
}
.slideimg{
	width:1000px;
	height:500px;
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
					<li><a href="menu">메뉴안내</a></li>
				</ul></li>
		</ul>
		<ul>
			<li><a href="orderfrm">주문하기</a>
				<ul>
					<li><a href="orderconfirm">주문내역</a></li>
				</ul></li>
		</ul>
		<ul>
			<li><a href="#">지점안내</a>
				<ul>
					<li><a href="#">전국지점안내</a></li>
				</ul>
			</li>
		</ul>
		<ul>
			<li><a href="#">지점</a>
				<ul>
					<li><a href="#">전국지점안내</a></li>
				</ul>
			</li>
		</ul>
		</div>





		<div id="submenu">
		
		<a href="login.jsp"><img alt="img" src="./img/logingimg.PNG" class="menuimg"/></a>
		<a href="Branchlogin.jsp"><img alt="img" src="./img/brlogimg.PNG" class="menuimg"/></a>
		<a href="joinForm.jsp"><img alt="img" src="./img/joinimg.PNG" class="menuimg"/></a>
		<a href="#"><img alt="img" src="./img/faceimg.PNG" class="menuimg"/></a>
		<a href="#"><img alt="img" src="./img/blogimg.PNG" class="menuimg"/></a>
		
		</div>
		</div>
		<div id="header">
		<%if(session.getAttribute("id")==null){%>
			<h1>로그인 해주세요</h1>
		<% }else{%>
			<h1>${id}님 반갑습니다.</h1>
			<h6><a href="logout">로그아웃</a></h6>
		<%} %>
		
		</div>
		<div class="container">
		  <div id="myCarousel" class="carousel slide" data-ride="carousel">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		      <div class="item active">
		        <img class="slideimg" src="img/tmp_slide00.jpg" alt="Los Angeles" >
		      </div>
		
		      <div class="item">
		        <img class="slideimg" src="img/king.PNG" alt="Chicago" >
		      </div>
		    
		      <div class="item">
		        <img class="slideimg" src="img/delicious.PNG" alt="New york" >
		      </div>
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
		</div>
		<!--
		<img alt="img" src="./img/img1.PNG" class="bobbugers"><br>
		<img alt="img" src="./img/img2.PNG" class="bobbugers" style="top:800px"><br>
		<img alt="img" src="./img/img3.PNG" class="bobbugers" style="top:1600px"><br>
 		-->







<script type="text/javascript">

        function divResize() {
        	var div1=document.getElementById('submenu');
            var div2 = document.getElementById('mainmenu');
            div1.style.height = document.body.scrollHeight+ 'px';
            div2.style.height = document.body.scrollHeight+ 'px';
        }
        window.onload = function() {
            divResize();

            // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
            window.addEventListener('resize', divResize);
        }

        var main=document.getElementById('main');
	
        
        
        
        
        //로그인 되있는지 확인 하는 스크립트
        
</script>

</body>
</html>
