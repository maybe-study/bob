<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>

<h2>주문 페이지</h2>

<div id="order"></div>
<script>
var $table=$("<table>").appendTo($("#order"));

$table.attr("id","list");

for(var i=0;i<10;i++){
	var $tr=$("<tr>").appendTo($table);
	var txt="";
	txt+="<tr>"
	for(var j=0;i<5;j++){
     txt+=""
	}
	
}

</script>

<button href=cart>장바구니</button>
</body>
</html>