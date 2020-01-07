<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점 로그인</title>
<style>
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
.textdiv{
padding:50px;
background-color: #FAFAFA;
width:300px;
height:60px;
}
</style>
</head>
<body>
<h1>지점 로그인 </h1>
<div class="textdiv">
<table>
<tr>
<td><input type="text" placeholder="아이디" /> </td>
<td rowspan="2"><button class="loginbtn">로그인</button></td>
</tr>
<tr>
<td><input type="text" placeholder="비밀번호" /> </td>
</tr>
</table>
</div>
</body>
</html>