<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="bobbugersmenu">
		<img alt="img" src="./img/menu1.PNG" class="bobbugersmenu"><br>
		<img alt="img" src="./img/menu2.PNG" class="bobbugersmenu" style="top: 800px"><br> 
		<img alt="img" src="./img/menu3.PNG" class="bobbugersmenu" style="top: 1600px"><br>

	</div>

</body>
<script type="text/javascript">
	function div2Resize() {
		var div2 = document.getElementById('bobbugersmenu');
		div2.style.height = document.body.scrollHeight + 'px';
	}
	window.onload = function() {
		div2Resize();

		// 브라우저 크기가 변할 시 동적으로 사이즈를 조절해야 하는경우
		window.addEventListener('resize', div2Resize);
	}
</script>
</html>