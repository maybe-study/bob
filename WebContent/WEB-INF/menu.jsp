<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post">
<table id="menu">
<tr>
<td>밥버거 사진</td>
<td>밥버거 이름</td>
<td>가격</td>
<td>설명</td>
</tr>
</table>
</form>
<script>
var json=${makeMyProduct};
var str="";
$.each(json,function(key,value){
	str+="<tr>";
	str+="<td><img src='upload/"+json[key].Pic+"'></td>";
	str+="<td>"+json[key].bobname+"</td>";
	str+="<td>"+json[key].cost+"원</td>";
	str+="<td>"+json[key].explanation+"</td>";
	str+="</tr>";
})
</script>
</body>
</html>