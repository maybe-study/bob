<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 삭제 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <style>
	h1{
	text-align: center;
	}
	th{
padding: 10px;
border-bottom: 3px solid #168;
}
#brtb{
text-align: center;
width: 70%;
margin: auto;
border-collapse: collapse;
}
.brt{
height: 40px;
}
#delbtn{
color: #fff !important;
clear:right;
text-transform: uppercase;
text-decoration: none;
background: #ff7300;
padding-right: 20px;
padding-left: 20px;
padding-top:5px;
padding-bottom:5px;
margin-left:330px;
margin-bottom:10px;
margin-top:5px;
border-radius: 5px;
display: inline-block;
border: none;
transition: all 0.4s ease 0s;
}
#brcancel1{
color: #fff !important;
clear:right;
text-transform: uppercase;
text-decoration: none;
background: #ff7300;
padding-right: 20px;
padding-left: 20px;
padding-top:5px;
padding-bottom:5px;
margin-left:120px;
margin-bottom:10px;
margin-top:5px;
border-radius: 5px;
display: inline-block;
border: none;
transition: all 0.4s ease 0s;
}

 </style>
</head>
<body>
	<h1>지점 삭제</h1>
	<form action="delbranch" method="post">
		<div class="tab-content px-1 pt-2">
			<div class="tab-pane active" >${brListHtml}</div>

		</div>
		<div id= "btnd">
		<button id="delbtn">삭제하기</button>
		<td><input type="button" onclick="brcancel" id="brcancel1" value="관리자 화면으로 돌아가기">
				</td>
				</div>
	</form>
	<script>
	$("#brcancel1").on('click',function(){
		location.href = 'adminPage.jsp';
	});
	</script>
</body>
</html>