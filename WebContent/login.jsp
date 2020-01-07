<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
.textdiv{
background-color: #E1E1E1;
width:500px;
height:300px;
}
</style>
</head>
<body>
<h1>로그인 </h1>
<div class="textdiv">
<table>
<tr>
<td><input type="text" placeholder="아이디" /> </td>
<td rowspan="2"><button>로그인</button></td>
</tr>
<tr>
<td><input type="text" placeholder="비밀번호" /> </td>
</tr>
</table>
</div>
<table>
<tr>
<td>
<a href="joinForm.jsp"><button>회원가입</button></a>
</td>
</tr>
</table>
</body>
</html>