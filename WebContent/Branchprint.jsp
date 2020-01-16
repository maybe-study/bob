<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점출력페이지</title>
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
#dheader{
position: relative;
left: 81%;
top:10%;

}
#adminb{
color: #fff !important;
clear:right;
text-transform: uppercase;
text-decoration: none;
background: #ff7300;
padding-right: 20px;
padding-left: 20px;
padding-top:5px;
padding-bottom:5px;
margin-bottom:10px;
margin-top:5px;
border-radius: 5px;
display: inline-block;
border: none;
transition: all 0.4s ease 0s;
}
</style>
</head>
<style>

}
table,tr,td{
border:1px solid #ccc;
margin:auto;
 padding:30px;
 text-align: center;
}
form{
 border:1px solid #ccc;
 margin:auto;
 height:50%;
 width:900px;
 padding:30px;
 text-align: center;

}

</style>
<body>
<div >
<h1>모든 지점의 매출</h1>
</div>
<div id="dheader">
<a href="adminPage.jsp"><input type="button" id="adminb" class="adminb" value="관리자 페이지로 돌아가기"/></a>
</div>
${brtable}



</body>
</html>
