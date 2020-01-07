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
.joindiv{
margin:20px;
background-color: #FAFAFA;
width:600px;
height:70px;
}
.joinbtn{
position:relative;
left: 340px;
background-color:#FFAD07;
display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	text-decoration:none;
}
.joinbtn:hover {
	background-color:#ffcb0e;
}
.joinbtn:active {
	position:relative;
	top:1px;
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
<form action="loginfrm" name="loginfrm" method="post">
<table>
<tr>
<td><input type="text" placeholder="아이디" /> </td>
<td rowspan="2"><button  class='loginbtn'>로그인</button></td>
</tr>
<tr>
<td><input type="text" placeholder="비밀번호" /> </td>
</tr>
<img src="./img/delicious.PNG" alt="delicious" id="img2" />
</table>
</form>
</div>
<div class="joindiv">
<form action="joinfrm" name="joinfrm" method="post">
<table>
<tr>
<td><h3>회원이 아니신가요?</h3> </td>
<td>
<a href="joinForm.jsp"></a><button class="joinbtn">회원가입</button>
</td>
</tr>
</table>
</form>
</div>
</body>
</html>