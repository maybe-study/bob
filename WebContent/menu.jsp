<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴안내</title>
</head>
<style>
#Order{

}
</style>
<body>
<h1>메뉴 테스트</h1>
<div id="Order">
<a href="order"><button>장바구니</button></a>
</div>

<div id="menubobbugers">
        <img alt="img" src="img/menu1.PNG" class="menubobbugers"><br>
		<img alt="img" src="img/menu2.PNG" class="menubobbugers" style="top:800px"><br>
		<img alt="img" src="img/menu3.PNG" class="menubobbugers" style="top:1600px"><br>

</div>

<script type="text/javascript">
        function divResize() {
        	var div1=document.getElementById("menubobbugers");
            div1.style.height = document.body.scrollHeight+ 'px';
            
        }
        window.onload = function() {
            divResize();
 
            // 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
            window.addEventListener('resize', divResize);
        }
        
        
</script>
</body>

</html>