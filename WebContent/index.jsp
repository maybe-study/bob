<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://www.w3schools.com/lib/w3data.js"></script>
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
#main{
	top:0px;
	position:absolute;
	display: inline-block;
}
#maindiv{
	position:relative;
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
		<a href="login.jsp"><img alt="img" src="./img/logingimg.PNG" class="menuimg"></a>
		<a href="#"><img alt="img" src="./img/brlogimg.PNG" class="menuimg"></a>
		<a href="joinForm.jsp"><img alt="img" src="./img/joinimg.PNG" class="menuimg"></a>
		<a href="#"><img alt="img" src="./img/faceimg.PNG" class="menuimg"></a>
		<a href="#"><img alt="img" src="./img/blogimg.PNG" class="menuimg"></a>
		</ul>
		</div>
		</div>

		<div id="main" w3-include-html="main.jsp"></div>
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

</script>
<script>
    function includeHTML() {
      var z, i, elmnt, file, xhttp;
      /*loop through a collection of all HTML elements:*/
      z = document.getElementsByTagName("*");
      for (i = 0; i < z.length; i++) {
        elmnt = z[i];
        /*search for elements with a certain atrribute:*/
        file = elmnt.getAttribute("w3-include-html");
        if (file) {
          /*make an HTTP request using the attribute value as the file name:*/
          xhttp = new XMLHttpRequest();
          xhttp.onreadystatechange = function() {
            if (this.readyState == 4) {
              if (this.status == 200) {
            	  elmnt.innerHTML = this.responseText;
              }
              if (this.status == 404) {elmnt.innerHTML = "Page not found.";}
              /*remove the attribute, and call this function once more:*/
              elmnt.removeAttribute("w3-include-html");
              includeHTML();
            }
          }
          xhttp.open("GET", file, true);
          xhttp.send();
          /*exit the function:*/
          return;
        }
      }
    }
    includeHTML();
</script>

</body>
</html>
