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
#ceo{
	margin-top:-750px;
	margin-left:270px;
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
    width:170px;
    height:100%;
	background-color: #ffa901;
	color: white;
	}
#submenu{
text-align:center;
float:left;
width:70px;
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
.listname{
   font-size:20px;
   cursor: pointer;
 }

</style>
</head>
<body>
	<div id="menu">
		
		<div id="mainmenu">
		<img src="./img/logo.PNG" alt="logo" width=100% > 
		<ul>
			<li class='list'>
				<a class='listname'>회사소개</a>
				<ul class="hide">
					<li><a href="javascript:Aj('ceo','#main')">CEO인사말</a></li>
					<li><a href="javascript:Aj('bongbob','#main')">봉구스밥버거</a></li>
					<li><a href="javascript:Aj('history','#main')">회사연혁</a></li>
					<li><a href="javascript:Aj('way','#main')">오시는길</a>
				</ul>
			</li>
			<br>
			<li class='list'>
				<a class='listname'>메뉴안내</a>
				<ul class="hide">
					<li><a href="menu">메뉴안내</a></li>
				</ul>
			</li>
		    <br>
			<li class='list'>
				<a class='listname'>메뉴주문</a>
				<ul class="hide">
				    <li><a href="orderfrm">주문하기</a></li>
					<li><a href="orderconfirm">주문내역</a></li>
				</ul>
			</li>
		   <br>
		   <li class='list'>
				<a class='listname'>지점안내</a>
				<ul class="hide">
					<li><a href="mapfrm">전국지점안내</a></li>
				</ul>
			</li>
		</ul>
		
		</div>





		<div id="submenu">
		<%if(session.getAttribute("id")==null){%>
			<a href="login.jsp"><img alt="img" src="./img/logingimg.PNG" class="menuimg"/></a>
		<% }else{%>
			<a href="logout"><img alt="img" src="./img/logoutimg.PNG" class="menuimg"/></a>
		<%} %>
		
		<a href="Branchlogin.jsp"><img alt="img" src="./img/brlogimg.PNG" class="menuimg"/></a>
		<a href="joinForm.jsp"><img alt="img" src="./img/joinimg.PNG" class="menuimg"/></a>
		<a href="https://www.facebook.com/qkqqjrj"><img alt="img" src="./img/faceimg.PNG" class="menuimg"/></a>
		<a href="https://blog.naver.com/bong_bab"><img alt="img" src="./img/blogimg.PNG" class="menuimg"/></a>
		
		</div>
		</div>
		
		
		<div id="header">
		<%if(session.getAttribute("id")==null){%>
			<h1>로그인 해주세요</h1>
		<% }else{%>
			<h1>${id}님 반갑습니다.</h1>
		<%} %>
		
		</div>
		<div class="container" id="main">
		<div id="slide">
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
	
        $(function(){
        	var subli=$(".list>b").next("ul");
        	sunli.hide();
        }) 
       $(document).ready(function(){
    	 $(".list>a").click(function(){
    		$(this).next("ul").toggleClass("hide");
    	
    		
    	 })  ;
       });
       
       
        
        
        //로그인 되있는지 확인 하는 스크립트
    Aj("newItem","#main");    
     function Aj(url, position) {
	$.ajax({
		url: url,
		type: "get",
		//data:
		dataType: "html", //
		success: function(page) {
			$(position).html('<div id="ceo">'+page+'</div>');
		},
		error: function(error) {
			console.log(error);
		}
	}) //ajax End
}  //Aj 

        
</script>

</body>
</html>
