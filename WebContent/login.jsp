<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
#img2{
width:250px;
position: absolute;
left: 340px;
}
.textdiv{
margin:20px;
padding-top:50px;
background-color: #FAFAFA;
width:600px;
height:200px;
}
.loginbtn {
	background-color:#FFAD07;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:15px 29px;
	text-decoration:none;
}
.loginbtn:hover {
	background-color:#ffcb0e;
}
.loginbtn:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body>
<h1>로그인 </h1>
<div class="textdiv">
<img src="./img/welcome.png" alt="welcome" id="img1"/>
<table>
<tr>
<td><input type="text" placeholder="아이디" /> </td>
<td rowspan="2"><button class='loginbtn'>로그인</button></td>
</tr>
<tr>
<td><input type="text" placeholder="비밀번호" /> </td>
</tr>
<img src="./img/delicious.PNG" alt="delicious" id="img2" />
</table>

</div>
<div>
<table>
<tr>
<td>
<a href="joinForm.jsp"><button>회원가입</button></a>
</td>
</tr>
</table>
</div>
</body>
</html>