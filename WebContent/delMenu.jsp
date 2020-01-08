<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>

</style>
<body>
<h1>메뉴 삭제</h1>
<ul class="nav nav-tabs">
             <li class="menu-kind">
                 <a class="nav-link active" href="#tab1" data-toggle="tab">일반</a>
             </li>
             <li class="menu-kind">
                 <a class="nav-link" href="#tab2" data-toggle="tab">고기</a>
             </li>
             <li class="menu-kind">
                 <a class="nav-link" href="#tab3" data-toggle="tab">튀김</a>
             </li>
             <li class="menu-kind">
                 <a class="nav-link" href="#tab4" data-toggle="tab">떡갈비</a>
             </li>
            
            
         </ul>
         <div class="tab-content px-1 pt-2">
             <div class="tab-pane active" id="tab1">
                 ${mnListHtmln}
             </div>
             <div class="tab-pane" id="tab2">
             	${mnListHtmlm}
             </div>
             <div class="tab-pane" id="tab3">
             	${mnListHtmlt}
             </div>
             <div class="tab-pane" id="tab4">
             	${mnListHtmltt}
             </div>
         </div>
                   
    <button><a href="delmenu" ">삭제하기</a></button>
</body>


</html>