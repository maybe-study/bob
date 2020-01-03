<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	table{
		
	}
	td{
		border: 1px solid black;
		padding:10px;
	}

</style>
</head>
<body>
<div id="showList">
	
</div>
<script>
console.log("테이블을 만드는 함수");
var $table = $("<table>").appendTo($("#showList"));
$table.attr("id", "list");	//아이디가 list인 테이블

for(var i=0;i<10;i++){
	//행을 붙임
	var $tr=$("<tr>").appendTo($table);
	for(var j=0;j<10;j++){
		var $img=$("<img>").attr("src","img/buger01.jpg");
		$("<td>").append($img).appendTo($tr);
	}
}
console.log($table);
</script>
</body>
</html>